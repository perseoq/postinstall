#!/bin/bash

# Crear carpeta temporal
mkdir -p ~/temp_apps
cd ~/temp_apps

# --- FUNCIONES ---
check_and_install_rpm() {
    local app_name=$1
    local cmd=$2
    local url=$3
    local file_name=$4

    echo "Verificando $app_name..."

    if command -v $cmd &> /dev/null
    then
        echo "$app_name ya está instalado."
    else
        echo "$app_name no está instalado. Procediendo a la instalación..."
        curl -L "$url" -o "$file_name"
        sudo dnf install -y "$file_name"

        if command -v $cmd &> /dev/null
        then
            echo "$app_name ha sido instalado correctamente."
        else
            echo "❌ Hubo un error al instalar $app_name."
        fi
    fi
}

# --- INSTALACIONES ---

# Visual Studio Code (usando el repositorio de Microsoft)
if ! command -v code &> /dev/null; then
    echo "Instalando Visual Studio Code..."
    sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
    sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
    sudo dnf install -y code
fi

# OnlyOffice Desktop Editors
check_and_install_rpm "OnlyOffice" "onlyoffice-desktopeditors" "https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors.x86_64.rpm" "onlyoffice.rpm"

# Obsidian (no hay RPM oficial, usando Flatpak como alternativa)
if ! command -v obsidian &> /dev/null; then
    echo "Instalando Obsidian via Flatpak..."
    sudo dnf install -y flatpak
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    flatpak install -y md.obsidian.Obsidian
fi

# Discord (usando el paquete RPM oficial)
check_and_install_rpm "Discord" "discord" "https://discord.com/api/download?platform=linux&format=rpm" "discord.rpm"

# Google Chrome
check_and_install_rpm "Google Chrome" "google-chrome" "https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm" "chrome.rpm"

# --- LIMPIEZA ---
cd ~
rm -rf ~/temp_apps

echo "✅ Todos los programas han sido verificados e instalados si era necesario."
