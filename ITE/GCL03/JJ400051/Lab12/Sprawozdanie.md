Zmodyfikowano plik wdrożeniowy tak, aby tworzył 4 repliki, rozpoczęto wdrożenia za pomocą kubectl apply i zbadano stan za pomocąkubectl rollout status

![1](https://user-images.githubusercontent.com/76969470/173252609-905dc3eb-5dbf-4e72-9b08-5f54b8046f7a.PNG)

Napisano dockerfile, wymuszający zakończenie błędem

![2](https://user-images.githubusercontent.com/76969470/173252612-cc63316d-cc7b-4f96-b178-aa63e432d243.PNG)

Zbudowano obraz za pomocą wcześniej napisanego dockerfile'a

![3](https://user-images.githubusercontent.com/76969470/173252614-9fe6207d-fc27-4b94-a3dd-066b45d8be31.PNG)

Kolejnym punktem byłą aktualizacja pliku dep.yaml a konkretnie zmiana ilości powstających replik. Poniżej:

Stan niezmieniony, z początku laboratorium

![44](https://user-images.githubusercontent.com/76969470/173252621-cd1f3fa1-5b52-4d4d-b2e5-5805390a3585.PNG)

Stan z siedmioma replikami

![47](https://user-images.githubusercontent.com/76969470/173252622-21b5cc7d-969b-4839-92e9-0ce4da8bceea.PNG)

Stan z jedną repliką

![41](https://user-images.githubusercontent.com/76969470/173252620-516954a5-ca47-44e8-a6da-b3613769e3c3.PNG)

Stan bez żadnej repliki

![40](https://user-images.githubusercontent.com/76969470/173252619-c5e322a1-f993-4241-a23a-6aad73f38ea6.PNG)

Ze zmienioną wersją obrazu na wadliwą

![4e](https://user-images.githubusercontent.com/76969470/173252616-4328a7f5-5d7e-43c9-acd7-ae176a5b75e7.PNG)

Cofnięcie do poprzedniej wersji

![5](https://user-images.githubusercontent.com/76969470/173252617-dc13a63f-68f5-4b56-bd6a-4510bc9f759a.PNG)

Następnie napisano skrypt dep.sh, odpowiadający za kontrolę wdrożenia. Wypisuje 'Congrats - Success" gdy wszystko przebiegło pomyślnie

![6](https://user-images.githubusercontent.com/76969470/173252618-83fc3b23-f2ce-4dc0-9c92-7d70ff924e7e.PNG)

Strategie wdrożenia stosuje się poprzez plik wdrożeniowy:



Recreate - zabija on wszystkie pody przed zastosowaniem nowych, aby go użyćwystarczy dopisać sekcję strategy: type: Recreate.

Rolling Update - kończy działanie wszytkich podów i uruchamia je ponownie. Oprócz zdefiniowania tak jak powyżej typu strategii, można zdefiniować atrybut maxSurge, który definiuje ilość podów dostępnych do dodania oraz maxUnavailable, który oznacza ilość niedostępnych podów.

Canary Deployment workload - korzysta z dwóch plików wdrożeniowych działającyh równolegle, posiadają one atrybuty version oraz track, które są różńe dla każdego z nich. W przypadku wdrażania nowych wersji jest to strategia bezpieczniejsza, ponieważ w przypadku problemów z nową można wrócić do poprzedniej wesji działającej równolegle.
