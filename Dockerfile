# test code for local docker
# FROM python:3.9-slim-buster
# WORKDIR /app
# COPY . /app
# RUN --mount=type=cache,target=/root/.cache/pip pip install -r requirements.txt
# EXPOSE 5000
# CMD python ./my_flask.py

FROM python:3.10
# Install manually all the missing libraries
RUN apt-get update

COPY requirements.txt requirements.txt
RUN  pip install -r requirements.txt
# RUN --mount=type=cache,target=/root/.cache/pip pip install --timeout 300 -r requirements.txt
# Copy local code to the container image.
ENV APP_HOME=/app
WORKDIR $APP_HOME
COPY . .

CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 main:app

