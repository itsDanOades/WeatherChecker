# WeatherChecker
Cucumber Automation example project for the Weather Checker site. The test framework is written in Ruby using Cucumber
and Capybara BDD automatiom frameworks.

| Framework        | Reference           | 
| ------------- |:-------------:| 
| Ruby Cucumber      | https://github.com/cucumber/cucumber-ruby         | 
| Capybara automation framework for Selenium | https://github.com/teamcapybara/capybara         | 
| SitePrism Page Object Model | https://github.com/site-prism/site_prism            | 

The project can be executed in 2 different ways depending on your local dev environment set up. It has been assumed
to be run in a Mac OS or Linux environment.

## Run tests using Ruby and local Chrome browser

Spawn a browser instances on your local dev machine and execute Cucumber tests using Selenium Webdriver executable

### Prerequisites

- Install Google Chrome (https://www.google.com/chrome/) or Firefox (https://www.mozilla.org/en-GB/firefox/new/)

### Set up Ruby

- Install Ruby 2.6.0 or later using RVM (https://rvm.io/rvm/install):

```
# Download and install latest stable version
curl -sSL https://get.rvm.io | bash -s stable --ruby

# Confirm your Ruby install
rvm list
ruby -v
```

- Install Ruby project dependencies

```
gem install bundler
bundle install
```

Note: The bundle install step will download and install the correct Chromedriver or Geckodriver version for your local browser

## Run Feature Tests
```
# Launch Chrome
bundle exec cucumber -p default -p chrome

# Launch Firefox
bundle exec cucumber -p default -p chrome
```

## Run tests using Docker and Selenium Grid

Start a Docker container running an instance of Selenium Grid and a Google Chrome node, execute Cucumber tests inside Docker,
use this approach if you do not want to set up Ruby on your local machine.

### Prerequisites

- Install Docker, https://docs.docker.com/docker-for-mac/install

- Install docker-compose (non Mac platforms only) https://docs.docker.com/docker-for-mac/install/

### Build Docker Container

Build the test runner Docker container using Dockerfile and public Ruby docker image from https://hub.docker.com/

```
sh ./build_docker.sh
```

## Run Feature Tests

Start automation framework and execute tests headlessly inside docker node


```
sh ./run_cucumber_docker.sh
```
