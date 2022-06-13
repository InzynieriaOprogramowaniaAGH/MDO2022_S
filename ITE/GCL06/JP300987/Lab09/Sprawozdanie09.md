**SPRAWOZDANIE 9**

**Przeprowadź instalację systemu Fedora w VM, skonfiguruj użytkowników, sieć, wybierz podstawowy zbiór oprogramowania, optymalnie bez GUI:**

Zastosowana konfiguracja:

![1](https://user-images.githubusercontent.com/92218468/170371999-72dc53fc-6f68-47a6-8880-0e511dad68b7.JPG)

Wybór języka:

![2](https://user-images.githubusercontent.com/92218468/170372036-94e0b62a-ee25-4059-b332-95c87e723f58.JPG)

Układ klawiatury:

![3](https://user-images.githubusercontent.com/92218468/170372075-0f3a2809-c54c-412a-84d6-b2c0c4846466.JPG)

Konfiguracja sieci:

![4](https://user-images.githubusercontent.com/92218468/170372115-e0dbe069-e218-4d4b-837b-e59d8fc30786.JPG)

Partycjonowanie dysku:

![6](https://user-images.githubusercontent.com/92218468/170372178-06f865cf-2229-4761-b87e-932fe2a79247.JPG)

Włączenie konta root'a:

![7](https://user-images.githubusercontent.com/92218468/170372221-89e45f50-0e06-4728-ad58-2ddc89c56617.JPG)

Utworzenie konta użytkownika:

![10](https://user-images.githubusercontent.com/92218468/170372271-73bc2f56-5d71-4910-b00b-92f5e37cd77e.JPG)

Wybór oprogramowania - minimalna instalacja:

![8](https://user-images.githubusercontent.com/92218468/170372353-2e28c179-0c49-4007-9790-d08807e62136.JPG)

Podsumowanie:

![5](https://user-images.githubusercontent.com/92218468/170372429-0a1eff88-cbab-4512-846b-59ad5919a9b6.JPG)

Instalacja:

![9](https://user-images.githubusercontent.com/92218468/170372384-bcdf6217-a41f-4a9a-993e-e5b211fa9739.JPG)
##
**Przeprowadź drugą instalację systemu Fedora w VM - celem drugiego systemu będzie wyłącznie serwowanie repozytorium przez HTTP:**

System został sklonowany w VirtualBox.

##
**Umieść artefakty z projektu na serwerze HTTP:**

Instalacja httpd:

![11](https://user-images.githubusercontent.com/92218468/170372483-2508fa63-d402-4bd8-ae69-1777df10a49f.JPG)
![12](https://user-images.githubusercontent.com/92218468/170372492-fa2ca8fb-1517-4833-99e9-4122ff06cf8b.JPG)

Konfiguracja firewall:

![13](https://user-images.githubusercontent.com/92218468/170372515-a9975192-25a3-40d0-967c-377ea30074cb.JPG)

Uruchomienie serwera:

![14](https://user-images.githubusercontent.com/92218468/170372534-27fa5ad6-620a-4ad1-855e-3cb1d1550bd3.JPG)

Sprawdzenie statusu serwera:

![15](https://user-images.githubusercontent.com/92218468/170372556-d9d7ff1e-fdf4-4b0f-b615-afa154428fdb.JPG)
##
**Na zainstalowanym systemie wykonaj zbiór poleceń umożliwiających pobranie artefaktu:**

Artefakt wykorzystywany w tym zadaniu:
![16](https://user-images.githubusercontent.com/92218468/170372573-c4772ad4-d52c-450c-b959-ee8f83fbd2ae.JPG)

Przeniesienie artefaktu na serwer przez program Filezilla:
![17](https://user-images.githubusercontent.com/92218468/170372586-89d624ed-2b7b-4e92-82bb-3f8558825150.JPG)

Utworzenie odpowiednich folderów:

![28](https://user-images.githubusercontent.com/92218468/170372696-46f3c73c-f61a-4b92-8672-f50f5672d9ff.JPG)

Przeniesienie artefaktu do folderu serwerowego:
![19](https://user-images.githubusercontent.com/92218468/170372608-1fef9b04-31f6-48b0-a383-103e3ee98baa.JPG)

Wyświetlenie danych znajdujących się na serwerze przez przeglądarkę:
![18](https://user-images.githubusercontent.com/92218468/170372717-93d3977b-b9d4-4d88-a16e-0975708ca73b.JPG)

Pobranie artefaktu poleceniem wget na innej maszynie wirtualnej:
![20](https://user-images.githubusercontent.com/92218468/170372741-1d870129-138d-4f46-8422-91a70459be8c.JPG)
##
**Zlokalizuj plik odpowiedzi z instalacji:**

Przeniesienie pliku zawierającego konfigurację systemu, plik ten znajduje się w katalogu /root:
![21](https://user-images.githubusercontent.com/92218468/170372759-86af7e62-03f4-4f47-a74e-f2c6bd85709e.JPG)

Przeniesienie pliku konfiguracyjnego przez program Filezilla:
![22](https://user-images.githubusercontent.com/92218468/170372769-56c9bf94-da39-4014-aca8-e763294a18e4.JPG)

Umieszczenie pliku w repozytorium:

![29](https://user-images.githubusercontent.com/92218468/170372863-18272724-41d4-446e-9bc7-a123c29a2212.JPG)
##
**Dodaj do pliku odpowiedzi niezbędne elementy:**

Zawartość pliku:
![23](https://user-images.githubusercontent.com/92218468/170372914-69f1fb1a-906d-495f-910b-0c2219deadc8.JPG)

Uzupełnienie pliku o niezbędne polecenia:
Dependencje:

%packages

@^minimal-environment

wget

%end

Zdefiniowane repozytoria:

url --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=x86_64
repo --name=updates --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f$releasever&arch=x86_64

Proces pobierania artefaktu:

%post

wget 192.168.18.103/LAB09/1.0.0_DiscordSRV-Build.jar

%end

##
**Zainstaluj system z użyciem pliku odpowiedzi:**

Po uruchomieniu obrazu należu kliknąć klawisz Tab w celu przejścia do zaawansowanej konfiguracji, gdzie korzystamy z polecenia:

vmlinuz initrd=initrd.img inst.stage2=hd:LABEL=Fedora-S-dvd-x86_64-36 rd.live.check quiet inst.ks=https://raw.githubusercontent.com/InzynieriaOprogramowaniaAGH/MDO2022_S/JP300987/ITE/GCL06/JP300987/Lab09/anaconda-ks.cfg

![24](https://user-images.githubusercontent.com/92218468/170372933-ca89890b-c105-4d1b-90b9-f14fc2cc849f.JPG)

Instalacja:

![25](https://user-images.githubusercontent.com/92218468/170372941-54fa0be1-905a-4f0d-8e56-6933f4c6c5bc.JPG)

Konfiguracja:

![26](https://user-images.githubusercontent.com/92218468/170372950-cce740a4-046a-4df4-909a-3fefdbfe05fe.JPG)

Po instalacji należy wyłączyć maszynę, usunąć zamontowany obraz płyty i ponownie uruchomić maszynę, następnie nalezy się zalogować i sprawdzić czy plik zostal pobrany:

![27](https://user-images.githubusercontent.com/92218468/170372964-d181baf5-2f24-43cc-a4aa-ba152c25e09e.JPG)

