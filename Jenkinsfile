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
                // Example: Add Docker build steps here, if needed
                bat 'docker build -t myapp .'  // Changed from sh to bat
            }
        }

        stage('Run Docker Container') {
            steps {
                // Fixing the Docker command by ensuring it's on one line
                bat 'docker run -d -p 8081:8080 myapp'  // Changed from sh to bat
            }
        }

        stage('Deploy') {
            steps {
                // Example: Add deployment steps here, if needed
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
