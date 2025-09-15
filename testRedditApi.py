import praw

reddit = praw.Reddit(
    client_id = "fGr67iNoLCmbN_9i9TD8gQ",
    client_secret = "tweCdFCHMV5kt6P1O7aDUZbYgjhfEA",
    user_agent = "android:com.example.myRedditApi:v0.1 (by u/Shubr)"
)

for submission in reddit.subreddit("androiddev").hot(limit=1):
    print(submission.title)
    print(submission.selftext)