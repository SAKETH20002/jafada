
# Exercise 1

I have created a instance with ubuntu AMI , type T2.micro , with  some required storage and security groups . 

I used ssh key gen to genrate a ssh key and i have sent the public key of ssh to the new instance which is  getting created.

Then I wrote a shell-script to install and run the apache2 server on the instance.

In the shell-script I also mentioned to remove the default index.html file and replaced with my HTML file.

In the security group I allowed Port 80 to allow the traffic . So that when I hit the public Ip of the instance . 



## Screenshots

![App Screenshot](https://via.placeholder.com/468x300?text=App+Screenshot+Here)


Terraform (To do all this I used Terraform):

Terraform is very useful and essential tool in a life of devops person , which helps them save time by doing the automation of creating the infrastructure . 

You just to write some Terraform script  and give it to Terraform 

Terraform does the rest . From validating to apply it  does everything  and gives you the infrastructure You need . In  my case .   

 