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

# OnlyOffice Desktop Editors
check_and_install_rpm "OnlyOffice" "onlyoffice-desktopeditors" "https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors.x86_64.rpm" "onlyoffice.rpm"

# Obsidian (no hay RPM oficial, usando Flatpak como alternativa)
if ! command -v obsidian &> /dev/null; then
    echo "Instalando Obsidian via Flatpak..."
    sudo dnf install -y flatpak
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    flatpak install -y md.obsidian.Obsidian
fi

# Google Chrome
check_and_install_rpm "Google Chrome" "google-chrome" "https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm" "chrome.rpm"

# Flatpak setup base
sudo apt install -y flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

if ! command -v planify &> /dev/null; then
    echo "Instalando Planify via Flatpak..."
    flatpak install -y io.github.alainm23.planify
fi


if ! command -v thisweekinmylife &> /dev/null; then
    echo "Instalando Thisweekinmylife via Flatpak..."
    flatpak install -y io.github.zhrexl.thisweekinmylife
fi

if ! command -v librewolf &> /dev/null; then
    echo "Instalando Librewolf via Flatpak..."
    flatpak install -y io.gitlab.librewolf-community
fi

if ! command -v shortwave &> /dev/null; then
    echo "Instalando Shortwave via Flatpak..."
    flatpak install -y de.haeckerfelix.Shortwave
fi

if ! command -v djpdf &> /dev/null; then
    echo "Instalando Djpdf via Flatpak..."
    flatpak install -y com.github.unrud.djpdf
fi

if ! command -v jpeg2pdf &> /dev/null; then
    echo "Instalando Jpeg2pdf via Flatpak..."
    flatpak install -y com.warlordsoftwares.jpeg2pdf
fi

if ! command -v morphosis &> /dev/null; then
    echo "Instalando Morphosis via Flatpak..."
    flatpak install -y garden.jamie.Morphosis
fi


if ! command -v spotify &> /dev/null; then
    echo "Instalando Spotify via Flatpak..."
    flatpak install -y com.spotify.Client
fi


# --- LIMPIEZA ---
cd ~
rm -rf ~/temp_apps

echo "✅ Todos los programas han sido verificados e instalados si era necesario."

