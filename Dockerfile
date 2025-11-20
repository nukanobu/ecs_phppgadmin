FROM php:8.2-apache

# 必要パッケージ
RUN apt-get update && apt-get install -y \
    git unzip curl locales libpq-dev \
    && docker-php-ext-install pgsql pdo pdo_pgsql \
    && rm -rf /var/lib/apt/lists/*

# 日本語ロケールを生成
RUN sed -i 's/# ja_JP.UTF-8 UTF-8/ja_JP.UTF-8 UTF-8/' /etc/locale.gen \
    && locale-gen

ENV LANG=ja_JP.UTF-8
ENV LANGUAGE=ja_JP:ja
ENV LC_ALL=ja_JP.UTF-8

# phpPgAdmin を取得
ENV PHP_PGADMIN_VERSION=7.14.1

RUN curl -L https://github.com/phppgadmin/phppgadmin/archive/refs/tags/REL_${PHP_PGADMIN_VERSION}.tar.gz \
    -o /tmp/phpPgAdmin.tar.gz \
    && tar -xzf /tmp/phpPgAdmin.tar.gz -C /var/www/html --strip-components=1 \
    && rm /tmp/phpPgAdmin.tar.gz

# 日本語言語ファイルが欠けている場合があるため、明示的にコピー
# ※ LANG ディレクトリはこのバージョンに存在していますが、保険としてコピーできます
COPY japanese.php /var/www/html/lang/japanese.php

# 設定ファイル
COPY config.inc.php /var/www/html/conf/config.inc.php


RUN chown -R www-data:www-data /var/www/html

EXPOSE 80

CMD ["apache2-foreground"]

