# postinstall


Instalar paquetes básicos:

```sh
sudo dnf install -y clang llvm g++ gnome-tweaks nodejs  gcc libicu dotnet-sdk-9.0 aspnetcore-runtime-9.0 dotnet-runtime-9.0 gh cmake make autoconf automake virtualenv python3-devel python3-tkinter curl git wget gimp gnome-tweaks *yaru* mpv *ffmpeg* java-latest-openjdk*
```

```sh
sudo dnf install fastfetch tldr -y
``` 

Desinstalar libreoffice

```sh
sudo dnf remove -y *libreoffice*
```

Instalar mirrors de rpm fusion

```sh
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
```

Instalar steam

```sh
sudo dnf install steam -y
```

Instalar paquetes básicos (office, chrome, etc) [Descargar script](https://raw.githubusercontent.com/perseoq/postinstall/refs/heads/main/pkgs.sh)

```sh
cd Descargas
chmod +x pkgs.sh
sudo ./pkgs.sh
```

Actualizar el sistema
```sh
sudo dnf upgrade -y
```
