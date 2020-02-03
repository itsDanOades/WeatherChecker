# Use public Ruby base image
FROM ruby:2.6

RUN apt-get update && \
apt-get -y install --no-install-recommends jq

# Create working directory to mount acceptance tests to
WORKDIR /usr/src/cucumber

# Install Ruby Gem packages
RUN gem install bundler

COPY Gemfile .

RUN bundle install

COPY . .

# Script to exeucte when Docker container boots
CMD ["/usr/src/cucumber/wait_for_grid.sh"]
