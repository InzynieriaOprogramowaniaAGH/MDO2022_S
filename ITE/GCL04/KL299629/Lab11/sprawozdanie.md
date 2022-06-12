# ***Sprawozdanie***

## Instalacja klastra Kubernetes

- Instalacja minikube'a
  
  ```
  curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

  sudo install minikube-linux-amd64 /usr/local/bin/minikube
  ```

  ![](1.png)

  ```
  minikube start
  ```

  ![](2.png)

  ```
  minikube kubectl -- get po -A
  ```

  ![](3.png)

- instalacja kubectl

  ```
  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  ```

  ![](4.png)

  Opcjonalne sprawdzenie poprawności binarnej

  ```
  curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
  ```

  ![](5.png)

  instalacja kubectl

  ```
  sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
  ```

  ![](6.png)

  sprawdzenie wersji

  ```
  kubectl version --client
  ```

  ```
  kubectl get po -A
  ```

  ![](7.png)

- ```
  minikube dashboard
  ```

  ![](8.png)
  
- Aplikacja z projektu nie uruchamia się jako osobna aplikacja w kontenerze. Dlatego wybrano obraz gotowiec ```nginx```

  ```
  minikube kubectl run -- nginx-dep --image=nginx --port 80 --labels app=nginx-dep
  ```

  ![](9.png)

  ![](10.png)

  ```
  kubectl port-forward nginx-dep 8000:80
  ```

  ![](11.png)

  ![](12.png)


## Przekucie wdrożenia manualnego w plik wdrożenia

- Plik .yml 4 repliki

  ![](13.png)

- ```
  kubectl apply -f nginx-deployment.yml
  ```

  ![](14.png)

  ![](15.png)