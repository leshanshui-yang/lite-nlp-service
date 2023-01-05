FROM python:3.7
ARG PYTHON_VERSION=3.7

RUN pip install numpy pandas flask flask-restplus flask-SSLify flask-Admin
RUN pip install gunicorn
RUN pip install transformers==4.16.2 torch==1.7.1

USER root
RUN apt-get update && apt-get install -y --no-install-recommends curl

COPY . /app
WORKDIR /app

EXPOSE 8080
CMD ["gunicorn", "-b", "0.0.0.0:8080", "app"]
