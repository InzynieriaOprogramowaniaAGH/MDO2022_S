#!/bin/bash
 var=$(git tag -l | grep "jenkins-release-" | awk '{sub(/jenkins-release-/, "")}1' | sort -rn | awk '{ print $1+1}' | head -n1); 

 if [[ $var == "" ]]; then 
    var=0; 
fi; 

git tag -a jenkins-release-$var -m "tag"; 