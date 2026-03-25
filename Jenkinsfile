pipeline {
    agent { label 'jenkins-node' }
    tools {
        maven 'mvn'   // Name you configured in Tools
    }



    stages {
        stage('git clone') {
            steps {
                git 'https://github.com/burla2528/pro.git'
            }
        }
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

