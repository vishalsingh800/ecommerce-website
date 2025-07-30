pipeline {
  agent any
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
  }
  stages {
    stage('Checkout') {
      steps {
        git url: 'https://github.com/vishalsingh800/ecommerce-website.git', branch: 'main'
      }
    }
    stage('Docker Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Build Docker Image') {
      steps {
        sh 'docker build -t vishalsingh800/ecommerce-app .'
      }
    }
    stage('Push to Docker Hub') {
      steps {
        sh 'docker push vishalsingh800/ecommerce-app'
      }
    }
  }
}

