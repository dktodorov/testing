FROM python:alpine 
LABEL maintainer="Daniel Todorov"
RUN pip install -r requirements.txt
COPY webapp /src/app/
ENV FLASK_APP=webapp
EXPOSE 5000
ENTRYPOINT ["flask", "run"]