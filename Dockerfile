FROM ruby:2.7.1

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -

ARG APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1
RUN curl -sS http://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -qq --no-install-recommends \
    nodejs \
    yarn \
    git \
    emacs \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /app
COPY . /app 
WORKDIR /app

RUN yarn install
RUN bundle install

CMD [ "bundle", "exec", "jekyll", "serve", "-H", "0.0.0.0", "-P", "80" ]
