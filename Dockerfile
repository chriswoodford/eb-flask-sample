FROM ubuntu:14.04

RUN apt-get update -y
RUN apt-get install -y python-setuptools

RUN easy_install pip

ADD requirements.txt /src/requirements.txt
RUN cd /src; pip install -r requirements.txt

ADD . /src

EXPOSE  5000

WORKDIR /src
ENV FLASK_APP application.py
ENTRYPOINT ["flask", "run"]
CMD ["--host=0.0.0.0"]

