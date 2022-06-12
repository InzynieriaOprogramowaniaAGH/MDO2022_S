# Sprawozdanie 12
# Kamil Pazgan Inżynieria Obliczeniowa GCL02

## Konwersja wdrożenia ręcznego na wdrożenie deklaratywne YAML

1. Na poprzednich laboratoriach wykonałem tylko podstawową wersję, więc zdecydowałem się na użycie obrazu serwera httpd - *https://hub.docker.com/_/httpd*.
![](./screenshots/1_httpd.png)
![](./screenshots/2_kubectl.png)
![](./screenshots/3_localhost.png)
![](./screenshots/4_port.png)

2. Plik ```docker-compose-httpd.yml``` wykorzystałem do konwersji do pliku *yaml* kubernetesa, zapomocą wcześniej zainstalowanego narzędzia *kompose*.\
![](./screenshots/5_2_kompose.png)
![](./screenshots/5_kompose.png)

3. Wygenerowany plik do wdrożeń:
![](./screenshots/6_plik_wdrozen.png)

4. Wdrożenie za pomocą ```kubectl apply```:
![](./screenshots/7_dep_created.png)

5. Zbadanie statusu za pomocą ```kubectl rollout status```:
![](./screenshots/8_status.png)

## Przygotowanie nowego obrazu i zmiany w deploymencie

1. Nowa/stara wersja obrazu: ```httpd:2.4-alpine```
![](./screenshots/9_obraz.png)

2. Manipulacja ilościąreplik:

- jedna:

![](./screenshots/10_1pod.png)

- zero:

![](./screenshots/11_0pod.png)

- cztery:

![](./screenshots/12_4pod.png)

3. Zastosowanie starej wersji:

![](./screenshots/16_stary.png)
![](./screenshots/13_stary.png)

4. Przywrócenie poprzedniej wersji:

![](./screenshots/15_undo.png)

## Kontrola wdrożenia

1. Skrypt weryfikujący, czy wdrożenie "zdążyło" się wdrożyć (60 sekund):

Jeśli 60 sekund po wdrożeniu status zostanie wyrazony jako powodzenie to nastepuje wydruk informacji o sukcesie wdrożenia, natomiast jeśli nie o porażce.

![](./screenshots/17_skrypt.png)
![](./screenshots/18_skrypt.png)

## Strategie wdrożenia

1. Recreate

![](./screenshots/20_recreate2.png)
![](./screenshots/19_recreate1.png)

2. Rolling Update

![](./screenshots/22_roll2.png)
![](./screenshots/21_roll1.png)

3. Canary Deployment workload

![](./screenshots/24_canar.png)
![](./screenshots/23_canar.png)

4. Różnice:

- Recreate - Wszystkie istniejące pody są zabijane, zanim zostaną utworzone nowe.

- Rolling Update - Wdrożenie aktualizuje pody w sposób stopniowej aktualizacji. Można  kontrolować proces aktualizacji kroczącej za pomocą parametrów.

- Canary Deployment workload - korzysta z podejścia progresywnego, przy czym jedna wersja aplikacji obsługuje większość użytkowników, a inna, nowsza wersja obsługuje niewielką pulę użytkowników testowych. Wdrożenie testowe jest wdrażane dla większej liczby użytkowników, jeśli się powiedzie.


