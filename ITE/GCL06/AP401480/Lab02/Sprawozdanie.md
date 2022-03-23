# Laboratorium 02

## 1. Przygotowanie git hook'a

przed stworzeniem git hook możemy dodać dowolny commit message 

![](./02.PNG)

tworzymy plik ./git/hooks/commit-msg 

![](./01.PNG)

umieszczamy wewnątrz kod z [punktu 2](#2-kod-git-hooka)

sprawdzamy działanie naszego hook'a

![](./03.PNG)

## 2. Kod git hook'a
   
```bash
#!/bin/bash

if grep -q -w -v  "AP401480" $1
then
echo "Title error. Remember <initials><index_number>"
exit 1
fi

path=`git diff --cached`
echo "$path" | grep -o 'Lab[0-9][0-9]'
lab_num=`echo "$path" | grep -o 'Lab[0-9]*'`

if grep -q -v lab_num $1
then 
echo "Message error. Remember 'Lab<number><number>'"
exit 1
fi
```

## 3. Przygotowujemy środowisko Docker'owe

do wykonania zadania został wykorzystany WSL

![](./04.PNG)

dodajemy repozytorium dockera i instalujemy

![](./05.PNG)

zainstalowano dockera

![](./09.PNG)

dodajemy user'a do odpowiedniej grupy, aby mieć dostęp bez root'a

![](./07.PNG)

dodajemy nowy folder do zmiennej środowiskowej PATH

![](./08.PNG)

## 4. Działanie środowiska Dockerowego

poniższymi komendami wykazujemy, że środowisko jest uruchomione i działa

![](./12.PNG)


wykazujemy, że nasze środowisko działa poprzez pobranie obrazu Fedory

![](./11.PNG)


## 5. Założono konto na Docker Hub
   
![](./10.PNG)



