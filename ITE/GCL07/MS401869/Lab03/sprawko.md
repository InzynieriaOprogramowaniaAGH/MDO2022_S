# Metodyki DevOps lab03 - sprawozdanie

## Kod programu oraz testy

### Struktura projektu

![](ss/1-project_tree.png)

### Konfiguracja cmake oraz budowa projektu

![](ss/2-cmake_configure_wo_docker.png)
![](ss/3-build_the_project_wo_docker.png)

### Uruchomienie testów

![](ss/4-run_tests_wo_docker.png)

## Przygotowanie obrazów

### Kontener bazowy

Użyty do realizacji ćwiczenia obraz to `gcc:latest`

### Kontener do buildu

Do budowania testów został utworzony obraz `app_builder`
na podstawie kontenera bazowego

#### Dockerfile kontenera `app_builder`

![](ss/5-app_builder_dockerfile.png)

#### Budowanie obrazu kontenera

    sudo docker build -f ./Dockerfile -t app_builder:latest .

#### Uruchomienie kontenera

    sudo docker run -v "$(pwd)/build:/usr/src/build" \        
    -v "$(pwd)/project_test:/usr/src/project" \
    -t app_builder:latest

### Kontener do testów

Do uruchomienia testów został utworzony obraz `app_tester`
na podstwie kontenera `app_builder`

#### Dockerfile kontenera `app_tester`

![](ss/6-app_tester_dockerfile.png)

#### Budowanie obrazu kontenera

    sudo docker build -f ./Dockerfile_tester -t app_tester .

#### Uruchomienie kontenera

    sudo docker run -v "$(pwd)/build:/usr/src/build" \        
    -v "$(pwd)/project_test:/usr/src/project" \
    -t app_tester:latest

## Przeprowadzenie buildu w kontenerze

brak obrazow

![](ss/7s-images_before_build.png)

#### Budowa obrazu `app_builder`

![](ss/8s-build_app_builder_image.png)

#### Budowa obrazu `app_tester`

![](ss/9s-build_app_tester_image_better.png)

#### Zawartość folderu `./build/` przed uruchomieniem kontenerów

![](ss/10s-build_dir_before_build.png)

#### Uruchomienie kontenera app_builder

![](ss/10s-run_app_builder_container.png)

#### Uruchomienie kontenera app_tester

![](ss/12s-run_app_tester_container.png)

#### Zawartość folderu `./build/` po uruchomieniem kontenerów

![](ss/11s-build_dir_after_app_builder.png)

