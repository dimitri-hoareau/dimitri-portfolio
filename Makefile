install:
	poetry install

intall-pre-commit:
	poetry run pre-commit uninstall; poetry run pre-commit install

lint:
	poetry run pre-commit run --all-files

migrate:
	poetry run python3 portfolio/manage.py migrate

migrations:
	poetry run python3 portfolio/manage.py makemigrations

run-server:
	poetry run python3 portfolio/manage.py runserver

superuser:
	poetry run python3 portfolio/manage.py createsuperuser

update: install migrate
