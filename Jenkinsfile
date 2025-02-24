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
                powershell 'dir target'  // Verify the JAR file is present in the target folder
            }
        }

       stage('Build Docker Image') {
           steps {
               script {
                   // Make sure to set the build context correctly for Docker
                   sh 'docker build -t midtermproject C:/Users/aleja/IdeaProjects/Maven Project/MidTermProject'
               }
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
                    # Stop and remove any existing container
                    docker stop midtermproject -ErrorAction SilentlyContinue
                    docker rm midtermproject -ErrorAction SilentlyContinue

                    # Run the new container from the latest Docker image
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
