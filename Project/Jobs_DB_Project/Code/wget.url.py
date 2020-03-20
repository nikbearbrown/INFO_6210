import subprocess,os, sys, time, random, re, optparse, string

#Copyright (c) <2015> <Mackenzie Denker>
#Permission is hereby granted, free of charge, to any person obtaining a copy of 
#this software and associated documentation files (the "Software"), to deal in the
#Software without restriction, including without limitation the rights to use, copy, 
#modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
# and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#The above copyright notice and this permission notice shall be included in all 
#copies or substantial portions of the Software.
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
#INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE 
#AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, 
#DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


#lets = ['a', 'n']
lets=list(string.ascii_lowercase)
consoles = ['ps3', 'xbox360', 'ps4', 'xboxone', 'wii-u', 'wii']
game_url='http://www.metacritic.com/browse/games/title/'


#grabs one webpage and stores as html. 
def grabPage(url,name):
  cmd = "wget %s -O %s" % (url,name)
  print "Running  subprocess %s " % (cmd)
  try:
     p=subprocess.Popen(cmd, shell=True)
  except IOError, e:
    ok=False
    if hasattr(e, 'code'):
      print e.code  
    else: 
      print "IO Error"
  p.wait()
  print 'pid ', p.pid


page = ' '
f = ' '
#going through each letter and grabbing the page at the associated url
for console in consoles:
  for letter in lets:
    # gets each page for each letter (well pages 1-4), since 4 pages seems to be close to if not the max number pages.  Some will be duds
    for num in range (0, 4):
      if num == 0:
        page = ' ' # add nothing for first page
        f=console+'_'+letter+'.html'
      else:
        page = '?page=' + str(num)	
        f=console+'_'+letter+page+'.html'
      print f
      url=game_url + console + '/' + letter + page
      print url    
      grabPage(url,f)


# Now once we get all the html files, we need to parse them for individual 
# game links.  Then run grab page again on each of those urls.
#NEVERMIND.  JUST TAKE WHAT YOU HAVE FROM THESE PAGES AND THEN CHECK WIKIPEDIA AGAINST EACH GAME NAME FOR DEVELOPER NAME
# AND COMPOSER NAME and GENRE
