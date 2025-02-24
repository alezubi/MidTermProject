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
                // Example: Add Docker run steps here, if needed
                bat 'docker run -d -p 8080:8080
