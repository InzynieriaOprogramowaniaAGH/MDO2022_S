Wykonując polecenia ze strony https://minikube.gsigs.k8s.io/docs/start/ zaopatrzono się w implementację stosu k8s, przeprowadzono instalcję i sprawdzono zainstalowaną wersję (czy wszystko przebiegło pomyślnie).
![1](https://user-images.githubusercontent.com/76969470/173193499-859613dc-0f6c-47b7-bc42-a855d436b596.PNG)

Następnie pobrano kubectl i checksum kubectl:

![2](https://user-images.githubusercontent.com/76969470/173193489-86d6cee9-f761-4f1a-9197-8c45d2052c87.PNG)

Kolejnym krokiem było zainstalowanie pobranych wcześniej pakietów i sprawdzenie wersji

![3](https://user-images.githubusercontent.com/76969470/173193491-b5c3bdaa-bcd2-4e7c-a406-802ea3ebcf9e.PNG)

W celu uruchomienia klastra konieczne jest nadanie użytkwonikowi uprawnień i stworzenie nowej grupy. Można uruchomić klaster 

![4](https://user-images.githubusercontent.com/76969470/173193492-e77107c9-8734-41c5-a119-2af74f9ce918.PNG)

Komendą docker pull nginx:latest stowrzono w kontenerze wybrany obraz i uruchomiono nginx ( w komendzie tylko --image=nginx musi się zgadzać z nazwą obrazu, pozostałe dwa wystąpienia można zastąpić inną nazwą.

![4,5](https://user-images.githubusercontent.com/76969470/173194425-8231b444-eb32-4fef-90a5-fd08a32d2e71.PNG)

Działanie

![5Dashboard](https://user-images.githubusercontent.com/76969470/173193493-2cec860f-50aa-492c-a782-0a0ad4c18dd7.PNG)

Komendą docker pull nginx:latest stowrzono w kontenerze wybrany obraz i uruchomiono nginx ( w komendzie tylko --image=nginx musi się zgadzać z nazwą obrazu, pozostałe dwa wystąpienia można zastąpić inną nazwą.


![6](https://user-images.githubusercontent.com/76969470/173193494-32b33b4b-62e8-4842-9f0e-2f0bb1e16ebf.PNG)


![7](https://user-images.githubusercontent.com/76969470/173193495-59a5e167-cbcc-4246-ad25-8442e5b7cd9e.PNG)


Działanie można też sprawdzić za pomocą przekierowywania portów (argumentami są odpowiedni: nazwa obrazu, nowy port, port z którego przekierywywany jest obraz.

Na podstawie dokumentacji powstał pliku wdrożenia dep.yaml, następnie komenda apply
![8](https://user-images.githubusercontent.com/76969470/173193496-1163cb7b-9882-4e2b-98e8-868cf21502b7.PNG)

![9](https://user-images.githubusercontent.com/76969470/173193497-44c83b9c-d0a6-42b1-8fac-1a6f80925599.PNG)


Prezentacja działania podów.
![10](https://user-images.githubusercontent.com/76969470/173193498-dffb46fb-89de-4f58-bfd5-defa7ee63109.PNG)



