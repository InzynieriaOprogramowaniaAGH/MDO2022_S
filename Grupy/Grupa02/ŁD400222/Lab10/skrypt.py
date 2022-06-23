import os
import sys
import time
import multiprocessing
#nazwa obrazu: sys.argv[1]


def execution():
    os.system("minikube kubectl -- apply -f created.yaml")


if __name__ == '__main__':
    image = sys.argv[1]

    yaml_command = "minikube kubectl -- run komunikator-deployment --image=" + image + " --port=8080 --dry-run=client -o yaml"

    print("Command: " + yaml_command)
    os.system("minikube start")
    os.system(yaml_command + " >> created.yaml")

    print("Created yaml file:")
    os.system("cat created.yaml")

    print("***************")

    p = multiprocessing.Process(target=execution, name="Execution")
    p.start()

    time.sleep(60)
    
    p.terminate()

    p.join()