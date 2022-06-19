# LAB 13 - Dominika Lazarowicz

### Przygotowanie kontenera

Do zadania miałam w planach użyć gotowego obrazu nginx 

```
docker create --name nginx_base -p 80:80 nginx:alpine
```

lub własnego zamieszczonego na dockerhub'ie

https://hub.docker.com/r/dl299976/ldidil-node.js.org

### Zapoznanie z platformą

Udało się zalogować na portal azure i uruchomić uczelnianą subskrybcję, która daje 100$.

![image-20220615201339000](./img/image-20220615201339000.png)

W pierwszej wersji chciałam wykonać ćwiczenie na stronie.

Do mojego konta była stworzona domyślna grupa.

![image-20220615202104812](./img/image-20220615202104812.png)



Podczas próby tworzenia kontenera niestety wyświetlił się problem dotyczący subskrybcji![image-20220615203243156](C:\Users\dominika.lazarowicz\AppData\Roaming\Typora\typora-user-images\image-20220615203243156.png)



W drugim podejściu chciałam użyć konsoli która znajduje się na stronie. 

![image-20220615203405413](./img/image-20220615203405413.png)

### Zapoznanie z platformą

Po zalogowaniu w powershell'u  `az login` Próba stworzenia kontenera w powershellu (windows)

![image-20220616000024709](./img/image-20220616000024709.png)

Próba podpięcia subskrybcji ręcznie

![image-20220616000536365](./img/image-20220616000536365.png) 



Podobnie na maszynie wirtualnej z linuxem

![image-20220615235041359](./img/image-20220615235041359.png)

![image-20220615235359595](./img/image-20220615235359595.png)





### Wykonanie hipotetyczne

W celu wykonania ćwiczenia korzystam z oficjalnej dokumentacji microsoft

https://docs.microsoft.com/en-us/azure/container-instances/container-instances-quickstart

Stworzenia resource grupy 

`az group create --name myResourceGroup --location eastus`

Stworzenia kontenera

`az container create --resource-group myResourceGroup --name mycontainer --image mcr.microsoft.com/azuredocs/aci-helloworld --dns-name-label aci-demo --ports 80`

Ukazanie działania kontenera i aplikacji

`az container show --resource-group myResourceGroup --name mycontainer --query "{FQDN:ipAddress.fqdn,ProvisioningState:provisioningState}" --out table`

Wyświetlenie grup

`az group list`

Usunięcie kontenera

`az container show --resource-group myResourceGroup --name mycontainer`

Usunięcie grupy badawczej

`az group create --name myResourceGroup`
