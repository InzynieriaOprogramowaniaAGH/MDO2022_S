#!/usr/bin/env python

import sys, os
import subprocess as sp
import json
import string

if len(sys.argv) < 2:
  sys.exit("This message required 1 parameter (image name).")

imageFile = sys.argv[1]

with open("deployment.template.yaml") as f:
  template = string.Template(f.read())

final_output = template.substitute(imageName=sys.argv[1])
with open(".deployment.yaml", "w") as output:
    output.write(final_output)


sp.getoutput('kubectl apply -f .deployment.yaml')
os.remove(".deployment.yaml")
print("Deploy in progress...")
result = sp.getoutput('kubectl rollout status deployment/komunikator-deployment --timeout=60s').split('\n')
print(result[-1])
if 'deployment "komunikator-deployment" successfully rolled out' not in result:
  print("Reverting...")
  print(sp.getoutput('kubectl rollout undo deployment/komunikator-deployment'))
else:
  print("Success")

