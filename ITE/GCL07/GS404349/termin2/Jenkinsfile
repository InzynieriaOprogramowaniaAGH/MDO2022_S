pipeline {

  agent any

  parameters {
    string(name: 'Version', defaultValue: '1.0.0', description: 'Version')
    booleanParam(name: 'Promote', defaultValue: true, description: 'Promote statement')
    string(name: 'Dockerfile', defaultValue: './ITE/GCL07/GS404349/termin2', description: 'Dockerfile path')
  }

  stages {

    stage('Clone') {
      steps {
        echo 'Cloning nodzik'
        sh 'docker volume create input-volume'
        sh 'docker rm tempContainer || true'
        sh 'docker run --rm --name tempContainer --mount "type=volume,src=input-volume,dst=/app" node bash -c "cd ~/ && ls nodzik || git clone https://github.com/TwixerR/nodzik;cp -R nodzik /app; ls /app"'
      }
    }

    stage('Build') {
      steps {
        echo 'Buildig nodzik with npm'
        dir("${params.Dockerfile}") {
          sh 'docker build . -t nodzik_alpine -f Dockerfile'
          sh 'docker volume create output-volume'
          sh 'docker rm nodzik-build || true'
          sh 'docker run --rm --name nodzik-build --mount "type=volume,src=input-volume,dst=/app" --mount "type=volume,src=output-volume,dst=/app_build" nodzik_alpine bash -c "cd /app/nodzik && npm install; cp -R /app/nodzik /app_build"'
        }
      }
    }

    stage('Test') {
      steps {
        echo 'Testing nodzik with npm'
        dir("${params.Dockerfile}") {
          sh 'docker rm nodzik-test || true'
           sh 'docker run --rm --name nodzik-test --mount "type=volume,src=input-volume,dst=/app_test" nodzik_alpine bash -c "cd /app_test/nodzik && npm test"'
        }
      }
    }

    stage('Deploy') {
      steps {
        echo 'Deploying nodzik'
        sh 'docker rm -f nodzik-deploy || true'
        sh 'docker run --name nodzik-deploy --mount "type=volume,src=output-volume,dst=/usr/local/app" nodzik_alpine bash -c "cd /usr/local/app/nodzik && npm run"'
        sh 'sleep 5; exit $(docker inspect nodzik-deploy --format="{{.State.ExitCode}}")'
        sh 'docker rm -f nodzik-deploy'
      }
    }

    stage('Prepare publish') {
      when {
        expression {
          return params.Promote
        }
      }
      steps {
        echo 'Preparing publish'
        sh 'ls /var/jenkins_home/workspace/artifacts || mkdir /var/jenkins_home/workspace/artifacts'
      }
    }
	stage('Publish') {
      when {
        expression {
          return params.Promote
        }
      }
      agent {
        docker {
          image 'node:alpine'
          args '--rm --mount "type=volume,src=output-volume,dst=/usr/local/app" --mount "type=bind,source=/var/jenkins_home/workspace/artifacts,dst=/usr/local/copy" -u root:root'
        }
      }
      steps {
        sh 'rm -rf /usr/local/copy/* || true'
        sh "cd /usr/local/app/nodzik && npm version --allow-same-version ${params.Version} && npm pack"
        sh "mv /usr/local/app/nodzik/boil-${params.Version}.tgz /usr/local/copy"
        dir('/var/jenkins_home/workspace/artifacts') {
          archiveArtifacts artifacts: "boil-${params.Version}.tgz"
        }
      }
    }
  }
}
