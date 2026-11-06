FROM debian:bookworm
RUN apt-get update && apt-get install -y --no-install-recommends php8.2-cli php8.2-mysql curl ca-certificates && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /var/www/adminer && curl -sSLo /var/www/adminer/index.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php
EXPOSE 8080
ENTRYPOINT ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/adminer"]
