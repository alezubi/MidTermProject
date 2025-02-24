pipeline {
    agent any

    stages {
        stage('Checkout SCM') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                bat 'mvn clean install'  // Changed from sh to bat
            }
        }

        stage('Build Docker Image') {
            steps {
               //Build
                bat 'docker build -t myapp .'  // Changed from sh to bat
            }
        }

        stage('Run Docker Container') {
            steps {

                bat 'docker run -d -p 8081:8080 myapp'  // Changed from sh to bat
            }
        }

        stage('Deploy') {
            steps {

                bat 'echo Deploying to server...'  // Changed from sh to bat
            }
        }
    }

    post {
        success {
            echo 'Build and deployment succeeded!'
        }
        failure {
            echo 'Build or deployment failed.'
        }
    }
}
