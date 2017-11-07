# This deploys our code on our cluster on hosted AWS
FROM nginx:1.13-alpine
LABEL vendor="Olaolu Akinsete"
LABEL com.maryboyeshow.version="0.0.1-beta"
LABEL Description="This container deploys our cluster on hosted AWS"

MAINTAINER Olaolu Akinsete version:0.1

RUN apk update && apk add -y \
    wget \
    curl \
 && rm -rf /var/lib/apt/lists/*

# install kubernetes-kops
#RUN wget https://github.com/kubernetes/kops/releases/download/1.7.1/kops-linux-amd64
#RUN chmod +x kops-linux-amd64
#RUN mv kops-linux-amd64 /usr/local/bin/kops

#  install kubernetes-kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.8.0/bin/darwin/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl
#RUN kubectl cluster-info

# install Kompose
RUN curl -L https://github.com/kubernetes/kompose/releases/download/v1.4.0/kompose-linux-amd64 -o kompose
RUN chmod +x kompose
RUN mv ./kompose /usr/local/bin/kompose

# docker build --build-arg AWS_ACCESS_KEY_ID=myaccesskey AWS_SECRET_ACCESS_KEY=mysecretkey Dockerfile
#ENV AWS_ACCESS_KEY_ID
#ENV AWS_SECRET_ACCESS_KEY
RUN echo "Printing the variables"
RUN echo ${AWS_ACCESS_KEY_ID}
RUN echo ${AWS_SECRET_ACCESS_KEY}
RUN export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
RUN export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}

# Copy and convert with Kompose
COPY docker-compose.yml /usr/share/nginx/html
WORKDIR  /usr/share/nginx/html
CMD ["kompose", "convert", "--file", "docker-compose.yml"]

# deploy with all yml files execpt for docker compose
# use credentials