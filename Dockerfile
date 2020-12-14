FROM centos:7

COPY . ./app

RUN yum install -y python-pip python36u python36u-libs python36-devel python36u-pip uwsgi which gcc

WORKDIR /app

RUN mv /usr/bin/python /usr/bin/python_old
RUN cd /usr/bin && ln -s python3.6 python

RUN python -m pip install -r requirements.txt

CMD ["uwsgi","--ini","app.ini"]

EXPOSE 90