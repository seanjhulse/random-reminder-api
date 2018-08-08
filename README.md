# README

DEPLOYMENT:

1. Setup a redis instance through Heroku.

2. Set the config in heroku

  eg. `heroku config:set REDIS_URL='redis://:PASSWORD@redis-instance.us-east-1-2.ec2.cloud.redislabs.com:19831 --app name-of-app

3. Deploy to your app (either through Heroku or a Git connection)
