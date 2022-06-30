# Metodyki DevOps lab01 sprawozdanie

## **1. Instalacja klienta GIT**
<img src="ss/1_git_installation.png" alt="git_installation_status">

---

## **2. Klonowanie repozytorium poprzez HTTPS**
<img src="ss/2_clone_repo_by_HTTPS.png">

---

## **3. Klonowanie repozytorium poprzez SSH**
## **3.1. Generacja kluczy**

Opis parametrów
---

| Opcja | Opis |
| ---   | ---  |
| `-t`  | Określa typ klucza używanego do enkrypcji i dekrypcji |
| `-b`  | W przypadku ECDSA określa rozmiar klucza poprzez wybranie rozmiaru krzywej eliptycznej |
| `-a`  | Określenie liczby rund KDF |
| `-C`  | Komentarz do klucza |
| `-f`  | lokalizacja i nazwa pary kluczy |
## **3.1.1. Generacja klucza `ECDSA`**
<img src="ss/3_generate_ecdsa_key.png">

Komenda użyta do generacji klucza
---

```zsh
ssh-keygen -t ecdsa -b 521 -a 100 -C "Key only for task completion." -f ~/.ssh/ecdsa_key
```

## **3.1.2. Generacja klucza `ed25519`**
<img src="ss/4_generate_ed25519_key.png">

Komenda użyta do generaji klucza
---
```zsh
ssh-keygen -t ed25519 -a 100 -C "This key will be used." -f ~/.ssh/ed25519_key
```

## **3.1.3. Podsumowanie operacji dodawania kluczy**

<img src="ss/5_github_ssh_keys_summary.png">

## **3.2. Konfiguracja kluczy**
<img src="ss/6_creation_of_ssh_agent_and_adding_the_key.png">

Utworzenie agenta ssh
---
```zsh
eval "$(ssh-agent -s)"
```
Dodanie klucza prywatnego `ed25519` do utworzonego agenta
---
```zsh
ssh-add ~/.ssh/ed25519_key
```

## **3.3. Sklonowanie repozytorium**
<img src="ss/7_clone_repo_by_ssh.png">

---

## **4. Przełączenie gałęzi**
<img src="ss/8_switching_to_main_then_to_ITE-GCL07.png">

---

## **5. Utworzenie własnej gałęzi**
<img src="ss/9_create_own_branch_and_subdirs.png">

---

## **6. Praca na gałęzi**
<img src="ss/10_commiting_screenshots.png">