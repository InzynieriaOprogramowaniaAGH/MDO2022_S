pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS= credentials('dockerhub')
    }
    stages {
        stage('Build') {
            steps {
                
                sh '''
                echo 'Build '
                docker-compose  build  build-agent
                docker-compose logs > build_logs.txt
                '''
            }
                  
            post {
                success {
                    echo 'Success BUILD!'
                    emailext attachLog: true,
                    body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}",
                    recipientProviders: [developers(), requestor()],
                    subject: "Success Jenkins Build",
                    to: 'adrian.dabrowski199@gmail.com'
                }
            
                failure {
                    echo 'Success BUILD!'
                    emailext attachLog: true,
                    body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}",
                    recipientProviders: [developers(), requestor()],
                    subject: "Failed Jenkins Build",
                    to: 'adrian.dabrowski199@gmail.com'
                }
            }
        }
        stage('Test') {
            steps {
                sh '''

                echo 'Testing'
                docker-compose  build  test-agent
                docker-compose  up --force-recreate -d test-agent
                '''

            }
               post {
                success {
                    echo 'Success TESTS!'
                    emailext attachLog: true,
                    body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}",
                    recipientProviders: [developers(), requestor()],
                    subject: "Success Jenkins Tests",
                    to: 'adrian.dabrowski199@gmail.com'
                }
            
                failure {
                    echo 'Failure TESTS!'
                    emailext attachLog: true,
                    body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}",
                    recipientProviders: [developers(), requestor()],
                    subject: "Failed Jenkins Tests",
                    to: 'adrian.dabrowski199@gmail.com'
                }
            }
        }
        stage('Deploy') {
            steps {
                archiveArtifacts(artifacts: '**/*.txt', followSymlinks: false)
                sh '''
                echo 'Deploy'
                docker-compose  up -d build-agent
                echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
                docker images
                docker tag build-agent:latest adriandabrowski/jenkins
                docker push adriandabrowski/jenkins
                
                '''
            }

               post {
                   always{
                       sh 'docker logout'
                   }

                    success {
                    echo 'Success DEPLOY!'
                    emailext attachLog: true,
                    body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}",
                    recipientProviders: [developers(), requestor()],
                    subject: "Success Jenkins Deploy",
                    to: 'adrian.dabrowski199@gmail.com'
                }
            
                failure {
                    echo 'Failure DEPLOY!'
                    emailext attachLog: true,
                    body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}",
                    recipientProviders: [developers(), requestor()],
                    subject: "Failed Jenkins Deploy",
                    to: 'adrian.dabrowski199@gmail.com'
                }
            }
        }
    }
}
