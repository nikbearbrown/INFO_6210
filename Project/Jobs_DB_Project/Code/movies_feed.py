# Movies feed file to sync the data from IMDB to local DB
import gzip
from tempfile import gettempdir

import pandas
import requests
from imdb import IMDb
from pymysql import connect

from models import Movie, Actor, Production, Genre, MovieActor, ProductionMovie, GenreMovie
from settings import *

db = connect(host=MYSQL_HOST, port=MYSQL_PORT, database=MYSQL_DB, user=MYSQL_USER, password=MYSQL_PWD)


class MovieFeed:
    """
    Movie feed to sync the IMDB movies to the local DB
    """

    def __init__(self, output_path):
        """
        Setup movie feed
        :param output_path: path to save the downloaded compressed file and save the extracted file
        """
        self.output_path = output_path
        self.remote_file_path = 'https://datasets.imdbws.com/title.akas.tsv.gz'
        self.gz_file_path = os.path.join(self.output_path, 'title.akas.tsv.gz')
        self.text_file_path = os.path.join(self.output_path, 'data.tsv')
        self.ia = IMDb()

    def download(self):
        """
        Download the movies title file to remote_file_path
        :return: None
        """
        print('Downloading latest data started')
        r = requests.get(self.remote_file_path)
        if r.status_code == 200:
            with open(self.gz_file_path, 'wb') as f:
                f.write(r.content)
        print('Downloading latest data finished')

    def decompress(self):
        """
        Decompress the downloaded file and save
        :return: None
        """
        print('Decompressing the data started')
        fp = open(self.text_file_path, "wb")
        with gzip.open(self.gz_file_path, "rb") as f:
            bindata = f.read()
            fp.write(bindata)
        fp.close()
        print('Decompressing the data finished')

    def get_ids(self):
        """
        Get the titleID of the movies from the uncompressed file
        :return: tt string striped titleID of the movies
        """
        print('Processing downloaded file started')
        df = pandas.read_csv(self.text_file_path, sep='\t', header=0)
        # Get movies with only english language
        df = df[df.language == 'en']

        print('Processing downloaded file finished')
        # Skip first two tt characters in the ID
        # Reverse the id list as it's in chronological order to get latest movies first
        return [i[2:] for i in df['titleId'].unique().tolist()[::-1]]

    def get_new_movies(self, ids):
        """
        Get movie ids not in the local DB from list if ids
        :param ids: list of all ids to check
        :return: list of new movie ids
        """
        print('Finding new movies started')
        new_movie_ids = []
        movie = Movie(db)
        for id in ids:
            exists = movie.select_one(id)
            if not exists:
                new_movie_ids.append(id)
        print('Finding new movies finished')
        return new_movie_ids

    def get_movie_link(self, id):
        """
        Helper function to create IMDB movie page link
        :param id: movie id
        :return: IMDB URL string
        """
        return 'https://www.imdb.com/title/tt{}/'.format(id)

    def get_movie_info(self, id):
        """
        Get info about movie using IMDB API
        This function can be updated to use any other API or scraper if required later on
        :param id: IMDB movie id
        :return: Dictionary of movie data
        """
        print('Getting movie info')
        info = ['title',
                'genre',
                'runtime',
                'actors',
                'production company',
                'rating',
                'director',
                'year',
                'budget'
                ]
        movie_data = dict()

        movie = self.ia.get_movie(id)
        if movie:
            #print(movie)
            for i in info:
                try:
                    movie_data[i] = movie[i]
                except KeyError:
                    movie_data[i] = None
            movie_data['id'] = id
            movie_data['link'] = self.get_movie_link(id)
            return movie_data

    def update(self):
        """
        Sync the local DB with IMDB
        :return: None
        """
        self.download()
        self.decompress()
        ids = self.get_ids()
        new_ids = self.get_new_movies(ids)
        # For each new movie id get it's data and store in the DB
        for id in new_ids:
            movie_data = self.get_movie_info(id)
            if movie_data:
                print(movie_data)
                # distribute this info to respective tables
                movie = Movie(db)
                movie.insert([movie_data['id'],
                              movie_data['title'],
                              movie_data['year'],
                              movie_data['runtime'][0] if movie_data['runtime'] else None,
                              movie_data['budget'],
                              movie_data['rating'],
                              movie_data['link'],
                              movie_data['director'][0]['name'] if movie_data['director'] else None])

                # Add actor to actor table
                actors = movie_data['actors']
                # Add actor to movie actor relation table
                ma = MovieActor(db)
                if actors:
                    for actor in actors:
                        try:
                            fname, lname = actor['name'].split(' ', 2)
                        except ValueError:
                            fname = actor['name']
                            lname = None
                        id = actor.getID()
                        a = Actor(db)
                        try:
                            if not a.select_one(id):
                                a.insert([id, fname, lname])
                        except Exception:
                            pass
                        try:
                            # for each actor in the movie add relation movieid -> actorid
                            ma.insert([movie_data['id'], id])
                        except Exception:
                            pass
                # Add production company to table
                companies = movie_data['production company']
                if companies:
                    for company in companies:
                        id = company.getID()
                        name = company['name']
                        c = Production(db)
                        try:
                            if not c.select_one(id):
                                c.insert([id, name])
                        except Exception:
                            pass
                        # Add this movie to production movie relation table
                        pm = ProductionMovie(db)
                        try:
                            pm.insert([id, movie_data['id']])
                        except Exception:
                            pass
                # Add genre to table
                genres = movie_data['genre']
                if genres:
                    g = Genre(db)
                    for genre in genres:
                        try:
                            if not g.select_one(genre):
                                g.insert([genre])
                        except Exception:
                            pass
                        # Add movie to genre movie relation table
                        gm = GenreMovie(db)
                        try:
                            gm.insert([g.select_one(genre)['GN_ID'], movie_data['id']])
                        except Exception:
                            pass


if __name__ == '__main__':
    # Test code invoked when called this file directly
    # Setup the feed to store the data in temp directory
    mf = MovieFeed(gettempdir())
    mf.update()
