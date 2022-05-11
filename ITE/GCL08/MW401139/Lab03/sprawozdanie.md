# Michał Wojdyła 401139

 ## Pobranie obrazu node:

 ![Node](./pull_node.png)

 <br/>

 ## Utworzenie kontenera:

 ![Create_container](./create_container.png)

 <br/>
 
 ## Sklonowanie repozytorium projektu node'owego:

 ![Clone_repo](./clone_repo.png)

 <br/>

 ## Instalacja zalezności, bibliotek:
 
 ![Install_packages](./install_packages.png)

 <br/>
 
 ## Zbudowanie projektu:
 
 ![Build](./build.png)

 <br/>
 
 ## Uruchomienie testów:
 
 ![Test_1](./test_1.png)
 ![Test_2](./test_2.png)

 <br/>

 ## Utworzenie dwóch plików dockerfile:
 
 <br/>

 #### 1) Kontener wykonujący wszystkie kroki do builda:
 `FROM node:latest`

 `RUN apt update`

 `RUN git clone https://github.com/node-red/node-red`

 `WORKDIR /node-red`

 `COPY ./ /node-red`

 `RUN npm install && npm run build`

 ![Docker_build](./docker_build.png)

  <br/>

  #### 2) Kontener bazujący na pierwszym, wykonujący testy:
 `FROM builder:latest`

 `WORKDIR /node-red`

 `COPY ./ /node-red`

 `RUN npm run test`

 ![Docker_test](./docker_test.png)
 
 

 
 

