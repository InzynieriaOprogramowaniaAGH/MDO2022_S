pipeline{
	agent any

	environment {
		DOCKER_LOGIN = credentials('DOCKER_LOGIN')
		DOCKER_PASSWORD = credentials('DOCKER_PASSWORD')
	}

	stages{
		stage('Build'){
			steps {
				echo 'Building...'
				sh '''
				docker-compose build b-agent
				'''
			}
			post {
				failure {
					echo 'Building failed!'
				}
				success {
					echo 'Building successed!'
				}
			}
		}

		stage('Test'){
			steps {
				echo 'Testing...'
				sh '''
				docker-compose build t-agent
				docker-compose up -d t-agent
				'''
			}
			post {
				failure {
					echo 'Testing failed!'
				}
				success {
					echo 'Testing successed!'
				}
			}
		}

		stage('Deploy') {
			steps {
				echo 'Deploying...'
				sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_LOGIN --password-stdin'
				sh 'docker tag build-agent:latest arczan/jenkins-wireapp'
				sh 'docker push arczan/jenkins-wireapp'
			}
			post {
				failure {
					echo 'Deploying failed!'
				}
				success {
					echo 'Deploying successed!'
				}
			}
		}
	}
}

