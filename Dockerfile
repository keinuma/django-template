FROM python:3.7

ENV PYTHONUNBUFFERED 1
ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz && \
    tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz && \
    rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

WORKDIR /var/admin
COPY Pipfile* ./
RUN pip install pipenv && \
    pipenv install --system --deploy

ADD . /var/admin
