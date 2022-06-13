# Sprawozdanie laboratoirum 12

## Wdrażzanie na zarządzalne kontenery: Kubernetes część 2

Na samym początku wykonywania ćwiczenia musiałem zacząć wszystko od początku
ponieważ po wykonaniu poprzedniej części ćwiczenia i próbie uruchomienia minikube kolejnego dnia wyrzuciło błąd:

- `exiting due to GUEST_PROVISION: Failed to start host: creating host: create: creating: prepare kic ssh: copying pub key: docker copy /tmp/tmpf-memory-asset544814591 into minikube:/home/docker/.ssh/authorized_keys, output: lstat /tmp/tmpf-memory-asset544814591: no such file or directory
: exit status 1`

Próba naprawy błędu trwała długo i nieskutecznie. Próbowałem następujących kroków:

Pierwsza nieudana próba:
- `docker system prune`
- `minikube delete`
- `minikube start --driver=docker`

Druga nieudana próba:
- `sudo groupadd docker`
- `sudo usermod -aG docker [user]`
- `newgrp docker`
- `minikube start`

Trzecia nieudana próba:
- `minikube start --force --driver=docker`

Czwarta nieudana próba:
- `minikube start --driver=docker --container-runtime=containerd`

Po tylu nieudanych próbach odinstalowałem minikube w następujących krokach:
- `minikube stop`
- `minikube delete`
- `rm -r ~/.minikube`
- `sudo rm /usr/local/bin/minikube`
- `systemctl stop '*kubelet*.mount'`
- `sudo rm -rf /etc/kubernetes/` 
- `docker system prune -af --volumes`

Następnie przeprowadzono ponownie wszystkie kroki z laboratorium 11

![image](https://user-images.githubusercontent.com/72975469/173101278-cc2c55fd-0457-435b-991c-c612dd1bf9f4.png)

![image](https://user-images.githubusercontent.com/72975469/173101506-0799c304-426d-4a3d-8980-3bc0056e63e3.png)

![image](https://user-images.githubusercontent.com/72975469/173101630-17973f83-e406-43ce-b2e2-056fd6492b5d.png)

![image](https://user-images.githubusercontent.com/72975469/173101977-7ed5c6f8-f88a-4844-992d-ccc247d3dbab.png)

