FROM ruby:2.3.1
MAINTAINER YAMADA Tsuyoshi <tyamada@minimum2scp.org>

RUN gem install --no-document gemstash
RUN mkdir -p /etc/gemstash /var/cache/gemstash
COPY config.yml /etc/gemstash/config.yml
COPY entrypoint.sh /entrypoint.sh

EXPOSE 9292
ENV RACK_ENV production
ENTRYPOINT ["/entrypoint.sh"]
CMD ["gemstash", "start", "--config-file=/etc/gemstash/config.yml", "--no-daemonize"]
