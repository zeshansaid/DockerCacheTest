FROM python:3.9-slim-buster
WORKDIR /app
COPY . /app
RUN --mount=type=cache,target=/root/.cache/pip pip install -r requirements.txt
EXPOSE 5000
CMD python ./my_flask.py