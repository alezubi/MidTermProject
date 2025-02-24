pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "alezubi/midtermproject"
        DOCKER_TAG = "latest"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/alezubi/MidTermProject.git'
            }
        }

        stage('Build with Maven') {
            steps {
                powershell 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                powershell '''
                    docker build -t $env:DOCKER_IMAGE:$env:DOCKER_TAG .
                '''
            }
        }

        stage('Push Docker Image') {
            steps {
                withDockerRegistry(credentialsId: 'docker-hub-credentials', url: 'https://index.docker.io/v1/') {
                    powershell 'docker push $env:DOCKER_IMAGE:$env:DOCKER_TAG'
                }
            }
        }

        stage('Deploy Application') {
            steps {
                powershell '''
                    docker stop midtermproject -ErrorAction SilentlyContinue
                    docker rm midtermproject -ErrorAction SilentlyContinue
                    docker run -d --name midtermproject -p 8080:8080 $env:DOCKER_IMAGE:$env:DOCKER_TAG
                '''
            }
        }
    }

    post {
        success {
            echo 'Build and deployment successful!'
        }
        failure {
            echo 'Build failed!'
        }
    }
}
