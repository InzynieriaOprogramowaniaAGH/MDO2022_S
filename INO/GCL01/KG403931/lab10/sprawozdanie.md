### Przygotowanie maszyn:
Przeprowadzamy standardową minimalną instalację dwóch instacji kapelusza bez gui (bo żadne gui linuxowe nie nadaje się do codziennego użytku)
![](<./Zrzut ekranu 2022-05-28 134738.jpg>)  
Mając zainstalowane dwa osobne systemy, upewniamy się, że widzą się nawzajem i ich konfiguracja jest wystarczająca do wzajemnej współpracy.
![](<./Zrzut ekranu 2022-05-28 135310.jpg>)  
![](<./Zrzut ekranu 2022-05-28 135357.jpg>)  
Pozwalamy logować się po ssh na roota zarówno na master - ułatwienie wykonania sprawozdania, kopiowanie plików na host itp - jak i slave - konieczne do połączenia ansible (teoretycznie możnaby się bawić w dodatkowe konta administracyjne o konkretnych uprawnieniach, ale na cel akademicki szkoda na to czasu).
![](<./Zrzut ekranu 2022-05-28 142439.jpg>)  
![](<./Zrzut ekranu 2022-05-28 142840.jpg>)  
Na masterze instalujemy ansible.
![](<./Zrzut ekranu 2022-05-28 140703.jpg>)  
Konfigurujemy Playbook. Najpierw kopiuję pobrany plik z dokumentacji na serwer (brak wget).
![](<./Zrzut ekranu 2022-05-28 143249.jpg>)  
Wstępna próba połaczenia z slave.
![](<./Zrzut ekranu 2022-05-28 144030.jpg>)  
Rekonfiguracja.
![](<./Zrzut ekranu 2022-05-28 144140.jpg>)  
![](<./Zrzut ekranu 2022-05-28 144247.jpg>)  
![](<./Zrzut ekranu 2022-05-28 144301.jpg>)  
W końcu konfigurujemy Playbook, mimo że tak nazywa się punkt pięć skrinów wyżej 👍.
![](<./Zrzut ekranu 2022-05-28 144501.jpg>)  
![](<./Zrzut ekranu 2022-05-28 144630.jpg>)  
![](<./Zrzut ekranu 2022-05-28 145557.jpg>)  
![](<./Zrzut ekranu 2022-05-28 145826.jpg>)  
![](<./Zrzut ekranu 2022-05-28 145816.jpg>)  
![](<./Zrzut ekranu 2022-05-28 145845.jpg>)  
Tu teoretycznie możnaby dodawać jakieś klucze i inne takie, ale po wcześniejszych przejściach już mi się nie chciało w to bawić.
![](<./Zrzut ekranu 2022-05-28 145955.jpg>)  
![](<./Zrzut ekranu 2022-05-28 150054.jpg>)  
![](<./Zrzut ekranu 2022-05-28 150103.jpg>)  
Dzięki działa.
![](<./Zrzut ekranu 2022-05-28 150144.jpg>)  