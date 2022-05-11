# Szymon Twardosz - Lab 04 DevOps

## Zachowywanie stanu

### Utworzenie 2 wolumenów o nazwach: *firstVolume* i *secondVolume*

![Screen 1](screenshots/1.png)

### Utworzenie kontenera na podstawie obrazu *ubuntu* i podpięcie do niego utworzonych wcześniej wolumenów

![Screen 2](screenshots/2.png)

### Sklonowanie repozytorium vima do wolumenu pierwszego

![Screen 3](screenshots/3.png)

### Wykazanie, że w systemie plików znajduje się sklonowane repozytorium

![Screen 4](screenshots/4.png)

### Skopiowanie repozytorium z wolumenu pierwszego do drugiego i zbudowanie go za pomocą polecenia **make**

![Screen 5](screenshots/5.png)

### Sprawdzenie czy pliki faktycznie się znajdują w wolumenie z poziomu hosta

![Screen 6](screenshots/6.png)

![Screen 7](screenshots/7.png)

## Eksponowanie portu

### Uruchomienie kontenera na podstawie obrazu *ubuntu*

![Screen 9](screenshots/9.png)

### Instalacja pakietu *iperf3* na kontenerze oraz instalacja *net-tools*

![Screen 8](screenshots/8.png)

### Uruchomienie nasłuchiwania na porcie **2000**, utworzenie drugiego kontenera, zainstalowanie na nim również pakietu *iperf3* i sprawdzenie prękości transferu pomiędzy oboma serwerami

![Screen 10](screenshots/10.png)

### Sprawdzenie prękości transferu pomiędzy hostem, a konterenem

![Screen 11](screenshots/11.png)

### Sprawdzenie prękości transferu pomiędzy hostem, a wirtualną maszyną

Sprawdzenie adresu ip

![Screen 12](screenshots/12.png)

Próba połączenia - odrzucone

![Screen 13](screenshots/13.png)

Rozwiązanie problemu odrzucenia połączenia oraz sprawdzenie nasłuchiwanych portów przez maszynę wirtualną

![Screen 14](screenshots/14.png)

Uzyskane prędkości w tym połączeniu

![Screen 15](screenshots/15.png)

### Zestawienie wszystkich prędkości ze sobą

|              | kontener - kontener | host - kontener     | host - maszyna wirtualna |
|--------------|---------------------|---------------------|--------------------------|
| Interval [s] | Bitrate [Gbits/sec] | Bitrate [Gbits/sec] | Bitrate [Gbits/sec]      |
| 0-1          | 26.7                | 31.8                | 4.62                     |
| 1-2          | 26.4                | 28.8                | 4.43                     |
| 2-3          | 26.2                | 31.6                | 4.10                     |
| 3-4          | 26.6                | 29.0                | 3.53                     |
| 4-5          | 24.6                | 30.9                | 3.78                     |
| 5-6          | 25.4                | 27.2                | 3.57                     |
| 6-7          | 26.9                | 29.4                | 2.09                     |
| 7-8          | 27.9                | 31.0                | 4.31                     |
| 8-9          | 26.0                | 28.0                | 4.43                     |
| 9-10         | 28.0                | 33.4                | 4.03                     |
| 10-11        | 25.7                | 28.0                | 4.19                     |
| 11-12        | 26.5                | 32.5                | 3.86                     |
| 12-13        | 27.4                | 29.6                | 3.75                     |
| 13-14        | 27.1                | 29.4                | 4.68                     |
| 14-15        | 25.1                | 29.5                | 4.63                     |
| 15-16        | 26.5                | 29.4                | 4.64                     |
| 16-17        | 26.3                | 29.2                | 4.09                     |
| 17-18        | 26.0                | 28.7                | 4.72                     |
| 18-19        | 25.4                | 31.7                | 4.05                     |
| 19-20        | 26.2                | 29.3                | 3.69                     |
| Srednia      | 26.3                | 29.9                | 4.06                     |

### Wnioski:

Najszybsze połączenie to host z kontenerem. Wynika to z braku pośredników. Następne jest połączenie kontener - kontener (tutaj pośrednikiem jest tylko host, czyli system operacyjny. Najwolniejsze połączenie natomiast to host - maszyna wirtualna z powodu najdłuższej trasy jaką muszą przebyć pakiety.

## Instalacja Jenkinsa

### Utworzenie sieci mostkowanej w Dockerze

![Screen 16](screenshots/16.png)

### Pobranie i uruchomienie obrazu docker:dind

![Screen 17](screenshots/17.png)

### Utworzenie pliku Dockerfile:

```
FROM jenkins/jenkins:2.332.1-jdk11
USER root
RUN apt-get update && apt-get install -y lsb-release
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli
USER jenkins
RUN jenkins-plugin-cli --plugins "blueocean:1.25.3 docker-workflow:1.28"
```

### Utworzenie obrazu na podstawie Dockerfile

![Screen 18](screenshots/18.png)

### Uruchomienie kontenera na podstawie utworzonego obrazu

![Screen 19](screenshots/19.png)

### Sprawdzenie uruchomionych kontenerów, wyświetlenie logów kontenera jenkins i skopiowanie hasła z nich (nie zmieściło się na screenie, jest na samym dole logów)

![Screen 20](screenshots/20.png)

### Wyświetlenie ekranu logowania

![Screen 21](screenshots/21.png)
