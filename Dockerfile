FROM java:7

WORKDIR root

ENV PIO_HOME=/root/predictionio-0.11.0

# Install predictionio
RUN apt-get update
RUN apt-get install wget -y
RUN wget http://apache.communilink.net/incubator/predictionio/0.11.0-incubating/apache-predictionio-0.11.0-incubating.tar.gz
RUN mkdir predictionio-0.11.0 && tar zxvf apache-predictionio-0.11.0-incubating.tar.gz -C predictionio-0.11.0
RUN rm -f apache-predictionio-0.11.0-incubating.tar.gz
ENV PATH=$PATH:~/predictionio-0.11.0/bin

# Install jdbc
RUN mkdir lib/
RUN curl -o lib/postgresql-42.1.1.jre7.jar https://jdbc.postgresql.org/download/postgresql-42.1.1.jre7.jar

# Add pio-env
COPY pio-env.sh predictionio-0.11.0/conf/
ENV PIO_CONF_DIR=~/predictionio-0.11.0/conf

# Install dependencies
RUN $PIO_HOME/make-distribution.sh -Dscala.version=2.11.8 -Dspark.version=2.1.0
