# terraform-azurerm-linuxvm-webserver

## This module is for learning purposes.


### Ubuntu w/ Apache and PHP

VERY IMPORTANT
--------------
The custom data inside locals block must NOT be "tabbed". So, this won't work:

locals {
vm_custom_data = <<CUSTOM
    #!/bin/bash
    sudo apt update
    sudo apt install net-tools -y
    sudo apt install apache2 -y
    sudo apt install php -y
    sudo systemctl enable apache2
    sudo systemctl start  apache2
    sudo chmod -R 777 /var/www/html/
    sudo echo "Welcome to VM: $(hostname)" > /var/www/html/index.html
    sudo mkdir /var/www/html/app1
    sudo chmod -R 777 /var/www/html/app1/
    sudo echo "Welcome to App1 - VM: $(hostname)" > /var/www/html/app1/hostname.html
    sudo echo "Welcome to App1 - App Status Page" > /var/www/html/app1/status.html
    sudo echo '<!DOCTYPE html> <html lang="en" xmlns="http://www.w3.org/1999/xhtml"> <head> <meta charset="utf-8" /> <title>App1</title> </head> <body><h1>Welcome to App1</h1>h1></body> </html>' | sudo tee /var/www/html/app1/index.html
    echo ""
CUSTOM
}


But this WILL work:

locals {
vm_custom_data = <<CUSTOM
#!/bin/bash
sudo apt update
sudo apt install net-tools -y
sudo apt install apache2 -y
sudo apt install php -y
sudo systemctl enable apache2
sudo systemctl start  apache2
sudo chmod -R 777 /var/www/html/
sudo echo "Welcome to VM: $(hostname)" > /var/www/html/index.html
sudo mkdir /var/www/html/app1
sudo chmod -R 777 /var/www/html/app1/
sudo echo "Welcome to App1 - VM: $(hostname)" > /var/www/html/app1/hostname.html
sudo echo "Welcome to App1 - App Status Page" > /var/www/html/app1/status.html
sudo echo '<!DOCTYPE html> <html lang="en" xmlns="http://www.w3.org/1999/xhtml"> <head> <meta charset="utf-8" /> <title>App1</title> </head> <body><h1>Welcome to App1</h1>h1></body> </html>' | sudo tee /var/www/html/app1/index.html
echo ""
CUSTOM
}

