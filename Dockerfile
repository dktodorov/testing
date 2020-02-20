FROM python:alpine 
LABEL maintainer="Daniel Todorov"
COPY requirements.txt /src/
RUN pip install -r /tmp/requirements.txt
COPY webapp /src/app/
ENV FLASK_APP=webapp
EXPOSE 5000
ENTRYPOINT ["flask", "run"]