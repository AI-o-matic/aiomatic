FROM python:3.7.1-slim
ADD . /usr/src/app
WORKDIR /usr/src/app
COPY requirements.txt ./
RUN apt-get update && apt-get install -y libsm6 libxext6 libxrender1 libglib2.0-0
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 8000
CMD gunicorn -k gevent aiomatic.wsgi:application --bind 0.0.0.0:8000
