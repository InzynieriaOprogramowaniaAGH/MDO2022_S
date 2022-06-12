
# Sprawozdanie 10

## Dyrygent (orchestrator) wdrożeń automatycznych opartych o pełne systemy

* Przygotowanie systemu do wdrozen

Instaluje dwie maszyny wirtualne z Fedora z ustawieniami minimalnymi.

![install](https://i.imgur.com/SESL6oy.png)

Sprawdzam czy maszyny siebie widza za pomoca pinga po przelaczeniu kart sieciowych na bridged.

![ping](https://i.imgur.com/aPLf7eQ.png)

Jezeli maszyny pinguja sie bez problemu przechodzimy dalej, czyli instalujemy ansible za pomoca komendy podanej w instrukcji `dnf --assumeyes install ansible`.

![ansible](https://i.imgur.com/5CsCqVT.png)

Po zainstalowanym ansible, domyslna lokacja pliku inwentaryzacji miesci sie w `/etc/ansible/hosts` i go edytuje (IP w kids to IP slave'a).

![edit](https://i.imgur.com/G5BXPka.png)

Proba sprawdzenia polaczenia ze slave'm.

![slave connection](https://i.imgur.com/fu1vgiS.png)

Potrzeba dointalowania sshpass.

![host_key](https://i.imgur.com/OX1HHMh.png)

Stackoverflow mowi zeby w tej sytuacji w /etc/ansible/ansible.cfg dodac `host_key_checking = false`.

![change host key](https://i.imgur.com/F7bJ4Wl.png)

![another problem](https://i.imgur.com/XYVS0Bp.png)

Wyskakuje kolejny problem z laczeniem sie ze slavem. Teraz powinnismy zmienic po stronie slave'a w `/etc/ssh/sshd_config`:

![sshdconfig](https://i.imgur.com/IQjpoiq.png)

Po ZRESTARTOWANIU slave'a pokazuje nam sie piekny tekst SUCCESS.

* Stworz playbook

Wrzucamy yamlowski plik playbooka na mastera za pomoca `scp` (pobralem go na komputer z dokumentacji).

Jednak zapomnialem, ze nie jest to takie proste, bo dalej mam blad z polaczeniem sie na root'a (brak uprawnien) za pomoca scp czy pscp i tego bledu nie moge naprawic od dobrych kilku labow.
W takim razie sciagam pliczek przy uzyciu wget'a, poniewaz nie mam ustawionego user'a na ktorego moglbym wrzucic ten pliczek.

![wget](https://i.imgur.com/KahAlzX.png)

Uzylem link shortenera, poniewaz nie chce ryzykowac przepisania ogromnego linku. Zmieniam nazwe na oryginalna i edytuje pliczek.

![mv](https://i.imgur.com/YjVwogn.png)

![edit](https://i.imgur.com/kd7tlnZ.png)

![run](https://i.imgur.com/d9PKJiW.png)

Dalej wyrzuca jakis blad, wiec wracam i dodaje kolejne linijki kodu, zeby wszystko smigalo :)

![edited](https://i.imgur.com/iTbyVxA.png)

RPMFusion sie instaluje poprawnie :].

![essa](https://i.imgur.com/xDtljUc.png)

Teraz pozostalo zainstalowac cos swojego i zobaczyc czy dziala. Ja instaluje mozliwosc ifconfig'u.

![ifconfig](https://i.imgur.com/Wg5W2wS.png)

Potwierdzenie, ze nie dziala na masterze, ale na slave.

![working](https://i.imgur.com/4XONssD.png)

![proof](https://i.imgur.com/d9Cyzmx.png)

























