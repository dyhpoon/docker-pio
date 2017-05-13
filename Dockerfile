FROM ubuntu:latest

RUN curl -O http://apache.communilink.net/incubator/predictionio/0.11.0-incubating/apache-predictionio-0.11.0-incubating.tar.gz
RUN tar zxvf apache-predictionio-0.11.0-incubating.tar.gz
