pipeline {
    agent none
    stages {
        stage('Back-end') {
            agent {
                docker { image 'maven:3-alpine' }
            }
            steps {
                sh 'mvn --version'
            }
        }
        stage('Front-end') {
            agent {
                docker { image 'lachlanevenson/k8s-helm:v2.6.0' }
            }
            steps {
                sh 'which helm'
                sh 'ls'
            }
        }
    }
}
