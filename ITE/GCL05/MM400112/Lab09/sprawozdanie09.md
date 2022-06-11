# Lab09
## Mikołaj Migacz
### Przygotowanie wdrożeń nienadzorowanych dla platform z pełnym OS
#### Przygotowanie systemu pod uruchomienie
1. Utworzyłem nową maszynę wirtualną, na której zainstalowano system Fedora Server 36. Wybrałem instalację minimalną.
![1](./sc_devops_9/2.PNG)
2. Utworzyłem konto root'a
![2](./sc_devops_9/1.PNG)
3. Nadałem nazwę hosta. Wykorzystałem schemat który przedstawiony był na zajęciach.
![3](./sc_devops_9/3.PNG)
4. Zainstalowałem drugi system operacyjny. Schemat postępowania był taki sam jak z poprzednim natomiast jako podstawowe środowisko wybrałem opcje domyślną, czyli **Fedora Server Edition** oraz nadałem nazwę hosta **lab09.http.agh**
![4](./sc_devops_9/4.PNG)
5. Na zainstalowanym serwerze uruchomiłem komendę ```dnf group install "Web Server"```
![5](./sc_devops_9/5.PNG)
6. Uruchomiłem usługę **HTTP** i dodałem ją do zapory za pomocą komend 
```
systemctl enable httpd
firewall-cmd --add-service=http --permanent
```
![6](./sc_devops_9/6.PNG)
![7](./sc_devops_9/7.PNG)
7. Po udanym połączeniu z serwerem, wyświetliła się następująca strona.
![8](./sc_devops_9/8.PNG)
8. Utworzyłem nowy katalog i dodałem do niego przykładowy artefakt z pipeline'a.
![9](./sc_devops_9/9.PNG)
![10](./sc_devops_9/10.PNG)
9. Aby pobrać artefakt należało użyć następującego polecenia:
```
scp root@192.168.0.34:/var/www/html/petclinic/spring-petclinic-2.6.0-SNAPSHOT.jar ./petclinic
```
#### Instalacja nienadzorowana
1. Aby przeprowadzić instalację nienadzorowaną potrzebowałem uzyskać plik konfiguracyjny. Mogłem go znaleźć w poprzedniej instalacji, w pliku pod nazwą **anaconda-ks.cfg**. Aby plik był kompletny dodałem klauzulę **%post %end** która zapewniała zaciągnięcie artefaktu.
2. Utworzyłem nową maszynę w której edytowałem polecenie instalatora w menu głównym, dodając polecenie:
```
inst.ks=https://raw.githubusercontent.com/InzynieriaOprogramowaniaAGH/MDO2022_S/MM400112/ITE/GCL05/MM400112/Lab09/anaconda-ks.cfg
```
3. Za pomocą tego polecenia wczytałem plik konfiguracyjny z repozytorium, co pozwoliło zacząć proces instalacji.
![11](./sc_devops_9/11.PNG)
4. Po ukończeniu instalacji sprawdzono poprawność wykonania.
![12](./sc_devops_9/12.PNG)