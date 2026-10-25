pipeline {
    agent any

    triggers {
        githubPush() // 👈 Tells Jenkins to listen for incoming GitHub webhook payloads
    }
    
    environment {
        IMAGE_NAME = 'slyytata/jenapps'
        IMAGE_TAG = "${IMAGE_NAME}:${env.GIT_COMMIT}"
    }

    stages {
        stage('Login To DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-creds', usernameVariable: 'USERNAME' , passwordVariable: 'PASSWORD')]) {
                    sh 'echo ${PASSWORD} | docker login -u ${USERNAME} --password-stdin'
                }
                echo "Login Suceeded"
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t ${IMAGE_NAME} .'
                echo "Docker Image Build Successfully"
                sh 'docker image ls'
            }
        }
        stage('Docker Push') {
            steps {
                sh "docker push ${IMAGE_TAG}"
            }
        }
    }
}
