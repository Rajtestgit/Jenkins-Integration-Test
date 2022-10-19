pipeline {
    agent any
    
    tools {
       maven "Maven"
       git "Default"
    }
     
    stages {
       stage('Execute Maven') {
          steps {
             sh 'mvn package'             
          }
       }
         
       stage('Ansible Deploy') {
          steps {
              ansiblePlaybook credentialsId:'ANSIBLE_SSH_KEY',disableHostKeyChecking:true,installation:'Ansible',inventory:'hosts.yml',playbook:'main.yml'
          }
       }
    }
}
