pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "vishalsingh800/ecommerce-website"
        DOCKER_CREDENTIALS_ID = "dockerhub-creds" // Set this in Jenkins
    }

    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/vishalsingh800/ecommerce-website.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    dockerImage = docker.build("${DOCKER_IMAGE}:${BUILD_NUMBER}")
                }
            }
        }

        stage('Docker Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: "${DOCKER_CREDENTIALS_ID}", usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    script {
                        sh "echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin"
                        sh "docker push ${DOCKER_IMAGE}:${BUILD_NUMBER}"
                    }
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh '''
                    kubectl set image deployment/ecommerce-deployment ecommerce-container=${DOCKER_IMAGE}:${BUILD_NUMBER} --record
                '''
            }
        }
    }
}

