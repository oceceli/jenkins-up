FROM jenkins/jenkins:2.346.3-lts
 
USER root

RUN apt-get update -qq && apt-get upgrade && apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common docker-compose

RUN curl -fsSL download.docker.com/linux/debian/gpg | apt-key add -

RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

RUN apt-get update -qq && apt-get install -qqy docker-ce docker-ce-cli containerd.io

RUN usermod -aG docker jenkins

USER jenkins

ENTRYPOINT ["/bin/sh", "-c", "service docker start && /sbin/tini -- /usr/local/bin/jenkins.sh"]