Metodyki DevOps

Jakub Jezierczak Informatyka Techniczna III rok

                                                        Sprawozdanie



Wyszukano i sklonowano repozytorium wykorzystujące meson jako narzędzie typu Makefile. https://github.com/sandervalstar/meson_test

![Zrzut ekranu z 2022-04-06 19-21-35](https://user-images.githubusercontent.com/76969470/162106864-c6d21188-2c40-41ef-9a40-48d368b4bbc2.png)
Konieczne było zainstalowanie narzędzia meson:

![Zrzut ekranu z 2022-04-06 19-21-45](https://user-images.githubusercontent.com/76969470/162107013-89ae6bef-adac-4ab8-9362-2170d30c620a.png)

Z jego pomocą możliwe było zbudowanie projektu i wykonanie testów.

![Zrzut ekranu z 2022-04-06 19-22-02](https://user-images.githubusercontent.com/76969470/162107066-57c7207c-9e09-4dd6-a141-867908ae06d5.png)

![Zrzut ekranu z 2022-04-06 19-22-25](https://user-images.githubusercontent.com/76969470/162107081-9e40977c-9bd0-4a08-8985-3fd148d49f2a.png)

![Zrzut ekranu z 2022-04-06 19-22-35](https://user-images.githubusercontent.com/76969470/162107104-7f432af9-3a9b-4776-b675-cf1c2972930d.png)

Kolejnym krokiem było zdalne połączenie się z maszyną wirtualną wykorzystując ssh (analogicznie do poprzednich zajęć).  Uruchomiono kontener z obrazem Debiana, sklonowano repozytorium, jednak zbudowanie go i wykonanie testów było niemożliwe.

![docker_start_lab4](https://user-images.githubusercontent.com/76969470/162107325-fc7e51fc-f1ad-4360-85c3-2eeba02b7b7d.PNG)

![clone_proof_lab4](https://user-images.githubusercontent.com/76969470/162107365-afd8d58d-a19c-4d56-8b2d-3d0f52eb4475.PNG)
Konieczne było doinstalowanie gita, mesona, gcc i build-essential.

![build_esentials_lab4](https://user-images.githubusercontent.com/76969470/162107223-c821d39b-c145-4517-a2ab-6ce43237effd.PNG)

Po czym udało się wykonać pożądane operacje
Build:

![meson_buildv1_lab4](https://user-images.githubusercontent.com/76969470/162107494-67b86e3f-1515-4ff1-94de-82fd26faeb7a.PNG)
![meson_buildv2_lab4](https://user-images.githubusercontent.com/76969470/162107498-2ddc4798-d063-418d-8664-91dcb65d1a84.PNG)
I testy:
![tests_build_lab4](https://user-images.githubusercontent.com/76969470/162107513-07676886-3b47-412f-adff-cbb1cff26dd7.PNG)

Kolejnym krokiem było stworzenie dwóch plików Dockerfile, gdzie pierwszy miał buildować projekt a drugi będący jego kontynuacją wykonywał testy. Umożliwiło to automatyzację całego procesu.

![docker_run_1_lab4](https://user-images.githubusercontent.com/76969470/162107627-df5195c9-ce3c-4b13-8f41-543922e1db91.PNG)

![dockerfile2_kod_lab4](https://user-images.githubusercontent.com/76969470/162107591-bac252c6-0c3d-48cb-a93a-928becce403b.PNG)

Zbudowano pierwszy kontener:

![docker_build_1_lab4](https://user-images.githubusercontent.com/76969470/162107803-f13645a3-cac6-4a84-bca1-f77e7690e9dd.PNG)

I uruchomiono:

![docker_run_1_lab4](https://user-images.githubusercontent.com/76969470/162107861-c0ad233f-fee1-4848-8a92-c949cc08d1db.PNG)


Wykonano testy:

![docker_run_test_1_lab4](https://user-images.githubusercontent.com/76969470/162107923-1a1fa458-f8c9-4fff-ae60-cfdd5505e5a0.PNG)


Kod pierwszego dockerfile’a:

![dockerfile1_kod_lab4](https://user-images.githubusercontent.com/76969470/162107956-41e67406-db96-4aba-a2ef-364d937cc438.PNG)

A następnie zbudowano i uruchomiono drugi kontener:
![docker_build_ostatni_2_lab4](https://user-images.githubusercontent.com/76969470/162107993-ecc263aa-97d2-4433-87c1-9dae0613fc3f.PNG)

Poprawnie zbudowany i uruchomiony kontener przeszedł testy i uzyskał własne id, różne od obrazu.
![docker_run_ostatni_2_lab4](https://user-images.githubusercontent.com/76969470/162108028-cb4737e8-a257-48e2-8655-20ccf47e018b.PNG)

Kontener pozwala korzystać z wcześniej określonych zasobów dzięki temu, jest tworzony w oparciu o obraz. Dzięki temu każdy kontener stworzony z konkretnego obrazu zawiera te same biblioteki, programy, pakiety jednak jest odizolowany.
