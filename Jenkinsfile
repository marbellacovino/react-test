pipeline {
    agent {
        docker {
            image 'node:6-alpine' 
            args '-p 3000:3000' 
        }
    }
    stages {
        stage('Cloneing deployments') {
            steps {
              echo 'Cloneing && pulling....'
            //  git 'https://github.com/marbellacovino/react-test.git'
            }
        }
        stage('Build') {
            steps {
               bat "docker build --no-cache . -t react-test:v.${BUILD_NUMBER}"
               
            }
        }
        stage('Publish') {
                steps {
                   echo 'Publishing....'
                   bat "docker tag  marbellacovino/react-test:v.${BUILD_NUMBER} marbellacovino/react-test:v.${BUILD_NUMBER}"
                   bat "docker push marbellacovino/react-test:v.${BUILD_NUMBER}"
                }
        }
    }
}