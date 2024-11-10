#!/bin/bash


# install gradle

wget https://services.gradle.org/distributions/gradle-8.10.2-bin.zip 

unzip -d /opt/gradle gradle-8.10.2-bin.zip 

echo 'export GRADLE_HOME=/opt/gradle/gradle-8.10.2' >> /etc/profile.d/gradle.sh 

echo 'export PATH=${GRADLE_HOME}/bin:${PATH}' >> /etc/profile.d/gradle.sh 

chmod +x /etc/profile.d/gradle.sh 


. /etc/profile.d/gradle.sh




