pipeline {
    agent any
	parameters {
	booleanParam(name: 'PROMOTE',  description: 'If toogled new version should be published')
	
	text(name: 'VERSION', defaultValue: '', description: 'Version number that will be published')
	}        
    stages {
        stage("Pull dependencies") {
            steps {
                script {
                    echo '.::Dependencies pulling started::.'
                    docker.build("predependencies", ". -f Dockerdep")
                    sh 'echo PreDependencies container has been built'
                    sh 'docker run -v \$(pwd)/maven-dependencies:/root/.m2 -w /petclinic-app --name temp-container predependencies mvn dependency:resolve'
                    sh 'docker commit temp-container dependencies'
                    sh 'docker rm temp-container'
                }
            }
        }
        
        stage('Build') {
            steps {
                script {
                    echo '.::Build started::.'
                    sh 'ls'
                    def imageBuild = docker.build("builder", ". -f Dockerbuild")
                    sh 'rm -rf output_volume'
                    sh 'mkdir output_volume'
                    imageBuild.run("-v \$(pwd)/output_volume:/build_result")
                    sh 'ls output_volume'
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    echo '.::Tests started::.'
                    docker.build("tester", ". -f Dockertest")
                }
            }
        }
        stage('Deploy') {
            steps {
                script {                              
			timeout (1) {
				try {
                                     echo '.::Publishing::.'
				     echo 'Building deploy image'
				     sh 'docker build . --no-cache -f Dockerpublish -t deploy'
				     echo 'Starting application in pure dev container'
				     sh 'docker run --name deploy-container -d deploy'
				     sh 'sleep 20'
				     final String url = "http://localhost:8080"
                                     final String response = sh(script: "curl -s $url", returnStdout: true).trim()
                                     echo response							
				     sh 'sleep 150'
				} catch (Exception e) {
				     echo 'Exception during timeout has been thrown with message'
                                     echo e.toString()
					if (e.toString() == "org.jenkinsci.plugins.workflow.steps.FlowInterruptedException") {
						echo '.::Deployed successfully!::.'
					} else {
						throw new Exception(e.toString())
					} 
                               sh 'docker stop deploy-container'
                               sh 'docker rm deploy-container'                                                   
						}
					}
				}
			}
		}		
	stage('Publish') {
            when {
                expression { params.PROMOTE == true }
             }
              steps {
		echo '.::Publishing::.'	                           
                sh """mv output_volume/final_app.jar output_volume/'app_realease-${params.VERSION}.jar'"""
                archiveArtifacts artifacts: """output_volume/app_realease-${params.VERSION}.jar""", fingerprint: true			
            }
        }
    }
    post {
	 always {
            cleanWs()
        }
        success {
            echo '.::Succeeded, Saving artifact::.'
        }
        failure{
                echo '.::Pipeline FAILED::.'
                mail bcc: '', body: "<b>Pipeline FAILED</b><br>\n<br>Project: ${env.JOB_NAME} <br>Build Number: ${env.BUILD_NUMBER} <br> Jenkins URL: ${env.BUILD_URL}", cc: '', charset: 'UTF-8', from: '', mimeType: 'text/html', replyTo: '',subject: "ERROR CI: in project -> ${env.JOB_NAME}", to: "mich.pieczonka@gmail.com";
        }
    }
}
