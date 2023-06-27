![imagen](https://github.com/SherlockLinux/SherlockLinux/assets/137631572/4df7594c-ee86-4471-86bf-af37960eb2db)


# Sherlock Linux 
### https://www.sherlock-linux.org/
### Distribución de OSINT basada en Debian 12 y entorno de escritorio XFCE.

- Gran cantidad de herramientas preinstaladas para la obtención de información en fuentes abiertas para investigaciones OSINT.
- Navegadores preconfigurados con los mejores recursos para investigaciones OSINT.
- Entorno de escritorio diseñado para tener todas las herramientas accesibles por categorías.

### [Descarga](https://www.sherlock-linux.org/descarga/) SHERLOCK LINUX.

- Usuario: sherlock
- Contraseña: sherlock


### O ...

### INSTALA SHERLOCK LINUX

Este script se ha probado únicamente en una distribución Debian 12 con entorno de escritorio XFCE.

1º Crear el usuario sherlock y añadirlo a sudoers:
~~~bash
su -l
apt install sudo
adduser sherlock sudo
echo 'sherlock  ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
su sherlock
~~~

2º Instalar Git y Clonar el repositorio:
~~~bash
sudo apt install git
git clone https://github.com/SherlockLinux/SherlockLinux.git ~/SherlockLinux
~~~

3º Dar permisos de ejecución al script de Sherlock Linux
~~~bash
sudo chmod +x ~/SherlockLinux/SherlockLinux.sh
~~~

4º Ejecutar el script
~~~bash
cd ~/SherlockLinux/
./SherlockLinux.sh
~~~

#### Comienza la instalación...

<img width="826" alt="imagen" src="https://github.com/SherlockLinux/SherlockLinux/assets/137631572/6d00a007-9467-4430-aa89-6432b6b1f867">


### HERRAMIENTAS INSTALADAS

- Git Recon
- EO Ripper
- Instaloader
- Protosint
- Sherlock
- Certgraph
- Infoga
- Pagodo
- Bbot
- Phone infoga
- Photon
- Spiderfoot
- Spiderfoot
- OSRFramework
- TheHarvester
- Cloud Fail
- Cloud Scraper
- DNS Recon
- XRay
- Scanless
- Hostintel
- ExifTool
- EyeWitness
- Metagoofil 
- WhatWeb
- Maltego
- Yacy
- HTTrack
- ...

Puedes ver [aquí](https://www.sherlock-linux.org/documentacion/) la lista completa de herramientas.


### ESCRITORIO

![imagen](https://github.com/SherlockLinux/SherlockLinux/assets/137631572/87d7be64-17e5-478b-a534-a9afc733b7b2)

### YOUTUBE
https://www.youtube.com/channel/UC_GgVLZ29kDagSmAqJ74EEQ


*EL SCRIPT DE INSTALACIÓN REALIZA CAMBIOS A NIVEL DE SO QUE PUEDEN DAÑAR EL SISTEMA OPERATIVO, EJECUTA EL SCRIPT EN UN ENTORNO CONTROLADO Y BAJO TU PROPIO RIESGO.

📫 [Contacto](https://www.sherlock-linux.org/contacto/)
