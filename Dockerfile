FROM ubuntu:16.10

# Install curl
RUN apt-get update && apt-get install -y curl && apt-get clean

# Add a user and a group called meteor
RUN groupadd meteor && adduser --ingroup meteor --disabled-password --gecos "" --home /home/meteor meteor

# Installing meteor
RUN curl https://install.meteor.com/ | sh
