# Sprawozdanie 12
# Kamil Pazgan Inżynieria Obliczeniowa GCL02

## Konwersja wdrożenia ręcznego na wdrożenie deklaratywne YAML

1. Na poprzednich laboratoriach wykonałem tylko podstawową wersję, więc zdecydowałem się na użycie obrazu serwera httpd - *https://hub.docker.com/_/httpd*.
![](./screenshots/1_httpd.PNG)
![](./screenshots/2_kubectl.PNG)
![](./screenshots/3_localhost.PNG)
![](./screenshots/4_port.PNG)

2. Plik ```docker-compose-httpd.yml``` wykorzystałem do konwersji do pliku *yaml* kubernetesa, zapomocą wcześniej zainstalowanego narzędzia *kompose*.
![](./screenshots/5_2_kompose.PNG)
![](./screenshots/5_kompose.PNG)

3. Wygenerowany plik do wdrożeń:
![](./screenshots/6_plik_wdrozen.PNG)

4. Wdrożenie za pomocą ```kubectl apply```:
![](./screenshots/7_dep_created.PNG)

5. Zbadanie statusu za pomocą ```kubectl rollout status```:
![](./screenshots/8_status.PNG)

## Przygotowanie nowego obrazu i zmiany w deploymencie

1. Nowa/stara wersja obrazu: ```httpd:2.4-alpine```
![](./screenshots/9_obraz.PNG)

2. Manipulacja ilościąreplik:

- jedna:

![](./screenshots/10_1pod.PNG)

- zero:

![](./screenshots/11_0pod.PNG)

- cztery:

![](./screenshots/12_4pod.PNG)

3. Zastosowanie starej wersji:

![](./screenshots/16_stary.PNG)
![](./screenshots/13_stary.PNG)

4. Przywrócenie poprzedniej wersji:

![](./screenshots/15_undo.PNG)

## Kontrola wdrożenia

1. Skrypt weryfikujący, czy wdrożenie "zdążyło" się wdrożyć (60 sekund):

Jeśli 60 sekund po wdrożeniu status zostanie wyrazony jako powodzenie to nastepuje wydruk informacji o sukcesie wdrożenia, natomiast jeśli nie o porażce.

![](./screenshots/17_skrypt.PNG)
![](./screenshots/18_skrypt.PNG)

## Strategie wdrożenia

1. Recreate

![](./screenshots/20_recreate2.PNG)
![](./screenshots/19_recreate1.PNG)

2. Rolling Update

![](./screenshots/22_roll2.PNG)
![](./screenshots/21_roll1.PNG)

3. Canary Deployment workload

![](./screenshots/24_canar.PNG)
![](./screenshots/23_canar.PNG)

4. Różnice:

- Recreate - Wszystkie istniejące pody są zabijane, zanim zostaną utworzone nowe.

- Rolling Update - Wdrożenie aktualizuje pody w sposób stopniowej aktualizacji. Można  kontrolować proces aktualizacji kroczącej za pomocą parametrów.

- Canary Deployment workload - korzysta z podejścia progresywnego, przy czym jedna wersja aplikacji obsługuje większość użytkowników, a inna, nowsza wersja obsługuje niewielką pulę użytkowników testowych. Wdrożenie testowe jest wdrażane dla większej liczby użytkowników, jeśli się powiedzie.


