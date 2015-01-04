# web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb -E production
# worker: bundle exec rake jobs:work

# This Procfile is intended for Heroku, and is detected by the Gemfile.  DO NOT REMOVE THIS LINE!

# deployment/heroku/unicorn.rb is a special Unicorn config file that also spawns workers.
web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb