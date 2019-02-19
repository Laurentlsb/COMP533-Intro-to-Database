import urllib
from pymongo import MongoClient
import tweepy
import json
from datetime import datetime

# Mongodb account, password, and authentication database
uri = "mongodb://ricedb:522238830@127.0.0.1/ricedb?authSource=ricedb"
client = MongoClient(uri)
# set up access to mongodb
#http://api.mongodb.com/python/current/examples/authentication.html

# Use the ricedb database. If it doesn't exist, it will be created.
db = client.ricedb
destCollection = db['icecream']

# search for tweets containing these terms
words = ['ice cream', '#foodtruck', '#icecream']

accessToken = "1070113673996230656-k50nMHy1vp01NTgFuMu5mr8mJMQKzm"
accessTokenSecret = "CsP6pYYznBJ6Ayk0eAFkDAHkOhMao6lxjg0x8tSIdQNVK"
consumerKey = "42Uxcdm3KSdklFl6dgQ2QRXNE"
consumerSecret = "oF8ZDrGYoN3H1hOVJd5Q88AJuVT5o02vEY5hKdSUCcckWz8Uk9"



class StreamListener(tweepy.StreamListener):    
    #This is a class provided by tweepy to access the Twitter Streaming API. 
 
    def __init__(self, myCollection, api):
        self.collection = myCollection

    def on_connect(self):
        # Called initially to connect to the Streaming API
        print("You are now connected to the streaming API.")
 
    def on_error(self, status_code):
        # On error - if an error occurs, display the error / status code
        print('An Error has occured: ' + repr(status_code))
        return False
 
    def on_data(self, data):
        # parse the tweet and store it in the database
        try:                
            # Decode the JSON from Twitter
            datajson = json.loads(data)
            
            # create a new field called retrieved and set to the current date
            # in the format "YYYY-MM-DD HH:MM:SS"
            
            # YOUR CODE HERE
            datajson['retrieved'] = datetime.now()

            #grab the 'created_at' data from the Tweet to use for display
            created_at = datajson['created_at']
 
            #print out a message to the screen that we have collected a tweet
            print("Tweeted at " + str(created_at))
            print(datajson['text'])

            #insert the data into  mongodb into the specified collection  
            
            # YOUR CODE HERE
            destCollection.insert_one(datajson)

        except Exception as e:
           print(e)


def retrieveTweetsByKeyWords(myCollection, words, consumerKey, consumerSecret, accessToken, accessTokenSecret):
    auth = tweepy.OAuthHandler(consumerKey, consumerSecret)
    auth.set_access_token(accessToken, accessTokenSecret)

    #Set up the listener. The 'wait_on_rate_limit=True' is needed to help with Twitter API rate limiting.
    listener = StreamListener(myCollection, api=tweepy.API(wait_on_rate_limit=True)) 
    streamer = tweepy.Stream(auth=auth, listener=listener)

    print("Tracking: " + str(words))


    streamer.filter(track=words, languages=['en'])  

retrieveTweetsByKeyWords(destCollection, words, consumerKey, consumerSecret, accessToken, accessTokenSecret)
