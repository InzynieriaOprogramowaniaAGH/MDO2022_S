pipeline {
    agent any
    parameters {
    	booleanParam(name: 'PROMOTE', defaultValue: true, description: '')
    }
    stages {
        stage("Prebuild") {
            steps {
                script {
                    sh 'mkdir -p io_dir'
                }
            }
        }
        stage('Build') {
            steps {
                script {
                    sh '''
                    echo Build
                    
                    docker build -f dockerbuild -t devbuilder . --no-cache
                    docker run -v \$(pwd)/io_dir:/docker_vol devbuilder 
                    '''
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    sh '''
                    echo Test
                    docker build . -f dockertest -t devtester
                    docker run devtester
                    '''
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    sh '''
                    echo Deploy
                    
                    docker build . -f dockerdeploy -t devdeploy
                    docker run -d -v \$(pwd)/io_dir:/docker_vol devdeploy
                    '''
                }
            }
        }
	stage('Publish') {
	    when 
                {
                    expression {return params.PROMOTE}
                }
            steps {
                script {
                	archiveArtifacts artifacts: 'io_dir/typescript-starter-1.0.0.tgz', fingerprint: true
                }
            }
        }
    }
}
