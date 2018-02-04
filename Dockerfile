FROM ruby:2.5-alpine

RUN apk add --no-cache --update build-base \
                                postgresql-dev \
                                nodejs \
                                tzdata

ENV APP_PATH /rails

WORKDIR $APP_PATH
ADD Gemfile $APP_PATH
ADD Gemfile.lock $APP_PATH
RUN bundle install --without development test --jobs `expr $(cat /proc/cpuinfo | grep -c "cpu cores") - 1` --retry 3

RUN RAILS_ENV=production rails assets:precompile

COPY . APP_PATH

EXPOSE 3000

CMD ["RAILS_ENV=production","bundle", "exec", "puma", "-C", "/rails/config/puma.rb" ,"config.ru"]
