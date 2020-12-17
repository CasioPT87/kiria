FROM ruby:2.7.2

LABEL maintainer=sergioibanezmoreno@gmail.com

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get update -qq && apt-get install -qq --no-install-recommends \
    nodejs \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN npm install -g yarn@1.22.10

COPY Gemfile* /usr/src/app/
WORKDIR /usr/src/app
RUN bundle install

COPY . /usr/src/app/

RUN bin/rails assets:precompile

CMD ["bin/rails", "s", "-b", "0.0.0.0"]

# mysql://b31ed888e28e1a:6ab08daf@us-cdbr-east-02.cleardb.com/heroku_41430389b705176?reconnect=true