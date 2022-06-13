# Sprawozdanie - laboratorium nr 4
## Dodatkowa terminologia w konteneryzacji, instancja Jenkins
### Zachowanie stanu
1. Przygotowanie woluminów wejściowego i wyjściowego.<br>
![volumens](1_vol_create.PNG)
2. Sprawdzenie poprawności połączenia woluminów.<br>
![check](2_volumens.PNG)
3. Uruchomienie kontenera z jednoczesnym podłączeniem woluminów.<br>
![run_cont](3_run_cont.PNG)
4. Sklonowanie repozytorium na wolumin wejściowy.<br>
![git_clone](4_gitclone.PNG)
5. Skopiowanie plików bezpośrednio na kontener.<br>
![copy](5_copy.PNG)
6. Instalacja zależności.<br>
![install](6_install.PNG)
7. Zbudowanie programu. <br>
![build](7_build.PNG)
8. Skopiowanie zbudowanych plików na wolumin wyjściowy.<br>
![copy_to_output_volume](8_copy_out.PNG)
### Eksponowanie portu
9. Uruchomienie serwera iperf na dwóch kontenerach oraz nawiązanie połączenia między nimi. 
Screen obrazuje porównanie przepustowość komunikacji.<br>
![iperf_run](10_compare.PNG)
### Instalacja Jenkinsa
10. Po utworzeniu nowej sieci pobrano i uruchomiono obraz DIND.<br>
![dind](jenkins-install.PNG)
11. Na podstawie dockerfile'a skopiowanego z dokumentacji jenkinsa zbudowano program.<br>
![build](docker_build_by_file.PNG)
12. Uruchomienie obrazu myjenkins-blueocean jako kontenera.<br>
![run_blue](second_run.PNG)
13. Utworzone obrazy Jenkins.<br>
![images](docker_ps.PNG)
14. Pierwsze operacje na Jenkinsie.<br>
![log](11_log.PNG)
14.1. Odnalezienie hasła.<br>
![password](14_pass.PNG)
15. Instalacja wtyczek.<br>
![wtyczki](12_jenkins_wtyczki.PNG)
16. Utworzenie pierwszego admina.<br>
![first_admin](13_new_admin.PNG)
