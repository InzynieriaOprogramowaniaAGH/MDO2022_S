# Zajęcia 02
### 2022-03-14 -- 2022-03-18
---
# Hooks, heterogeniczne środowisko pracy, instancja Dockera
- Wykonaj opisane niżej kroki i dokumentuj ich wykonanie
- Na dokumentację składają się następujące elementy:
  - plik tekstowy ze sprawozdaniem, zawierający opisy z każdego z punktów zadania
  - zrzuty ekranu przedstawiające wykonane kroki (oddzielny zrzut ekranu dla każdego kroku)
  - listing historii poleceń (cmd/bash/PowerShell)
- Sprawozdanie z zadania powinno umożliwiać odtworzenie wykonanych kroków w wykorzystaniem opisu, poleceń i zrzutów

- Sprawozdanie proszę umieścić w następującej ścieżce: ```<kierunek>/<grupa>/<inicjały><numerIndeksu>/Lab02/Sprawozdanie.md```, w formacie Markdown

## Zadania do wykonania
1. Przygotuj git hook, który rozwiąże najczęstsze problemy z commitami
* hook sprawdzający, czy tytuł commita nazywa się ```<inicjały><numer indeksu>```
* hook sprawdzający, czy w treści commita pada numer labu, właściwy dla zadania
2. Umieść hook w sprawozdaniu w taki sposób, aby dało się go przejrzeć
3. Rozpocznij przygotowanie środowiska Dockerowego
    * zapewnij dostęp do maszyny wirtualnej przez zdalny terminal (nie "przez okienko")
    * jeżeli nie jest stosowane VM (np. WSL, Mac, natywny linux), wykaż ten fakt **dokładnie**
    * zainstaluj środowisko dockerowe w stosowanym systemie operacyjnym
4. Działanie środowiska
    * wykaż, że środowisko dockerowe jest uruchomione i działa (z definicji)
    * wykaż działanie z sposób praktyczny (z własności):
      * pobierz obraz dystrybucji linuksowej i uruchom go 
      * wyświetl jego numer wersji
5. Załóż konto na Docker Hub
