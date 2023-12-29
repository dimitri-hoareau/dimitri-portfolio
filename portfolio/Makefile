install:
	poetry install

migrate:
	poetry run python3 manage.py migrate

migrations:
	poetry run python3 manage.py makemigrations

run-server:
	poetry run python3 manage.py runserver

superuser:
	poetry run python3 manage.py createsuperuser

update: install migrate
