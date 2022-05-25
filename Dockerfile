FROM openjdk:8
ADD target/java-jenkins-docker-pipeline.jar java-jenkins-docker-pipeline.jar
ENTRYPOINT ["java", "-jar","java-jenkins-docker-pipeline.jar"]
EXPOSE 8080
