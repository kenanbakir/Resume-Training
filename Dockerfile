# Pull official base image
FROM python:3.10-slim

RUN apt-get update && \
    apt-get install -y python3-dev build-essential

# Pip requirements
RUN pip install --upgrade pip
RUN pip install virtualenv && python3 -m virtualenv /opt/venv

ENV PATH="/opt/venv/bin:$PATH"

ADD ./requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

COPY . /srv/app
WORKDIR /srv/app
