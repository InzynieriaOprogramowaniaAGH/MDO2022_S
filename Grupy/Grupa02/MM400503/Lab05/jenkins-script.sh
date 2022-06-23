pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh "git clone https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/ /var/jenkins_home/workspace/LAB05/app"
                dir('/var/jenkins_home/workspace/LAB05/app/Grupy/Grupa02/MM400503/Lab04'){
                    sh "ls -al && docker-compose build"
                    sh "docker-compose up -d "
                    
                }
                
            }
        }
    }
     post {
        failure {
            sh "rm -rf /var/jenkins_home/workspace/LAB05/app"
        }
    }
}
