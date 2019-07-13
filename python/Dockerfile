FROM alpine:3.10.1

LABEL maintainer="emmanuel.sys@gmail.com"

RUN apk update && apk add python py-pip
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt

EXPOSE 5000
ENTRYPOINT [ "python" ]
CMD [ "app.py" ]