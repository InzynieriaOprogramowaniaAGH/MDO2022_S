# Kacper Sochacki 401155

## Pipieline
<br/>

### Kontener Jenkins i dind skonfigurowane wedlug instrukcji
![Kontenery](img/dind.png)

### Pliki dockerfile uzyte w pipeline
![Docker_build](img/dockerbuild.png)

![Docker_test](img/dockertest.png)

![Docker_publish](img/dockerpub.png)
<br/>
### Skonfigurowany pipeline na Jenkins:

![Jenkins1](img/jenkins1.png)

![Jenkins1](img/jenkins2.png)


### Build

### W kroku build tworze kontener na bazie ubuntu przy uzyciu dockerbuild. Klonuje repozytorium, pobieram dependencje oraz uruchamiam makefile.

![Build](img/build.png)

<br/>

### Test

### Tworze kontener na bazie kontenera budujacego oraz uruchamiam makefile test.

![Test](img/test.png)

<br/>

### Deploy

### Wyslanie obrazu do dockerhuba: ksochacki0. Aby bylo to mozliwe nalezalo dodac credentials w jenkins ->Dashboard->Manage Jenkins -> Manage Credentials -> Global i dodac swoje login i haslo

![Deploy](img/deploy.png)

### Publish

### Tworze kontener na bazie kontenera budujacego. Builduje tym razem przy uzyciu innej opcji z narzedzia poetry oraz pakuje katalog do archive.tar.xz. Nastepnie dopisuje wersje i archiwizuje plik, aby moc go pobrac z Jenkinsa. Aby zmiana nazwy byla mozliwa nalezalo dac uprawienia uzytkownikowi jenkins z grupy 1000 do folderu, w ktorym znajduje sie archive.tar.xz

![Publish](img/publish.png)

### Pipeline

### W Jenkinsie widac utworzony plik tar z wersja wybrana przy jego uruchomieniu

![Pipieline](img/pipeline1.png)
![Pipieline](img/pipeline2.png)

