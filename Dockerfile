FROM ruby:2.5.1
MAINTAINER YAMADA Tsuyoshi <tyamada@minimum2scp.org>

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app
COPY Gemfile      /usr/src/app
COPY Gemfile.lock /usr/src/app
RUN bundle install --without=test:development

RUN mkdir -p /etc/gemstash /var/cache/gemstash
COPY config.yml /etc/gemstash/config.yml
COPY entrypoint.sh /entrypoint.sh

EXPOSE 9292
ENV RACK_ENV production
ENTRYPOINT ["/entrypoint.sh"]
CMD ["gemstash", "start", "--config-file=/etc/gemstash/config.yml", "--no-daemonize"]
