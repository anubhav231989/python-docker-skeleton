#BASE IMAGE.
FROM python:3.7-alpine

#LABEL THE DOCKERFILE.
LABEL NAME="ANUBHAV SIDHU"
LABEL EMAIL="anubhav231989@gmail.com"

#UPDATE THE BASE IMAGE.
RUN apk update

#SET PYTHONUNBUFFERED ENV.
ENV PYTHONUNBUFFERED 1

#INSTALL SYSTEM LEVEL BINARIES.
RUN apk add --update --no-cache --virtual .tmp-build-deps gcc libc-dev linux-headers postgresql-dev postgresql-client

#CREATE WORKING FOLDER AND SET IT TO DEFAULT WORKSPACE.
RUN mkdir -p /source
WORKDIR /source

#COPY/ADD THE REQUIREMENTS FILE.
COPY ./dependencies.txt .

#INSTALL THE APPLICATION DEPENDENCIES.
RUN pip install -r dependencies.txt

#OPTIONALLY DELETE TEMPORARY DEPENDENCIES.

#COPY/ADD THE SOURCE CODE.
COPY ./source source

#EXPOSE THE CONTAINER PORT.
EXPOSE 9000
