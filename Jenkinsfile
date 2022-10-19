pipeline {
    agent any
    tools{
        maven 'maven_3_5_0'
    }
    stages{
        stage('Build Maven'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Rajtestgit/Jenkins-Integration-Test']]])
                sh 'mvn clean install'
            }
        }
        environment {
 DOCKERHUB_CREDENTIALS=credentials('dockerhub-credentials')
 }
 stages {
 stage('Build') {
 steps {
 sh 'mvn install'
 sh 'docker build -t $DOCKERHUB_CREDENTIALS_USR/java-jenkins:latest .'
 }
 }
 stage('Login') {
 steps {
 sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR -password-stdin'
 }
 }
 stage('Push') {
 steps {
 sh 'docker push $DOCKERHUB_CREDENTIALS_USR/java-jenkins:latest'
 }
 }
 }
 post {
 always {
 sh 'docker logout'
 }
 }
}
