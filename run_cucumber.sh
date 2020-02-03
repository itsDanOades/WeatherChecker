#!/usr/bin/env bash

# Install Ruby Gem packages and execute all Cucmber scenarios under /features
# Note - requires Ruby 2.6.0 or later to be installed on your local machine

gem install bundler
bundle install
bundle exec cucumber -p default -p local