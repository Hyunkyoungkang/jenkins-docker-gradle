# jenkins-docker-gradle


# 젠킨스 컨테이너 설치하기

# docker image build
docker build -t jenkins-docker-gradle:latest .
docker tag jenkins-docker-gradle:latest hyunkyoungkang/jenkins-docker-gradle:latest

#docer image push 
docker push hyunkyoungkang/jenkins-docker-gradle:latest


# create jenkins container 
docker run -d --name jenkins -v /var/run/docker.sock:/var/run/docker.sock -v jenkins_home:/var/jenkins_home -p 8080:8080 jenkins-docker-gradle:latest
