#!bin/bash
echo " checking and installing nginx "
dpkg-query --show  "nginx"
if [ "$?" = "0" ];
then
    echo "nginx found"
else
    echo "nginx not found. Please approve installation."
    sudo apt install nginx -y
    if [ "$?" = "0" ];
    then echo nginx installed successfully.
    fi
fi
