#!/bin/bash

sudo apt update 



sudo apt install apache2 -y

sudo apt update 

sudo systemctl start apache2  

wget https://templatemo.com/tm-583-festava-live

sudo rm -rf /var/www/html/*

sudo cp -r  tm-583-festava-live  /var/www/html/index.html

sudo systemctl restart  apache2 




