pipeline {
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
              
            //    sh "docker build --no-cache . -t  marbellacovino/react-test:v.${BUILD_NUMBER}"
               
            }
             app = docker.build("marbellacovino/react-test:v.") 
        }
        stage('Publish') {
                steps {
                   echo 'Publishing....'
                //    sh "docker tag  marbellacovino/react-test:v.${BUILD_NUMBER} marbellacovino/react-test:v.${BUILD_NUMBER}"
                //    sh "docker push marbellacovino/react-test:v.${BUILD_NUMBER}"
                }
                docker.withRegistry('https://registry.hub.docker.com', 'git') {            
                        app.push("${env.BUILD_NUMBER}")            
                        app.push("latest")        
                    } 
        }
    }
}