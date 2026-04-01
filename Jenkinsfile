pipeline {
    agent { label 'node1' }
    tools {
        maven 'maven'   // Name you configured in Tools
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
        stage('package') {
            steps {
                sh 'mvn package'
            }
        }
        
    }
    
}

