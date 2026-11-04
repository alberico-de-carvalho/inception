FROM debian:bookworm
RUN apt-get update && apt-get install -y --no-install-recommends nginx openssl gettext-base && rm -rf /var/lib/apt/lists/* /etc/nginx/sites-enabled/default && ln -sf /dev/stdout /var/log/nginx/access.log && ln -sf /dev/stderr /var/log/nginx/error.log
COPY conf/default.conf.template /etc/nginx/templates/default.conf.template
COPY tools/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
EXPOSE 443
ENTRYPOINT ["entrypoint.sh"]
