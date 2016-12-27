FROM ubuntu:16.10

# Install curl, bzip2
RUN apt-get update && apt-get install -y curl bzip2 bcrypt && apt-get clean

# Add a user and a group called meteor
RUN groupadd meteor && adduser --ingroup meteor --disabled-password --gecos "" --home /home/meteor meteor

# Installing meteor
USER meteor
RUN curl https://install.meteor.com/ | sh

# Linking meteor
USER root
RUN ln -s /home/meteor/.meteor/meteor /usr/local/bin/

# Set locale (needed to start MongoDB)
RUN locale-gen en_US.UTF-8
RUN export LC_ALL=en_US.UTF-8

USER meteor
