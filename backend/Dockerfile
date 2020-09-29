FROM python:3.8

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /home/backend

COPY ./requirements.txt /home/backend/requirements.txt
RUN pip install -r /home/backend/requirements.txt

COPY . /home/backend
EXPOSE 8000

