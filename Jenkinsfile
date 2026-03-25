pipeline {
    agent { label 'jenkins-node' }
    tools {
        maven 'mvn'   // Name you configured in Tools
    }
    stages {
       
        stage('validate') {
            steps {
                sh 'mvn validate'
            }
        }
        stage('compile') {
            steps {
                sh 'mvn compile'
            }
        }
        stage('test') {
            steps {
                sh 'mvn test'
            }
        }
    }
    
}

