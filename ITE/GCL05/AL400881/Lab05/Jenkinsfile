pipeline {
    agent any

    stages {
        	stage('Clone repo') {
            		steps {
                		script {
        				docker.build("svelte-cloned", ". -f Dockerfile.clone")
        			}
            		}
        	}
		stage('Build') {
            		steps {
                		script {
        				def imageBuild = docker.build("svelte-built", ". -f Dockerfile.build")
        				sh "rm -rf shared"
        				sh "mkdir shared"
        				imageBuild.run("-v \$(pwd)/shared:/output")
        			}
            		}
        	}    
		stage('Test') {
            		steps {
                		script {
					docker.build("sveltejs-test", ". -f Dockerfile.test")
					sh "echo Testing phase"
				}
            		}
        	}

		stage('Publish') {
            		steps {
                		script {			
					sh "echo Deploy phase"
					sh "npm publish app"
				}
            		}
        	}
    	}
	
	post {
		success {
			archiveArtifacts artifacts: "shared/test.zip", fingerprint: true
			echo "Success!"
		}
	}
}
