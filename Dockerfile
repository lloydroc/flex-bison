FROM ubuntu
RUN apt-get update && apt-get install -y gcc libc-dev flex bison
COPY . /code
WORKDIR /code
ENTRYPOINT ["/code/spin"]
