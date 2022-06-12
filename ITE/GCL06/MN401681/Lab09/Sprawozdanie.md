## Michał Nycz
## Informatyka-Techniczna
## Gr-lab 06
----
# Sprawozdanie
## Metodyki DevOps lab_nr_09
----
Zadania do wykonania 
----
Na początek z udostępnionego linku na poczcie pobrano obraz Fedory, który następnie zainstalowano.

Podczas instalacji wybrano język instalacji, partycje dysku, utworzono oraz włączono konto dla root'a.

![image](https://user-images.githubusercontent.com/75485199/171908714-212f8d68-209b-4a77-9bce-c4160e0d3547.png)
![image](https://user-images.githubusercontent.com/75485199/171907564-8eaf3dad-6fae-4b39-8c26-409c18bf9e99.png)
![image](https://user-images.githubusercontent.com/75485199/171907605-71238a8c-0078-4374-bccb-bd865354aa55.png)
----

W kolejnym kroku umieszczono artefakty z projektu na serwerze HTTP, udostępnienie artefaktu na localhosta.

----

W trakcie również zmieniono ustawienia sieci na VM na NAT oraz ustawiono adres routera.

----

# - Instalacja nienadzorowana:
Zlokalizowano plik odpowiedzi z instalacji: anaconda-ks.cfg

----

Następnie do tego pliku konfiguracyjnego dodano nowe potrzebne elementy:

```
# Repo
url --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=x86_64
repo --name=updates --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f$releasever&arch=x86_64
```
```
%post
mkdir app
cd app
wget http://10.0.2.2:8080/deth_1.0.0.tar.gz
tar -xzf deth_1.0.0.tar.gz
%end
```

----

Końcowym krokiem tych zajęć było przeprowadzenie kolejnej instalacji, podczas której, dzięki wcześniejszym krokom instalator systemu fedora mógł skorzystać z ustawienia instalacji z poprzedniej.

Na koniec myślę, że warto dodać, że nie wiem od czego to jest zależne ale dopiero trzecia wersja systemu Fedora jakkolwiek współpracowała, ponieważ wcześniejsze sypały błędami i nie byłem w stanie sobie z tym poradzić.
