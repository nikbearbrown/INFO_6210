# DB model file to access the data quickly and separation of DB queries from main code

from pymysql.cursors import DictCursor


# Use of ORM is not allowed so creating required minimum interface for each table in the DB

class User:
    """
    Twitter user table
    """

    def __init__(self, db):
        self.table = 't_users'
        self.db = db
        self.cursor = self.db.cursor(DictCursor)
        self.queries = {
            'insert': """INSERT INTO `{}` (
                            `USR_ID`,
                            `USR_NAME`,
                            `USR_DESC`,
                            `USR_CREATED_DATE`,
                            `USR_CREATED_TIME`,
                            `USR_FOLLOWERS`,
                            `USR_FRIENDS`)
                            VALUES
                            (%s,%s,%s,%s,%s,%s,%s)
                            """.format(self.table),
            'update': """UPDATE `{}`
                            SET
                            `USR_NAME` = %s,
                            `USR_DESC` = %s,
                            `USR_FOLLOWERS` = %s,
                            `USR_FRIENDS` = %s
                            WHERE `USR_ID` = %s
                            """.format(self.table),
            'select_one': """SELECT * FROM `{}` where USR_ID=%s""".format(self.table),
            'insert_mention': """INSERT INTO `{}` (
                            `USR_ID`,
                            `USR_NAME`)
                            VALUES
                            (%s,%s)
                            """.format(self.table)
        }

    def insert(self, data):
        if type(data) in (list, tuple):
            self.cursor.execute(self.queries['insert'], data)
            self.db.commit()

    def insert_mention_user(self, data):
        if type(data) in (list, tuple):
            self.cursor.execute(self.queries['insert_mention'], data)
            self.db.commit()

    def update(self, data):
        if type(data) in (list, tuple):
            self.cursor.execute(self.queries['update'], [*data[1:3], *data[5:], data[0]])
            self.db.commit()

    def select_one(self, id):
        self.cursor.execute(self.queries['select_one'], id)
        result = self.cursor.fetchone()
        return result


class Tweet:
    """
    Tweets table
    """

    def __init__(self, db):
        self.table = 't_tweets'
        self.db = db
        self.cursor = self.db.cursor(DictCursor)
        self.queries = {
            'insert': """INSERT INTO `{}` (
                        `TW_ID`,
                        `TW_DETAIL`,
                        `TW_HASHTAG`,
                        `USR_ID`,
                        `TW_DATE`,
                        `TW_TIME`,
                        `TW_RETWEET`)
                        VALUES
                        (%s,%s,%s,%s,%s,%s,%s)
                            """.format(self.table),
            'select_one': """SELECT * FROM `{}` where TW_ID=%s""".format(self.table)
        }

    def insert(self, data):
        if type(data) in (list, tuple):
            self.cursor.execute(self.queries['insert'], data)
            self.db.commit()

    def select_one(self, id):
        self.cursor.execute(self.queries['select_one'], id)
        result = self.cursor.fetchone()
        return result


class Movie:
    """
    Movie table
    """

    def __init__(self, db):
        self.table = 't_movies'
        self.db = db
        self.cursor = self.db.cursor(DictCursor)
        self.queries = {
            'insert': """INSERT INTO `{}` (
                        `MV_ID`,
                        `MV_NAME`,
                        `MV_RELDATE`,
                        `MV_RUNTIME`,
                        `MV_BUDGET`,
                        `MV_RATING`,
                        `MV_LINK`,
                        `MV_DIRECTOR`)
                        VALUES
                        (%s,%s,%s,%s,%s,%s,%s,%s)
                            """.format(self.table),
            'select_one': """SELECT * FROM `{}` where MV_ID=%s""".format(self.table),
            'get_names': """SELECT MV_NAME, MV_ID FROM `{}`""".format(self.table)
        }

    def insert(self, data):
        if type(data) in (list, tuple):
            self.cursor.execute(self.queries['insert'], data)
            self.db.commit()

    def select_one(self, id):
        self.cursor.execute(self.queries['select_one'], id)
        result = self.cursor.fetchone()
        return result

    def get_names(self):
        results = self.cursor.execute(self.queries['get_names'])
        return self.cursor.fetchall()


class Production:
    """
    Production Company table
    """

    def __init__(self, db):
        self.table = 't_productions'
        self.db = db
        self.cursor = self.db.cursor(DictCursor)
        self.queries = {
            'insert': """INSERT INTO `{}` (
                        `PC_ID`,
                        `PC_NAME`)
                        VALUES
                        (%s, %s)
                            """.format(self.table),
            'select_one': """SELECT * FROM `{}` where PC_ID=%s""".format(self.table)
        }

    def insert(self, data):
        if type(data) in (list, tuple):
            self.cursor.execute(self.queries['insert'], data)
            self.db.commit()

    def select_one(self, id):
        self.cursor.execute(self.queries['select_one'], id)
        result = self.cursor.fetchone()
        return result


class Actor:
    """
    Actor  Table
    """

    def __init__(self, db):
        self.table = 't_actors'
        self.db = db
        self.cursor = self.db.cursor(DictCursor)
        self.queries = {
            'insert': """INSERT INTO `{}` (
                        `A_ID`,
                        `A_FNAME`,
                        `A_LNAME`)
                        VALUES
                        (%s, %s, %s)
                            """.format(self.table),
            'select_one': """SELECT * FROM `{}` where A_ID=%s""".format(self.table)
        }

    def insert(self, data):
        if type(data) in (list, tuple):
            self.cursor.execute(self.queries['insert'], data)
            self.db.commit()

    def select_one(self, id):
        self.cursor.execute(self.queries['select_one'], id)
        result = self.cursor.fetchone()
        return result


class Genre:
    """
    Table to store list of movie genres
    """

    def __init__(self, db):
        self.table = 't_genres'
        self.db = db
        self.cursor = self.db.cursor(DictCursor)
        self.queries = {
            'insert': """INSERT INTO `{}` (                        
                        `GN_NAME`)
                        VALUES
                        (%s)
                            """.format(self.table),
            'select_one': """SELECT * FROM `{}` where GN_NAME=%s""".format(self.table)
        }

    def insert(self, data):
        if type(data) in (list, tuple):
            self.cursor.execute(self.queries['insert'], data)
            self.db.commit()

    def select_one(self, name):
        self.cursor.execute(self.queries['select_one'], name)
        result = self.cursor.fetchone()
        return result


class GenreMovie:
    """
    Table to hold the relation of genre id and movie id
    """

    def __init__(self, db):
        self.table = 't_genre_movie'
        self.db = db
        self.cursor = self.db.cursor(DictCursor)
        self.queries = {
            'insert': """INSERT INTO `{}` (
                        `GN_ID`,
                        `MV_ID`)
                        VALUES
                        (%s, %s)
                            """.format(self.table),
            'select_one': """SELECT * FROM `{}` where GN_ID=%s""".format(self.table)
        }

    def insert(self, data):
        if type(data) in (list, tuple):
            self.cursor.execute(self.queries['insert'], data)
            self.db.commit()

    def select_one(self, id):
        self.cursor.execute(self.queries['select_one'], id)
        result = self.cursor.fetchone()
        return result


class MovieActor:
    """
    Table to hold the relation of movie id and actor id
    """

    def __init__(self, db):
        self.table = 't_movie_actor'
        self.db = db
        self.cursor = self.db.cursor(DictCursor)
        self.queries = {
            'insert': """INSERT INTO `{}` (                        
                        `MV_ID`,
                        `A_ID`)
                        VALUES
                        (%s, %s)
                            """.format(self.table),
            'select_one': """SELECT * FROM `{}` where MV_ID=%s""".format(self.table)
        }

    def insert(self, data):
        if type(data) in (list, tuple):
            self.cursor.execute(self.queries['insert'], data)
            self.db.commit()

    def select_one(self, id):
        self.cursor.execute(self.queries['select_one'], id)
        result = self.cursor.fetchone()
        return result


class ProductionMovie:
    """
    Table to hold the relation of production company id and movie id
    """

    def __init__(self, db):
        self.table = 't_production_movie'
        self.db = db
        self.cursor = self.db.cursor(DictCursor)
        self.queries = {
            'insert': """INSERT INTO `{}` (                        
                        `PC_ID`,
                        `MV_ID`)
                        VALUES
                        (%s, %s)
                            """.format(self.table),
            'select_one': """SELECT * FROM `{}` where PC_ID=%s""".format(self.table)
        }

    def insert(self, data):
        if type(data) in (list, tuple):
            self.cursor.execute(self.queries['insert'], data)
            self.db.commit()

    def select_one(self, id):
        self.cursor.execute(self.queries['select_one'], id)
        result = self.cursor.fetchone()
        return result


class TweetMovie:
    """
    Table to hold the relation of tweet id and movie id
    """

    def __init__(self, db):
        self.table = 't_tweet_movie'
        self.db = db
        self.cursor = self.db.cursor(DictCursor)
        self.queries = {
            'insert': """INSERT INTO `{}` (                        
                        `TW_ID`,
                        `MV_ID`)
                        VALUES
                        (%s, %s)
                            """.format(self.table),
            'select_one': """SELECT * FROM `{}` where TW_ID=%s""".format(self.table)
        }

    def insert(self, data):
        if type(data) in (list, tuple):
            self.cursor.execute(self.queries['insert'], data)
            self.db.commit()

    def select_one(self, id):
        self.cursor.execute(self.queries['select_one'], id)
        result = self.cursor.fetchone()
        return result


class Mention:
    """
    Table to hold the relation of tweet id and movie id
    """

    def __init__(self, db):
        self.table = 't_mentions'
        self.db = db
        self.cursor = self.db.cursor(DictCursor)
        self.queries = {
            'insert': """INSERT INTO `{}` (                        
                        `TW_ID`,
                        `USR_ID`)
                        VALUES
                        (%s, %s)
                            """.format(self.table),
            'select_one': """SELECT * FROM `{}` where TW_ID=%s""".format(self.table)
        }

    def insert(self, data):
        if type(data) in (list, tuple):
            self.cursor.execute(self.queries['insert'], data)
            self.db.commit()

    def select_one(self, id):
        self.cursor.execute(self.queries['select_one'], id)
        result = self.cursor.fetchone()
        return result


if __name__ == '__main__':
    # Test code to check the functionality of each table class directly without importing

    from pymysql import connect
    from settings import *

    db = connect(host=MYSQL_HOST, port=MYSQL_PORT, database=MYSQL_DB, user=MYSQL_USER, password=MYSQL_PWD)
    # user_details = ['991451857557090304', 'Ripclear Ski',
    #                 'We\'re avid skiers and we know how tough you are with your gear. We\'ll make sure you know how to keep your gear protected and scratch free all season long!',
    #                 '2018-05-01', '22:58:37', '33', '86']
    # user = User(db)
    # user.insert(user_details)
    # user_details = ['991451857557090304', 'Ripclear Ski',
    #                 'We\'re avid skiers and we know how tough you are with your gear. We\'ll make sure you know how to keep your gear protected and scratch free all season long!',
    #                 '2018-05-01', '22:58:37', '51', '96']
    # user.update(user_details)
    #
    # print(user.select_one('991451857557090304'))
    #
    tweet_details = ['21801',
                     'The Guilty (2018) - Read 15 Movie Reviews \\nLink: https://t.co/ZbVWDatgRJ \\n#TheGuilty',
                     '#TheGuilty', '422894679', '11/19/2018', '18:05:58',52]
    tweet = Tweet(db)
    tweet.insert(tweet_details)
    print(tweet.select_one('21801'))
    #
    # tweet_movie_details = [218013, 5502]
    # tw_movie = TweetMovie(db)
    # tw_movie.insert(tweet_movie_details)
    # print(tw_movie.select_one('21801'))
    #
    # movie_details = ['5502', 'Mission: Impossible - Fallout', '2018', '147 min', '220159104', '7.8',
    #                  'www.imdb.com/title/tt4912910/?ref_=ttls_li_tt', 'Christopher McQuarrie']
    # movie = Movie(db)
    # movie.insert(movie_details)
    # print(movie.select_one('5502'))
    #
    # m = Movie(db)
    # print(m.get_names())
    # ma_data = ['9915592', '1033328']
    # ma = MovieActor(db)
    # ma.insert(ma_data)
    #
    # g = Genre(db)
    # gm = GenreMovie(db)
    # print(g.select_one('Drama')['GN_ID'])
    # gm.insert([g.select_one('Drama')['GN_ID'], 9916170])
    # mention = Mention(db)
    # mention.insert([1118210672255492096, 991451857557090304])
    # user_details = ['14927800', 'Jason Costa']
    # user = User(db)
    # user.insert_mention_user(user_details)
