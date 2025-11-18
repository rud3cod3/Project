# Python Flask App

## Description
Containerize Python Application using docker 

## Steps

* Create Docker file

```bash
cat > Dockerfile
```

* Add the following content in it
```bash
FROM ubuntu
RUN apt update
RUN apt install python3 python3-pip python3-flask
COPY app.py /opt/
RUN FLASK_APP=/opt/app.py flask run --host=0.0.0.0 --port=8080
```