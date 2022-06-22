pipeline {
    agent any
  
    stages {
        stage('Build') {
            steps {
                
                sh '''
                echo 'Building... '
                docker-compose  build  build-agent
                '''
            }
               post {

                failure {
                    echo 'Build failed!'
                    emailext attachLog: true,
                    body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}",
                    recipientProviders: [developers(), requestor()],
                    subject: "Build failed",
                    to: 'marcind1999@gmail.com'
                }
                  
                success {
                    echo 'Succesful build!'
                    emailext attachLog: true,
                    body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}",
                    recipientProviders: [developers(), requestor()],
                    subject: "Succesful build",
                    to: 'marcind1999@gmail.com'
                }
            
               
            }
        }
        stage('Test') {
            steps {
                sh '''
                echo 'Testing...'
                docker-compose  build  test-agent
                '''

            }
               post {
               
                failure {
                    echo 'Tests failed!'
                    emailext attachLog: true,
                    body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}",
                    recipientProviders: [developers(), requestor()],
                    subject: "Tests failed",
                    to: 'marcind1999@gmail.com'
                }

                 success {
                    echo 'Succesful tests!'
                    emailext attachLog: true,
                    body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}",
                    recipientProviders: [developers(), requestor()],
                    subject: "Succesful tests",
                    to: 'marcind1999@gmail.com'
                }
            }
        }
        stage('Deploy') {
            steps {
                sh '''
                echo 'Deploying...'
                docker-compose  up -d build-agent
                '''
            }
               post {

                failure {
                    echo 'Deply failed!'
                    emailext attachLog: true,
                    body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}",
                    recipientProviders: [developers(), requestor()],
                    subject: "Deply failed",
                    to: 'marcind1999@gmail.com'
                }

               
 
                    success {
                    echo 'Successful deploy!'
                    emailext attachLog: true,
                    body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}",
                    recipientProviders: [developers(), requestor()],
                    subject: "Successful deploy",
                    to: 'marcind1999@gmail.com'
                }
            
               
            }
        }
    }
}
