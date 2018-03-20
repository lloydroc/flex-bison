FROM ubuntu
RUN apt-get update && apt-get install -y gcc libc-dev make flex bison vim
COPY . /code
WORKDIR /code
ENTRYPOINT ["/code/spin"]
