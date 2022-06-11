# 1. Instalacja

### Zgodnie z dokumentacją instaluję Kubernetesa wykorzystując instrukcję z dokumentacji.
![](instalacja.png)
![](instalacja2.png)
![](kubernetes_container.png)

### Uruchamiam dashboard i dodaję alias
![](dashboard_alias.png)
![](dashboard_browser.png)


# 2. Analiza 
### Korzystam z gotowego obrazu, zuplodowanego przeze mnie na dockerhuba.
![](app_start_docker.png)
### Kontener ten jak najbardziej działa
![](kont_stoi.png)


# 3. Uruchomienie oprogramowania na Kubernetesie
### Stawiam kontener na Kubernetesie za pomocą poniższego polecenia:
![](dodanie_apki.png)
### Jak widać powyżej, został utworzony pod, który jest odpowiedzialny za aplikację. Widok w dashboardzie:
![](pod_dziala.png)
### Żeby potwierdzić poprawne działanie wchodzę także na port wyprowadzany przez aplikację
![](works_kube.png)

# 4. YAML
### Napisałem plik .yaml, niestety przez nieuwagę nie zrobiłem screena przed dokonaniem uploadu. Post factum Kubernetes dokonał modyfikacji pliku, przez co z pliku liczącego około 20 linii powstało prawie 150 linii
![](YAML.png)

