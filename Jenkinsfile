pipeline {
    environment {
        registry = "marbellacovino/react-test"
        registryCredential = 'dockerhub'
    }
    agent any
    tools {nodejs "node"}
    stages {
        stage('Cloneing deployments') {
            steps {
              echo 'Cloneing && pulling....'
            //   git 'https://github.com/marbellacovino/react-test.git'
            }
        }
        stage('Build') {
            steps {
               sh "npm install"
               sh "npm run build"
                script {
                    dockerImage = docker.build registry + ":v.$BUILD_NUMBER"
                }
            //    sh "docker build --no-cache . -t  marbellacovino/react-test:v.${BUILD_NUMBER}"
               
            }
        }
        stage('Publish') {
                steps {
                   echo 'Publishing....'
                    script {
                        docker.withRegistry( '', registryCredential ) {
                            dockerImage.push()
                        }
                    }
                //    sh "docker tag  marbellacovino/react-test:v.${BUILD_NUMBER} marbellacovino/react-test:v.${BUILD_NUMBER}"
                //    sh "docker push marbellacovino/react-test:v.${BUILD_NUMBER}"
            }
        }
    }
}