FROM ubuntu:latest

WORKDIR root
RUN apt-get update
RUN apt-get install wget -y
RUN wget http://apache.communilink.net/incubator/predictionio/0.11.0-incubating/apache-predictionio-0.11.0-incubating.tar.gz
RUN tar zxvf apache-predictionio-0.11.0-incubating.tar.gz
RUN rm -f apache-predictionio-0.11.0-incubating.tar.gz
