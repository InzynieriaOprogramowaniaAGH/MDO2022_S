pipeline {
    agent any 
    stages {
        stage('Build') { 
            steps {
                echo 'Building'
				sh 'docker-compose build buildsection'
				sh 'docker-compose logs > result.txt'
            }
            post {
                failure {
                    echo 'Building failed'
					sh 'false'
                }
                success {
                    echo 'Building success'
                }
            }
        }
        stage('Test') { 
            steps {
                echo 'Testing'
				sh 'docker-compose build testsection'
				sh 'docker-compose up -d testsection'
            }
            post {
                failure {
                    echo 'Testing failed'
                    sh 'false'
                }
                success {
                    echo 'Testing success'
                }
            }
        }
        stage('Deploy') {
			environment {
				CREDENTIALS = credentials('devops_lab07')
			}		
            steps {
                echo 'Deploying'
				archiveArtifacts(artifacts: '**/*.txt', followSymlinks: false)
				sh 'docker-compose up -d buildsection'
				sh 'echo $CREDENTIALS_PSW | docker login -u $CREDENTIALS_USR --password-stdin'
                sh 'docker tag build-agent:latest dodomax/devops_lab07'
                sh 'docker push dodomax/devops_lab07'
            }
            post {
                failure {
                    echo 'Deploying failed'
                    sh 'false'
                }
                success {
                    echo 'Deploying success'
                }
            }
        }
    }
    post {
		always {
			sh 'docker logout'
		}
        failure {
            echo 'Ups, something went wrong.'
        }
        success {
            echo 'Pipeline complete.'
        }
    }
}