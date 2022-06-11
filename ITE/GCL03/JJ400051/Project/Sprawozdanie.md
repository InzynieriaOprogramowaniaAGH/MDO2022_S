Celem projektu było stworzenie pipeline'u, który automatyczuje czynności wykonywane w ramach poprzednich laboratoriów, rozszerza je o dodatkowe funkcjonalności. Było to możliwe dzięki wykorzystaniu Jenkins'a. Stworzony Jenkinsfile został podzielony na fazy (stage): build, test, deploy, publish. Takie podejście nie tylko ułatwia tworzenie skryptu ale także przyspiesza debugowanie. 

Aby zacząć pracę konieczne jest skonfigurowanie Jenkins'a, instrukcja jak to zrobić znajduje się w ostatnim punkcie poprzedniego sprawozdania.
Natępnie tworzymy nowy projekt według poniższych screenów:

![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Project/1.PNG)

![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Project/2.PNG)

![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Project/3.PNG)

Właściwa ścieżka (script path) to: ./ITE/GCL03/JJ400051/scm/Jenkinsfile

![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Project/4.PNG)


W oparciu o poprzednie laboratorium zostały napisane dwa dockerfile, które automatyzują fazy build i test.

Na samym początku Jenkinsfile'a powstał parametr 'promote', który określa czy powstaje nowa wersja czy nie. Jeśli nie powstaje ale build się powiedzie komunikat wyjściowy ogłosi sukces.

W pierwszych dwóch stage'ach Jenkinsfile tworzył tylko kontener i kopiował zawartość.

Kolejną fazą jest 'deploy'. tutaj Jenkinsfile tworzył nowy obraz, kopiował do niego zbudowany i przetestowany plik wykonywalny, doinstalowywał niezbędne biblioteki i uruchamiał program (w tym przypadku ze względu na brak obsługi ekranu użyto -v).

Ostatnim stagem było 'publish', które tworzy nowy folder, kopiuje wynik poprzednich operacji i pakuje do skompresowanego folderu zawieracjącego w nazwie numer wersji, ale tylko wtedy gdy zaznaczony jest parametr 'promote'.

Artefakt przed dodaniem parametru 'promote':

![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Project/artifact.PNG)

Artefakt z numerem wersji:

![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Project/artifact_with_checkbox.PNG)

Dowód na powodzenie wszystkich stage'y:

![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Project/pipeline_success.PNG)

Activity Diagram:

![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/JJ400051/ITE/GCL03/JJ400051/Project/Activity_Diagram.PNG)

