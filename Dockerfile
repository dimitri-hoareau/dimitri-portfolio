# Set the base image
FROM python:3.11.4-slim-buster

# Create and set the working directory
WORKDIR /usr/src/app

# Environment settings
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV PYTHONPATH /usr/src/app

# Install dependencies
RUN apt-get update && apt-get install -y netcat
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# Copy the project files
COPY . .

COPY initial_media /usr/src/app/initial_media

# Make entrypoint.sh executable
RUN chmod +x /usr/src/app/entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]