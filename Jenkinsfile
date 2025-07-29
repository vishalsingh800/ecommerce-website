pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/vishalsingh800/ecommerce-website.git'
            }
        }

        stage('Build') {
            steps {
                echo 'Building the application...'
                // Example: sh 'mvn clean install'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying application...'
            }
        }
    }
}


