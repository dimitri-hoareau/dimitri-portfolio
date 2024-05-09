#!/bin/sh

if [ "$DATABASE" = "postgres" ]
then
    echo "Waiting for postgres..."

    while ! nc -z $SQL_HOST $SQL_PORT; do
      sleep 0.1
    done

    echo "PostgreSQL started"
fi

# Copie des fichiers manquants depuis initial_media vers mediafiles
echo "Checking for missing media files..."
for file in /usr/src/app/initial_media/*; do
    filename=$(basename "$file")
    if [ ! -f "/usr/src/app/mediafiles/$filename" ]; then
        echo "$filename not found in mediafiles. Copying..."
        cp "$file" "/usr/src/app/mediafiles/"
    else
        echo "$filename already exists in mediafiles."
    fi
done

echo "Media files check completed."


mkdir -p /usr/src/app/static

# python manage.py flush --no-input # NEVER USE IN PRODUCTION
python manage.py migrate
python manage.py collectstatic --noinput
# python manage.py runserver 0.0.0.0:8000

exec "$@"