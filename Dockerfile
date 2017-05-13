FROM java:8

WORKDIR root

# Install predictionio
RUN apt-get update
RUN apt-get install wget -y
RUN wget http://apache.communilink.net/incubator/predictionio/0.11.0-incubating/apache-predictionio-0.11.0-incubating.tar.gz
RUN mkdir predictionio-0.11.0 && tar zxvf apache-predictionio-0.11.0-incubating.tar.gz -C predictionio-0.11.0
RUN rm -f apache-predictionio-0.11.0-incubating.tar.gz
RUN predictionio-0.11.0/make-distribution.sh
RUN tar zxvf predictionio-0.11.0/PredictionIO-0.11.0-incubating.tar.gz
ENV PATH=$PATH:~/PredictionIO-0.11.0-incubating/bin
ENV PIO_HOME=/root/PredictionIO-0.11.0-incubating

# Install jdbc
RUN mkdir lib/
RUN curl -o lib/postgresql-42.1.1.jar https://jdbc.postgresql.org/download/postgresql-42.1.1.jar

# Add pio-env
COPY pio-env.sh PredictionIO-0.11.0-incubating/conf/
ENV PIO_CONF_DIR=/root/PredictionIO-0.11.0-incubating/conf

# Install dependencies
RUN wget http://d3kbcqa49mib13.cloudfront.net/spark-1.6.3-bin-hadoop2.6.tgz
RUN mkdir PredictionIO-0.11.0-incubating/vendors && tar zxvf spark-1.6.3-bin-hadoop2.6.tgz -C PredictionIO-0.11.0-incubating/vendors
