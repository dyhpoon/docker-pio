FROM java:7

WORKDIR root

ENV PIO_HOME=/root

# Install predictionio
RUN apt-get update
RUN apt-get install wget -y
RUN wget http://apache.communilink.net/incubator/predictionio/0.11.0-incubating/apache-predictionio-0.11.0-incubating.tar.gz
RUN mkdir predictionio-0.11.0 && tar zxvf apache-predictionio-0.11.0-incubating.tar.gz -C predictionio-0.11.0
RUN rm -f apache-predictionio-0.11.0-incubating.tar.gz

# Install jdbc
RUN mkdir lib/
RUN curl -o lib/postgresql-42.1.1.jre7.jar https://jdbc.postgresql.org/download/postgresql-42.1.1.jre7.jar

# add pio-env
COPY pio-env.sh predictionio-0.11.0/conf/

