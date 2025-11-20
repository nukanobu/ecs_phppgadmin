FROM php:7.2-apache

# 必要パッケージ
RUN apt-get update && apt-get install -y \
    git unzip curl locales libpq-dev \
    && docker-php-ext-install pgsql pdo pdo_pgsql \
    && rm -rf /var/lib/apt/lists/*

# 日本語ロケール生成
RUN sed -i 's/# ja_JP.UTF-8 UTF-8/ja_JP.UTF-8 UTF-8/' /etc/locale.gen \
    && locale-gen

ENV LANG=ja_JP.UTF-8
ENV LANGUAGE=ja_JP:ja
ENV LC_ALL=ja_JP.UTF-8

# phpPgAdmin バージョン
ENV PHP_PGADMIN_VERSION=7-14-0

# ★GitHub 403/404 対策：User-Agent + -f（fail on error）必須
RUN set -eux; \
    curl -Lf \
      "https://github.com/phppgadmin/phppgadmin/releases/download/REL_7-13-0/phpPgAdmin-7.13.0.tar.gz" \
      -o /tmp/phpPgAdmin.tar.gz; \
    tar -xzf /tmp/phpPgAdmin.tar.gz -C /var/www/html --strip-components=1; \
    rm /tmp/phpPgAdmin.tar.gz


# 日本語ファイル
COPY japanese.php /var/www/html/lang/japanese.php

# 設定ファイル
COPY config.inc.php-dist /var/www/html/conf/config.inc.php

RUN chown -R www-data:www-data /var/www/html

EXPOSE 80

CMD ["apache2-foreground"]

