pipeline {
    agent any

    stages {
        stage("Fetch dependencies") {
            steps {
                script {
                    sh 'echo Downloading dependencies'

                    sh 'mkdir -p shared_volume'
                    sh 'mkdir -p shared_volume_out'

                    sh 'docker build -t project-dep:latest -f Dockerfile.dep --no-cache .'
                    sh "docker run -v \$(pwd)/shared_volume:/volumein project-dep:latest"

                    sh 'ls ./shared_volume -la'
                    sh 'ls shared_volume/source -la'
                }
            }
            post {
                success {
                    sh 'echo Dependencies downloaded'
                }
                failure {
                    sh 'echo Dependencies downloading failure'
                }
            }
        }
        
        stage('Build') {
            steps {
                script {
                    sh 'echo Building'

                    sh 'docker build -t project-build:latest -f Dockerfile.build .'
                    sh "docker run -v \$(pwd)/shared_volume:/volumein -v \$(pwd)/shared_volume_out:/volumeout project-build:latest"

                    sh 'ls shared_volume_out/ -la'
                }
            }
            post {
                success {
                    sh 'echo Build finished'
                }
                failure {
                    sh 'echo Build failure'
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    sh 'echo Testing'

                    sh 'docker build -t project-test -f Dockerfile.test .'
                    sh "docker run -v \$(pwd)/shared_volume:/volumein project-test:latest"

                    sh 'ls ./shared_volume -la'
                    sh 'ls shared_volume/source -la'
                }
            }
            post {
                success {
                    sh 'echo Tests finished'
                }
                failure {
                    sh 'echo Tests failure'
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    sh 'echo Deploying'
                    
                    def TAG_COMMIT = GIT_COMMIT
                    def CONTAINER_NAME = 'deploy-test'

                    sh "docker build -t stanmarek/devops-golang-project:${TAG_COMMIT} -f Dockerfile.deploy ."
                    sh "docker run --rm -d --name ${CONTAINER_NAME} -v \$(pwd)/shared_volume_out:/volumeout stanmarek/devops-golang-project:${TAG_COMMIT}"
                    sh "docker logs ${CONTAINER_NAME}"

                    sh 'sleep 10'

                    sh "docker stop ${CONTAINER_NAME}"
                }
            }
            post {
                success {
                    sh 'echo Deploy finished'
                }
                failure {
                    sh 'echo Deploy failure'
                }
            }
        }
        stage('Publish') {
            agent any
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerhubPassword', usernameVariable: 'dockerhubUser')]) {
                    sh "docker login -u ${dockerhubUser} -p ${dockerhubPassword}"
                    sh "docker push stanmarek/devops-golang-project:${GIT_COMMIT}"
                }
            }
        }
    }
    post {
        always {
            archiveArtifacts artifacts: 'shared_volume_out/devops-golang-project', fingerprint: true
        }
    }
}
