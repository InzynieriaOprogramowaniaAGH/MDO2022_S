# Sprawozdanie - lab 9 - Bartłomiej Walasek
1. Zainstalowano minimalną wersję systemu Fedora.<br>
![install_minimal](1_minimal.PNG)
2. Utworzono root'a z prostym hasłem.<br>
![root](2_root.PNG)
3. Zainstalowano usługę httpd poleceniem ```sudo dnf -y install httpd```.<br>
![httpd_install](3_install_httpd.PNG)
4. Zmieniono ustawienia firewall'a. <br>
![firewall](4_firewall.PNG)
5. Za pomocą polecenia ```systemctl enable httpd --now``` uruchomiono, a następnie przez polecenie ```systemctl status httpd``` sprawdzono działanie serwera.<br>
![httpd_run](5_run.PNG)
