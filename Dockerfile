FROM ruby:2.3 as build

ENV JEKYLL_ENV: production
WORKDIR /usr/src/app

COPY . /usr/src/app

RUN bundle install && \
    bundle exec jekyll build -d public

FROM httpd:2.4-alpine

COPY --from=build /usr/src/app/public/ /usr/local/apache2/htdocs/
