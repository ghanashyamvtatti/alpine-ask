FROM python:3.6-alpine3.8

RUN echo -e "http://nl.alpinelinux.org/alpine/v3.5/main\nhttp://nl.alpinelinux.org/alpine/v3.5/community" > /etc/apk/repositories
COPY . /app
WORKDIR /app

RUN python -m pip install pip==9.0.3
RUN apk add --no-cache  --virtual .builddeps gcc gfortran musl-dev libffi-dev libressl libressl-dev && pip install -r requirements.txt && pip install 'cryptography<2.2'