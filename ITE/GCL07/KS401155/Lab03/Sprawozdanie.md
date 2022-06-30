# Sprawozdanie Lab03 Kacper Sochacki ITE-GCL07


## Cel ćwiczenia
Przeprowadzenie buildu repozytorium: https://github.com/fintoc-com/fintoc-python.git z narzedziem make w kontenerze.


## Przebieg

1. Uruchomiono kontener:
![1](pics/odpalenie1.png)

2. Zainstalowano git i potrzebne narzedznia:		
![2](pics/install_git.png)

3. Zbudowano za pomoca ```make build-env```: </br>
![3](pics/build.png)

4. Uruchomiono test za pomoca  ```make tests```:		
![4](pics/test1.png)	
![5](pics/test2.png)

5. Stworzono Dockerfile odpowiadajacy za build:		
![6](pics/docker_build_file.png)

6. Stworzono Dockerfile ktory odpowiadal za testy:
![7](pics/docker_test_file.png)

7. Uruchomiono ```DockerBuild```:		
![8](pics/docker_build1.png)		
![9](pics/docker_build2.png)		


8. Uruchomiono ```DockerTest```:		
![10](pics/docker_test.png)

10. Powstale obrazy: </br>
![11](pics/docker_images.png)


## Wnioski- Kontener a obraz
Obraz jest to wzorzec na podstawie ktorego mozemy zrobic kontener.
