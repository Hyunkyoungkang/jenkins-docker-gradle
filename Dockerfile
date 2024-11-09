FROM jenkins/jenkins:latest
ARG DOCKER_GID=1000
USER root

# aws cli install
#COPY scripts/install-awscli.sh install-awscli.sh
#RUN chmod u+x install-awscli.sh && \
#    ./install-awscli.sh

# docker install
COPY scripts/install-docker.sh install-docker.sh
RUN chmod u+x install-docker.sh && \
    ./install-docker.sh

# zip install
RUN apt install zip unzip wget sudo -y

# install gradle
RUN wget https://services.gradle.org/distributions/gradle-8.10.2-bin.zip && \
    unzip -d /opt/gradle gradle-8.10.2-bin.zip && \
    echo 'export GRADLE_HOME=/opt/gradle/gradle-8.10.2' >> /etc/profile.d/gradle.sh && \
    echo 'export PATH=${GRADLE_HOME}/bin:${PATH}' >> /etc/profile.d/gradle.sh && \
    chmod +x /etc/profile.d/gradle.sh && \
    . /etc/profile.d/gradle.sh 

# set jenkins user to host docker group
RUN /usr/sbin/groupadd -g ${DOCKER_GID:-1000} -f docker && \
    /usr/sbin/usermod -aG docker jenkins

USER jenkins
