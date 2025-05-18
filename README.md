![LogoREADME](https://github.com/SherlockLinux/SherlockLinux/assets/137631572/06261dae-d3d1-4748-9b50-c7f8d07e6338)

[![Python Version](https://img.shields.io/badge/python-3.9+-FF8400)](https://www.python.org) [![License](https://img.shields.io/badge/license-GPLv3-FF8400.svg)](https://github.com/blacklanternsecurity/bbot/blob/dev/LICENSE) [![version](https://img.shields.io/badge/version-3.0.0-green.svg)](https://semver.org)

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

<img width="600" alt="Sherlock linux install" src="https://github.com/SherlockLinux/SherlockLinux/assets/137631572/e69db155-e71f-47a8-b2c4-9a481900174d">

# HERRAMIENTAS INSTALADAS

- Bbot
- Certgraph
- Cloud Fail
- Cloud Scraper
- DNS Recon
- EO Ripper
- ExifTool
- EyeWitness
- Git Recon
- Hostintel
- HTTrack
- Infoga
- Instaloader
- Maltego
- Metagoofil
- OSRFramework
 -  Alias_generator
 -  Checkfy
 -  Domainfy
 -  Mailfy
 -  Phonefy
 -  Searchfy
 -  Usufy
- Pagodo
- Phone infoga
- Photon
- Protosint
- Scanless
- Sherlock
- Spiderfoot CLI
- Spiderfoot GUI
- TheHarvester
- WhatWeb
- XRay
- Yacy
- ...

Puedes ver [aquí](https://www.sherlock-linux.org/documentacion/) la lista completa de herramientas.


# ESCRITORIO

![sherlockPortatil](https://github.com/SherlockLinux/SherlockLinux/assets/137631572/68b55045-c4b7-4bdf-8984-cf3e142d284e)


# YOUTUBE
[Vídeo de presentación](https://youtu.be/iRYdHMKkxa4)


# CONTACTO
📫 [Contacto](https://www.sherlock-linux.org/contacto/)

# DISCLAIMER

- EL SCRIPT DE INSTALACIÓN REALIZA CAMBIOS A NIVEL DE SO QUE PUEDEN DAÑAR EL SISTEMA OPERATIVO, EJECUTA EL SCRIPT EN UN ENTORNO CONTROLADO Y BAJO TU PROPIO RIESGO.
- ESTE SOFTWARE SE DISTRIBUYE GRATUITAMENTE BAJO LICENCIA GPL-3 Y NO GARANTIZA SU FUNCIONAMIENTO EN DIFERENTES VERSIONES DE LINUX.


