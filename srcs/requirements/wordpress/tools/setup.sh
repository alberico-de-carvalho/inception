#!/bin/sh
set -e
cd /var/www/html
DB_PASS=$(cat /run/secrets/db_password)
ADMIN_PASS=$(cat /run/secrets/wp_admin_password)
USER_PASS=$(cat /run/secrets/wp_user_password)

if [ ! -f wp-config.php ]; then
wp core download --allow-root
wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$DB_PASS --dbhost=mariadb --allow-root
wp core install --url=https://$DOMAIN_NAME --title="$WP_TITLE" --admin_user=$WP_ADMIN_USER --admin_password=$ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$USER_PASS --allow-root
fi

chown -R www-data:www-data /var/www/html
exec php-fpm8.2 -F
