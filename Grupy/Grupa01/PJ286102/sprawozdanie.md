# Integracja projektu Open Source z systemem DevOps

# Wybór projektu

Wybrany projekt to Laravel - framework do aplikacji internetowych napisany w języku PHP bazujący na wzorcu architektonicznym Model-View-Controller.

# Licencja projektu

Licencja MIT – jedna z najprostszych i najbardziej liberalnych licencji otwartego oprogramowania. Daje użytkownikom nieograniczone prawo do używania, kopiowania, modyfikowania i rozpowszechniania oryginalnego lub zmodyfikowanego programu w postaci binarnej lub źródłowej.


# Przygotowanie środowiska DevOps
  
Aby uruchomić aplikację Laravel za pomocą Dockera definujemy następujące serwisy w pliku docker-compose.yml

![image](https://user-images.githubusercontent.com/58239029/176698062-f25f8033-f54b-4f4f-8ed2-bd3cbf69fe4b.png)

nginx – serwer WWW oraz serwer proxy dla HTTP i IMAP/POP3 stworzony przez Igora Sysojewa a rozwijany i wspierany przez założoną przez niego firmę, Nginx, Inc. Zaprojektowany z myślą o wysokiej dostępności i silnie obciążonych serwisach. Wydawany jest na licencji BSD.

Aby nginx został poprawnie uruchomiony tworzymy plik konfiguracyjny serwera

![image](https://user-images.githubusercontent.com/58239029/176699764-660819ec-6418-421d-baed-ad6274874c2c.png)


![image](https://user-images.githubusercontent.com/58239029/176698169-fc48cb25-925d-4861-a0c7-096af9e3031c.png)

MySQL – wolnodostępny, otwartoźródłowy system zarządzania relacyjnymi bazami danych. MySQL rozwijany jest przez firmę Oracle. Wcześniej przez większość czasu jego tworzeniem zajmowała się szwedzka firma MySQL AB.

![image](https://user-images.githubusercontent.com/58239029/176698244-57af1795-97f3-4f9e-ac4a-e5b49eea20ed.png)

PHP – interpretowany, skryptowy język programowania zaprojektowany do generowania stron internetowych i budowania aplikacji webowych w czasie rzeczywistym.

# Uruchomenie aplikacji

Kontenery uruchamiamy za pomocą polecnia : docker-compose build && docker-compose up -d
![image](https://user-images.githubusercontent.com/58239029/176700613-262399ee-4498-4d01-9a14-20a529012467.png)

# Komunikacja z aplikacją

Z aplikacją możemy komunikować się za pomocą portu w przęglądarce internetowej: 
![image](https://user-images.githubusercontent.com/58239029/176701461-2c4e8482-d788-4b72-9c4d-4012860f3f77.png)

Lub z poziomu wiersza poleceń:

![Zrzut ekranu 2022-06-29 144249](https://user-images.githubusercontent.com/58239029/176701773-70ee8f24-fbf6-4e7f-9123-cd1bc7671fa0.png)


# Integracja projektu z Jenkins

Jenkins - serwer typu open source służący do automatyzacji związanej z tworzeniem oprogramowania. W szczególności ułatwia budowanie, testowanie i wdrażanie aplikacji. Czyli umożliwia rozwój oprogramowania w trybie ciągłej integracji i ciągłego dostarczania.


# Zestawienie nowej instancji Jenkinsa za pomocą środowiska Docker

Jenkinsa uruchamiamy w kontenerze za pomocą polecenia: 
docker run -p 8080:8080 -p 50000:50000 -d -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts

Komunikacja z Jenkinsem poza kontenerem

![image](https://user-images.githubusercontent.com/58239029/176704276-3452cec3-4574-4cfa-8938-7b7a2a30996b.png)

# Deklaracja rurociągu

Stworzenie obiektu pipeline, przeprowadzającego następujące kroki: 
- Build
- Test
- Deploy

![image](https://user-images.githubusercontent.com/58239029/176706071-4686d1a6-2842-4b4b-acc4-a6514bc25568.png)

Uruchomienie rurociągu 

![image](https://user-images.githubusercontent.com/58239029/176707038-3ab88646-1f26-4abc-bd11-1153b76729aa.png)

Wizualizacja historii budowania rurociągu

![image](https://user-images.githubusercontent.com/58239029/176708415-c27c2016-495e-4797-abb2-dc5e036678d3.png)

# Publish

Aplikacja musi znajdywać się na serwerze, ponieważ komunikacja z nią odbywa się za pomocą protokołu HTTP.



