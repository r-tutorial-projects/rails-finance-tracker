FROM ruby:2.7.1
RUN mkdir /usr/src/app
ADD . /usr/src/app/

ENV RAILS_MASTER_KEY=$master_key
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
     && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
      && curl -sL https://deb.nodesource.com/setup_14.x | bash - \
      && apt-get remove cmdtest && apt-get update && apt-get install -y yarn \
      && chmod +x /usr/src/app/bin/rails && apt-get clean
WORKDIR /usr/src/app/
RUN bundle install && yarn install
EXPOSE 3000
CMD rails db:migrate && rails s -b 0.0.0.0 #-e production
