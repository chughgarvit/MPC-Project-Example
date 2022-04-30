# Virtualization and Cloud Computing 
# (Made by: Garvit Chugh M20CS018)
.
.
.
.
## Instructor: Dr. Sumit Kalra (Assistant Professor, Department of Computer Science & Engineering @ Indian Institute of Technology, Jodhpur)

## Assessment 1: Question 2
.
.
.
.
### Process followed
1. Created a simple web app to save notes quickly. (functionality explained later)
2. Installed docker. (process explained here: https://docs.docker.com/desktop/mac/install/)
3. Logged in with docker credentials in the Docker Desktop application.
3. In order to build the docker image from scratch, I used the UBUNTU base image. and installed apache on it to create my own webser docker image named as "m20cs018server". The Dockerfile being used in this image is as follows,
``` sh
FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install apache2 -y
RUN apt-get install apache2-utils -y
RUN apt-get clean
EXPOSE 80
CMD ["apache2ctl","-D","FOREGROUND"]
``` 
>> Explanation of the above Dockerfile

Ubuntu is our base image in which we are launching our server.
In the second line, is to set a non-interactive environment.
In the third line, the apt-get update command is used to update all the packages on Ubuntu.
In the fourth line, we are installing apache2 on our image.
In the fifth line, we are installing all the necessary utility Apache packages.
In the sixth line, the apt-get clean command cleans all the unnecessary files from the system.
In the seventh line, the EXPOSE command is used to expose the port 80 of Apache in the container.
The last command is used to run apache2 in the background.

5. After the base image for our webserver was setup, it was time to push this image of the webserver to dockerhub so that I can pull it in my own webapp's Dockerfile. The following command was used to create the webserver image and pushing it to the docker hub,
``` sh
sudo docker build . -t m20cs018server
docker image build -t garvitchugh/m20cs018server:v1 .
docker image push garvitchugh/m20cs018server:v1
``` 
The ouput of the above commands was,
``` sh
garvitchugh@Garvits-MacBook-Air m20cs018server % docker image push garvitchugh/m20cs018server:v1
The push refers to repository [docker.io/garvitchugh/m20cs018server]
45445c0af74e: Pushed 
2b073c1fe018: Pushed 
cee7bfaaf620: Pushed 
67ec09487bfc: Pushed 
4942a1abcbfa: Mounted from library/ubuntu 
v1: digest: sha256:a589cf0ed96b544cf6a3644c6d74bfd6ea58dcc6eebe09810873fc62ffc2125e size: 1367
``` 

The link of the dockerhub repo is: https://hub.docker.com/repository/docker/garvitchugh/m20cs018server

6. After setting up the Dockerfile for the webapp hosting on the repository, it was time to pull this image in the webapp's Dockerfile.
```sh
FROM garvitchugh/m20cs018server:v1
WORKDIR /var/www/html
RUN mkdir gg
WORKDIR /var/www/html/gg
COPY . /var/www/html/gg/
``` 
Using the first statement, the webserver image got pulled from the repository on the dockerhub.
second statement created a work directory in which it had to run the server or local host in.
Using the third statement, a folder was created in which the files of the webapp would be stored in.
The fourth command copies the files into the working directory and hosts it inside the container.
6. The docker image for the webapp was built using the following command
```sh
sudo docker build . -t m20cs018 
``` 
6. The above command returned with image name m20cs018
7. In order to expose the port to get it to the world, the following command is being used 
```sh
sudo docker run -it -p 8000:80 m20cs018
``` 
8. The "-p 80:80" allows the user to view the app on "http://localhost:8000/gg/"
 as the Dockerfile contained "gg" folder in which the webapp's files were copied, gg is to be accessed in the URL.

9. System configuration is as follows,
> OS: MacOS Big Sur Version 11.0.1 (20B50)
> Processor: 1.6 GHz Dual-Core Intel Core i5
> RAM: 8 GB 1600 MHz DDR3

.
.
.
.
## App Description

The webapp used for this assessment is a simple note taking app. It is based on basic HTML, CSS, and JavaScript to handle the data management.

The app looks like the following screenshot,

![image](https://user-images.githubusercontent.com/80277381/131481329-503a4b6f-09ff-4816-9041-ba481aa7ef8e.png)

.
.
.
.

## How to run webapp using Docker in your system?
```sh
1. install docker in your system, and login to it, and run the docker desktop before continuing.
2. Clone the repo using the following command
git clone https://github.com/garvitchughiitj/M20CS018.git
3. Change directory to the folder.
cd M20CS018
4. Build the docker image using, 
docker build . -t m20cs018 
5. Run the image
docker run -it -p 8000:80 m20cs018
6. Access the webapp on 
http://localhost:8000/gg/
```
