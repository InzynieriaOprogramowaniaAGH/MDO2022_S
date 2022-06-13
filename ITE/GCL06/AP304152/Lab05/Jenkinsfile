pipeline 
{
	parameters
    	{
        string(name: 'VERSION', defaultValue: '1.0.0', description: '')
        booleanParam(name: 'PROMOTE', defaultValue: true, description: '')
    	}		
	agent any
	stages 
	{
	stage('Clone') 
        	{
                 steps {	
		//sh "docker system prune --all -f"
             	sh 'docker volume  create --name input_vol'
             	sh 'docker volume  create --name output_vol'
		sh 'docker volume ls'
		sh 'docker rm temp || true'
		sh 'docker run --mount "type=volume,src=input_vol,dst=/app" --name temp node bash -c "cd ~/ && ls cytoscape.js || git clone --recurse-submodules https://github.com/cytoscape/cytoscape.js.git;cp -R cytoscape.js /app; ls /app"'	 
             	sh 'docker rm temp'
		//sh "docker build -t clone . -f ./ITE/GCL06/AP304152/Lab05/docker_clone"
             	//sh "docker run -v repo_vol:/Cytoscape clone"           
        		}
		}

        stage('Build') 
        	{
		steps {
			dir("./ITE/GCL06/AP304152/Lab05"){
               //sh 'docker build -t build . -f ./ITE/GCL06/AP304152/Lab05/docker_build'
	      // sh 'docker run --name build_container -v input_vol:/Cytoscape -v output_vol:/build build'
	       sh 'docker build . -t build -f docker_build'
	       sh 'docker run --mount type=volume,src="input_vol",dst=/app --mount type=volume,src="output_vol",dst=/app_build build bash -c "cd /app/cytoscape.js && npm i;cd ..;cp -R cytoscape.js /app_build"'
			}
            	      }
        	}
		
	stage('Test') 
       		{
		steps{
			dir("./ITE/GCL06/AP304152/Lab05"){
              // sh 'docker build -t test . -f ./ITE/GCL06/AP304152/Lab05/docker_test'
	       sh 'docker build . -t test -f docker_test'
	       sh 'docker run --mount type=volume,src="output_vol",dst=/app_test test bash -c "cd /app_test/cytoscape.js && npm test"'
               //sh 'docker run --name test_container -v repo_vol:/Cytoscape test'
			}
                      }
        	}
	
	stage('Deploy') 
		{
	     steps {
		echo 'Deploy app'
		sh 'docker rm -f container_deploy || true'
		sh 'docker run -d --name container_deploy --mount type=volume,src="output_vol",dst=/app node bash -c "cd /app/cytoscape.js && npm run test"'
		sh 'sleep 30; exit $(docker inspect container_deploy --format="{{.State.ExitCode}}")'
		sh 'docker rm -f container_deploy'
		    }
		}
		
	stage('Publish_start')
		{
		when {
               	expression {return params.PROMOTE}
      		    }
			steps
			{
			sh 'mkdir /var/jenkins_home/workspace/artifacts || find /var/jenkins_home/workspace -name "artifacts"'	
			}
		}
	stage('Publish') 
		{
	when {
                expression {return params.PROMOTE}
             }
	agent {
        docker {
                image 'node:alpine'
                args '--rm --mount "type=volume,src=output_vol,dst=/usr/local/app" --mount "type=bind,src=/var/jenkins_home/workspace/artifacts,dst=/usr/local/copy" -u root:root'
               }
      	      }
	      steps {
		echo 'Create and publish'
		sh 'rm -f /usr/local/copy/* || true'
		sh "cd /usr/local/app/cytoscape.js && npm version ${params.VERSION} && npm pack"
		sh "mv /usr/local/app/cytoscape.js/cytoscape-${params.VERSION}.tgz /usr/local/copy"
		dir('/var/jenkins_home/workspace/artifacts'){
                archiveArtifacts artifacts: "*.tgz"
		echo 'Creatin and publishing complete'
		     }
		}
		}	
            
	
	}
}
