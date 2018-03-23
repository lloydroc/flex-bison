FROM ubuntu
RUN apt-get update && apt-get install -y gcc libc-dev make flex bison vim
WORKDIR /code
ENTRYPOINT ["/code/spin"]
