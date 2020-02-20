FROM python:alpine 
LABEL maintainer="Daniel Todorov"
COPY requirements.txt /tmp/
RUN pip install -r /tmp/requirements.txt
COPY webapp /src/app/
WORKDIR /src/app/
ENV FLASK_APP=webapp
EXPOSE 5000
ENTRYPOINT ["flask", "run"]