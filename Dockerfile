FROM python:3.13-slim

WORKDIR /app

COPY ./streams_2160p ./streams_2160p
COPY ./streams_1080p ./streams_1080p
COPY ./streams_480p ./streams_480p
COPY ./streams_360p ./streams_360p
COPY ./index.html ./

CMD python -m http.server 8000
