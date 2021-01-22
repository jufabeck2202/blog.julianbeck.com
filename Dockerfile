FROM ruby@sha256:7c77d7351acbf335aeda71bce3ef60403ce703de87064b885f340592e97cc11f AS builder

# I sort of hate that this is duped in .drone.yml and here.
# note that if you update one, you probably have to update the other.
RUN apt update && apt install -y \
    bsdmainutils \
    build-essential \
    make \
    bundler \
    ghostscript \
    imagemagick \
    libxml2-dev \
    libxslt-dev \
    nodejs \
    npm \
    pkg-config

WORKDIR /var/jekyll

ADD ./Gemfile* /var/jekyll/

RUN npm install -g yarn && \
    echo "gem: --no-ri --no-rdoc" > ~/.gemrc && \
    yes | gem update --system && \
    gem install bundler && \
    bundle install

ADD . /var/jekyll/

RUN make build

# finally, copy static over to serving container:
FROM nginx
COPY --from=builder /var/jekyll/_site /usr/share/nginx/html/
