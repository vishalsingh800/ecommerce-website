pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'vishalsingh800/ecommerce-website'
        DOCKER_TAG = 'latest'
    }

    stages {
        stage('Clone') {
            steps {
                git:branch: 'main', 'https://github.com/vishalsingh800/ecommerce-website.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE:$DOCKER_TAG .'
            }
        }

        stage('Login to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-cred', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker push $DOCKER_IMAGE:$DOCKER_TAG'
            }
        }
    }
}


