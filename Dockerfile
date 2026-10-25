FROM ubuntu:22.04
RUN apt-get update
RUN apt-get install -y vim
RUN apt-get install -y git
CMD ["echo" , "Hello and welcome to my docker World"]