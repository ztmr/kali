#!/bin/bash

# Fetch the latest Kali debootstrap script from git
curl "http://git.kali.org/gitweb/?p=packages/debootstrap.git;a=blob_plain;f=scripts/kali;hb=HEAD" > kali-debootstrap &&\
sudo debootstrap kali ./kali-root http://http.kali.org/kali ./kali-debootstrap &&\
sudo tar -C kali-root -c . | sudo docker import - linux/kali &&\
sudo rm -rf ./kali-root &&\
sudo docker run -rm -t -i linux/kali cat /etc/debian_version &&\
echo "Build OK" || echo "Build failed!"
