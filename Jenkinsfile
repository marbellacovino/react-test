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
                node{
                    sh "docker build --no-cache . -t react-test:v.${BUILD_NUMBER}"  
                }
            }
        }
        stage('Publish') {
                steps {
                   echo 'Publishing....'
                   sh "docker tag  marbellacovino/react-test:v.${BUILD_NUMBER} marbellacovino/react-test:v.${BUILD_NUMBER}"
                   sh "docker push marbellacovino/react-test:v.${BUILD_NUMBER}"
                }
        }
    }
}