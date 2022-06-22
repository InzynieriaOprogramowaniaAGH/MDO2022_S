pipeline{
	agent any
	tools{nodejs "nodejs"}
	
stages{
	
	
	stage('Build'){
		steps
		{
			echo 'Building'
                        checkout scm
			sh 'npm install'
                        sh 'npm run build'
		
		
	}
	post {
		always{
			echo 'Finished'
		}
		success {
			echo 'Success'
			emailext attachLog: true,
				body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}",
				to: 'klaudiabalicka82@gmail.com',
				subject: "Build success"
		}
		
		failure {
			echo 'Failure'
			emailext attachLog: true,
				body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}",
				to: 'klaudiabalicka82@gmail.com',
				subject: "Build failed."
		}
	
	

	}
}
	
		stage('Test'){
			steps{
				echo 'Testing'
				sh 'npm run test'
		}
		
		post{
	
			always{
				echo 'Finished'
			}
			failure{
				echo 'Failure'
				emailext attachLog: true,
					body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}",
					to: 'klaudiabalicka82@gmail.com',
					subject: "Test failed"
			}
			success{
				echo 'Success'
				
				emailext attachLog: true,
					body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}",
					to: 'klaudiabalicka82@gmail.com',
					subject: "Test success"
			}
		}	
	}
	
	stage('Deploy') {
            steps {
                echo 'Deploying'
                sh 'docker build -t deploy -f Dockerfile-deploy .'
                
            }
            post {
                success {
                   echo 'Success'
			emailext attachLog: true,
				body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}",
				to: 'klaudiabalicka82@gmail.com',
				subject: "Deploy success"
                }
        
                failure {
                    echo 'Failure'
                    	emailext attachLog: true,
				body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}",
				to: 'klaudiabalicka82@gmail.com',
				subject: "Deploy failed"
                }
            }
        }
	
   }

}
