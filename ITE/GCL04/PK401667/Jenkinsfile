pipeline {
    parameters {
	string(name: 'version', defaultValue: '1.0.0', description: '')
    }
    agent any
    
    stages {
        stage('build') {
            steps {
		sh 'docker kill tempContainer || true'
		sleep 1
                sh 'docker build -t buildirssi . -f ITE/GCL04/PK401667/DockerBuild'
		sh 'docker run --name tempContainer -dit --rm buildirssi'
		sh 'rm -r fe-text || true'
		sh 'rm -r irssi || true'
		sh 'docker container exec tempContainer ls'
		sh 'docker container exec tempContainer ls ..'
		sh 'docker container exec tempContainer ls build/src/fe-text'
		sh 'docker cp tempContainer:irssi/build/src/fe-text .'
		sh 'docker cp tempContainer:irssi .'
		sh 'docker kill tempContainer'
		sh 'ls irssi/build/src/fe-text'
            }
        }	
}
}
