FROM jenkins/jenkins:2.346.3-lts

USER root

RUN apt-get update -qq && apt-get upgrade -y && apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common docker-compose
RUN usermod -aG docker jenkins

USER jenkins