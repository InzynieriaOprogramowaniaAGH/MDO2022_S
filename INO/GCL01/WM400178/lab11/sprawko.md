## Wiktor Młynarczyk - Kuberneters cz.1

1. Zainstalowałem minikube oraz kubectl, zrobiłem to już kilka miesięcy wcześniej, więc nie mam screenów  z procesu instalacji.
    
Dla potwierdzenia screen outputu z komendy `minikube status:`

# ![Alt text](0-dziala.PNG?raw=true)

2. Wymagania sprzętowe są dosyć duże, jednak nie było problemów z instalacją,
# ![Alt text](5-wymagania.PNG?raw=true)

3. Następnie przystąpiłem do uruchomienia Kubernetes:
# ![Alt text](2-Minikube-start.PNG?raw=true)
4. Uruchomiłem dashboard za pomocą komendy `minikube dashboard:`

# ![Alt text](4-dashboard.PNG?raw=true)

Jak widać, nie mamy jeszcze odpalonych żadnych serwisów, podów, itd. Warto zaznaczyć, dashboard działa w trybie _detach_, więc terminal, w którym włączyliśmy komendę jest zajęty i musimy używać innego.

5. Jeśli środowisko minikube jest już skonfigurowane, możemy przystąpić do odpowiedniej części zadania. Aplikacją, którą będe wdrażał na minikube, jest moja własna, prosta aplikacja - ToDo app. Składa się ona tak naprawdę z trzech plików:
* index.html
* styles.css
* script.js

Aplikacja ta będzie działać na **nginx**. 

6. Stworzyłem odpowiedni dockerfile, w celu stworzenia obrazu mojej aplikacji:
```
FROM nginx:stable-alpine

COPY index.html /usr/share/nginx/html
COPY styles.css /usr/share/nginx/html
COPY app.js /usr/share/nginx/html
```
Po stworzeniu dockerfile, musimy zbudować obraz:

# ![Alt text](5-docker-build.PNG?raw=true)

7. Teraz należy sprawdzić, czy nasza aplikacja działa tak, jak powinna. Uruchomiłem więc kontener na podstawie jej obrazu:
# ![Alt text](6-docker-run.PNG?raw=true)

Jak widać (lub też nie do końca), komenda zadziałała, i nasz kontener powinnien być mapowany na port 8080. Sprawdźmy to:

# ![Alt text](7-app-localhost.PNG?raw=true)

8. Skoro mamy pewnośc, że nasz kontener działa lokalnie, musimy umieścić obraz naszej aplikacji na **dockerHubie**. Jest to konieczne, ponieważ aby zrobić deployment na minikube, musimy podać nazwe obrazu. Jest ona domyślnie brana z dockerHuba, także jakbym wpisał np. nazwę obrazu `--image=todo`, gdzie **todo** to mój lokalny obraz, wystąpiłby błąd (o którym wcześniej nie wiedziałem i myślałem, że minikube ogarnia lokalne obrazy).

Komendy odpowiedzialne za spushowanie obrazu na dockerHuba:

# ![Alt text](7-push-to-dockerhub.PNG?raw=true)

Po spushowaniu obrazu, na moim repozytorium powinien pojawić się update obrazu, wraz z najnowszym tagiem:

# ![Alt text](100-dashboard.PNG?raw=true)

7. Nasz obraz jest już gotowy, w takim razie możemy przejść do lokalnego wdrażania aplikacji do Minikube

Na początku musimy stworzyć deployment:
```
kubectl create deployment app --image=4202137/todo:lastest --port=80
```
Tak jak pisałem wcześniej, `--image=4202137/todo:lastest` jest to obraz naszej aplikacji na dockerhubie, gdzie **4202137** to nazwa użytkownika, **todo** to nazwa repozytorium, a **:latest** to wersja aplikacji. 

następnie musimy wyeksponować nasz deployment:
```
kubectl expose deployment app
```
Teraz przechodzimy do ważnej rzeczy, którą jest **addon Ingress**.

###Ingress
Ingress to zestaw reguł, który umożliwia połączeniom przychodzącym dotarcie do usług klastra Kubernetes. Zazwyczaj klaster kubernetes jest chroniony zaporą sieciową z Internetu. Ma routery brzegowe wymuszające zaporę. Zasoby Kubernetes, takie jak usługi, zasobniki, mają adresy IP, którymi można kierować wyłącznie w sieci klastra i nie są (bezpośrednio) dostępne poza klastrem. Cały ruch, który kończy się na routerze brzegowym, jest albo odrzucany, albo przekazywany w inne miejsce. Tak więc przesłanie ruchu przychodzącego do klastra definiuje zestaw reguł routingu ruchu zewnętrznego do punktów końcowych Kubernetes.

### Ingress kontroller 
Aby zasób Ingress działał, klaster musi mieć uruchomiony kontroler Ingress. Gdy użytkownik żąda ruchu przychodzącego, wysyłając zasób Ingress  do serwera API, kontroler Ingress jest odpowiedzialny za realizację ruchu przychodzącego, zwykle za pomocą modułu równoważenia obciążenia. Chociaż może również skonfigurować routery brzegowe lub dodatkowe frontendy, aby pomóc w obsłudze ruchu.

W związku z tym bez kontrolera Ingress do zaspokojenia ruchu przychodzącego, samo utworzenie zasobu ruchu przychodzącego nie przyniesie żadnego efektu.

Aby włączyć ingress, musimy wpisac komendę:
```
minikube addons enable ingress
```
Teraz, aby dokończyć konfigurację naszej aplikacji na klastrze minikube musimy wpisać:
```
kubectl create ingress app-localhost --class==nginx --rule=app.localdev.me/*=app:80
```

Ostatnią rzeczą jest przekierowanie portów, abyśmy mogli dostać się z poziomu hosta do aplikacji:
```
kubectl port-forward --namespace=ingress-nginx service/ingress-nginx-controller 8080:80
```

całość komend powinna przebiegać w taki sposób:
# ![Alt text](7-tworzenie-ingerssa-i-deploymentu.PNG?raw=true)

8. Jeśli komendy nie wyrzuciły żadnego błędu, nasza aplikacja powinna być dostepna na `app.localdev.me:8080`:

# ![Alt text](8-pod-dziala.PNG?raw=true)

Od siebie dodam, że straciłem wiele czasu, na próbowaniu osiągnięcia tego samego rezultatu, ale bez używania Ingressa nginx. Próbowałem używać zwykłego przekierowania, np:
```
 kubectl port-forward service/app 7080:3000

```
Jednak za każdym razem localhost odrzucał połączenie. Być może da się to zrobić w jeszcze inny sposób, ale nie mogłem nic znaleźć w zasobach internetu oraz w oficjalnej dokumentacji.

**update moich przemyśleń jest na końcu sprawozdania**

Jeśli wejdziemy teraz w dashboard, który odpaliliśmy na samym początku komendą `minikube dashboard`, powinniśmy mieć przed sobą podobny obraz:

# ![Alt text](dashboard-redi.PNG?raw=true)

9. YML

Na koniec próbowałem stworzyć plik YML, który by zautomatyzował proces wdrażania, jednak miałem z nim zbyt duże problemy -  a dokładniej z ingressem. Więc stworzyłem prosty plik .YML:
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: todo-app
  labels:
    app: todo-app
spec:
  replicas: 1
  selector:
    matchLabels:
      app: todo-app
  template:
    metadata:
      labels:
        app: todo-app
    spec:
      containers:
      - name: todo-app
        image: 4202137/todo:latest
        ports:
        - containerPort: 8080
---
apiVersion: v1
kind: Service
metadata:
  name: todo-app-service
  labels:
    app: todo-app
spec:
  selector:
    app: todo-app
  type: NodePort
  ports:
  - port: 80
    nodePort: 31364
    targetPort: 8080
    protocol: TCP
    name: http
```
Jak widać nie uwzględniłem w nim Ingressa - potraktowałem tę częśc sprawozdania jako swego rodzaju zaznajomienie z tematem wdrażania przez .YML.
# ![Alt text](jaml.PNG?raw=true)
# ![Alt text](apply-.PNG?raw=true)

Nasz dashboard powinien być teraz zaktualizowany:

# ![Alt text](dasz-2.PNG?raw=true)

### Update na temat Ingresa
Po dogłębnej analizie tematu, być może znalazłem powód, dla którego bez ingresa, mój kontener nie działa (localhost odrzucał połączenie). Pisząc dockerfile nie dodałem linijki `EXPOSE 3000`.

Według mnie sytuacja wygląda tak, że ze mimo tego, że próbowałem zmapować hosta na minikube, to w dalszym ciągu nie istnieje mapowanie  minikube ->todoApp, co skutkowało brakiem połączenia ze strony hosta.




