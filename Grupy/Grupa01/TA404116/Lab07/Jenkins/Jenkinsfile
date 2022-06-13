pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }
    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                sh 'docker-compose build deltachat-build'
                sh 'docker-compose logs > logs.txt'
            }
            post {
                success {
                    echo 'Build completed successfully!'
                }
                failure {
                    echo 'Error in build!'
                    sh 'false'
                }
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                sh 'docker-compose build deltachat-test'
				sh 'docker-compose up --force-recreate -d deltachat-test'
            }
            post {
                success {
                    echo 'Testing completed successfully!'
                }
                failure {
                    echo 'Error in testing!'
                    sh 'false'
                }
            }
        }
        stage('Deploy') {
            steps {
                archiveArtifacts(artifacts: '**/*.txt', followSymlinks: false)
                echo 'Deploying..'
                sh 'docker-compose  up -d deltachat-build'
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                sh '''
                docker images
                docker tag build-agent:latest dtomart/devops-lab07
                docker push dtomart/devops-lab07
                '''
            }
            post {
                success {
                    echo 'Testing completed successfully!'
                }
                failure {
                    echo 'Error in testing!'
                    sh 'false'
                }
            }
        }
    }
}