FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /restreview
WORKDIR /restreview

COPY Gemfile /restreview/Gemfile
COPY Gemfile.lock /restreview/Gemfile.lock

RUN gem install bundler
RUN bundle install

# COPY . /restreview
RUN mkdir -p tmp/sockets