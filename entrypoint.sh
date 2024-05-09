#!/bin/sh

if [ "$DATABASE" = "postgres" ]
then
    echo "Waiting for postgres..."

    while ! nc -z $SQL_HOST $SQL_PORT; do
      sleep 0.1
    done

    echo "PostgreSQL started"
fi

# # Initialisation du répertoire de fichiers médias
# if [ -z "$(ls -A /usr/src/app/mediafiles)" ]; then
#    echo "Initializing media files..."
#    cp -a /usr/src/app/initial_media/. /usr/src/app/mediafiles/
#    echo "Media files initialized. Current contents:"
#    ls -l /usr/src/app/mediafiles/  # Cette ligne affiche le contenu du répertoire mediafiles
# else
#    echo "Media files directory is not empty. Current contents:"
#    ls -l /usr/src/app/mediafiles/  # Affiche le contenu si le dossier n'est pas vide au départ
# fi

ls -l /usr/src/app/mediafiles/
cp -a /usr/src/app/initial_media/vue.png /usr/src/app/mediafiles/
ls -l /usr/src/app/mediafiles/


mkdir -p /usr/src/app/static

# python manage.py flush --no-input # NEVER USE IN PRODUCTION
python manage.py migrate
python manage.py collectstatic --noinput
# python manage.py runserver 0.0.0.0:8000

exec "$@"