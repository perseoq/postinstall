# Instalar el Visual Studio Code de Microsoft

Lo primero que debemos hacer es instalar la firma de autenticidad de la descarga
```sh
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
```

Lo siguiente sería instalar los repositorios de donde se descargará el paquete de instalación 
```sh
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
```

Por último, vamos a proceder a iniciar la descarga de visual studio code (vscode)
```sh
sudo dnf install -y code
```


## Cómo se usa:

Para abrir una carpeta desde terminal en vscode
```sh
code /ruta/carpeta
```

ejemplo:
```sh
code Documentos/mi_proyecto/
```

Recuerda no dejar espacios en los nombres de las carpetas o documentos, usa guiones bajos o guiones, o simplemente quita espacios:
```sh
code Documentos/mi_proyecto/
code Documentos/mi_proyecto/archivo_ejemplo.sh
code Documentos/mi_proyecto/archivo-ejemplo.sh
code Documentos/mi_proyecto/archivoejemplo.sh
code Documentos/mi_proyecto/archivoEjemplo.sh
```
	nota: la extensión `.sh` es para archivos de scripts de bash, ej. `contador_de_documentos.sh` *prohibido pero permitido*: poner acentos

Si dejaste espacios entonces tendrias que usar comillas simples o comillas dobles (las normales):
```sh
code Documentos/mi_proyecto/'archivo ejemplo.sh'
code Documentos/'mi proyecto'/archivo-ejemplo.sh
```

Si ya te encuentras dentro de la carpeta donde estan tus archivos, entonces, sólo escribirás `.`  (un punto) indicando que estás en la carpeta actual: 
```sh
code .
```
 
Si no quieres usar `.` sino la ruta completa, primero usarás el comando `pwd` para que te de la ruta y despues accederás con la ruta
```sh
usuario@maquina:~$ pwd
/home/usuario/Documentos/mi_proyecto
```

Entonces podrás usar:
```sh
code /home/usuario/Documentos/mi_proyecto
```
 
### Cosas a tomar en cuenta 

La `/` equivale a `C:\>` por lo tanto si colocas:
```sh
cd /Docuemntos 
```
Marcará error.

	nota: `cd` se utiliza para ingresar a un directorio, modo de uso más abajo.

Lo correcto sería:
```sh
cd /home/usuario/Documentos/
```

Si quisieramos regresar a nuestro directorio de usuario `/home/usuario/` podriamos hacerlo de dos formas:

Forma 1, el comando `cd` más la ruta:
```sh
cd /home/usuario/
```

Forma 2, simplemente poner cd:
```sh
cd
```

Si quisieramos regresar al directorio anterior, entonces agregaríamos `..`, entonces habíamos dicho que un punto `.` es directorio actual, por lo tanto `..` es directorio anterior, por ejemplo:

Supongamos que estamos en:
```sh
usuario@maquina:~/carpeta_ejemplo_padre/carpeta_hija/carpeta_hija_de_la_hija$ 
```

Queremos ir al directorio del usuario usando `cd ..`
```sh
usuario@maquina:~/carpeta_ejemplo_padre/carpeta_hija/carpeta_hija_de_la_hija$ cd ..
usuario@maquina:~/carpeta_ejemplo_padre/carpeta_hija$ cd ..
usuario@maquina:~/carpeta_ejemplo_padre$ cd ..
usuario@maquina:~$ 
```
	nota: la forma más sencilla sería suar sólo `cd` simple.

#### Creando directorios

Para crear un directorio haremos uso del comando `mkdir` 
```sh
mkdir mi_proyecto
```
Esto creara una carpeta en `/home/usuario/mi_proyecto`

Para crear un directorio dentro de un directorio pero el primero no existe, entonces haremos uso de la bandera (flag) `-p`:
```sh
mkdir -p carpeta_que_no_existe/otra_que_no_existe/menos_existe
```

Para borrar una carpeta debemos usar `rm -r` donde la flag `-r` significa recursivo, es decir que ira en ciclo hasta wue ya no quede nada

1) Digamos que sólo queremos eliminar la ultima carpeta:
```sh
rm -r carpeta_que_no_existe/otra_que_no_existe/menos_existe
```

2) Digamos que queremos eliminar toda la ruta desde el principio
```sh
rm -r carpeta_que_no_existe/ 
```

#### Creando archivos

A pesar que desde vscode se pueden crear carpetas y archivos, desde terminal, también se pueden crear:

1) Para crear un archivo vacio usaremos el comando touch:
```sh
touch archivo_vacio.sh
```

2) También podemos usar el editor `nano`:
```
nano archivo_nuevo.sh
```
	nota: Para salir de `nano` sin guardar daremos `Ctrl+X` y pondermos `N`, si vamos a guardar entonces `Ctrl + X`, despues daremos `S` o `Y` y `Enter`

3) También podemos usar el editor `vi`:

```sh
vi archivo_nuevo.sh
```
Cosas a tomar en cuenta con `vi`:
- Existen dos estados, modo lectura (presionando `Esc`) o modo edición (presionando `i`)
- Si quieres salir sin guardar, das `Esc` y escribes `:q!`
- Si quieres salir y guardar (primero das `Esc`) hay de dos formas `:wq` y `:x`
- Si no hiciste ningun cambio y quieres salir, das `Esc` y escribes `:q`
- Si no quieres salir y seguir editando, das `Esc` y escribes `:w` y luego `i` para volver al modo edición

4) Haciendo uso del comando `cat`, con puedes agregar contenido a un archivo y crearlo:

**Caso 1)**

Creando un archivo y agregando texto:
```sh
cat > archivo.txt
```
Esto generara que se vea como pasamdo el prompt, sin embargo, quiere decir que está esperando a que escribas algo, para salir del modo escritura tienes que dar `Ctrl+d`.  

Ahora bien, si tu ya tenias algo escrito y vuelves a dar
```sh
cat > archivo.txt
```
Y escribes texto nuevo, entonces este texto nuevo reemplazará al anterior. Si quieres que se agregue en lugar de reemplazar ve al `Caso 2`.

**Caso 2)**

Si lo que quieres es agregar líneas al archivo y no reemplazar el texto, entonces usaremos:
```sh
cat >> archivo.txt
```
Los simbolos `>>` nos indican *agregar al final*.

**Caso 3)**

Para leer sin editar entonces sólo colocaremos `cat` sin `>` y al dar `enter` nos mostrará el contendio del archivo. 
```sh
cat archivo.txt
```

En dado caso que el archivo tenga muchas líneas, entonces haremos uso de less para que haya una paginación y la dar `enter` o `flecha hacia abajo` nos permita ver más texto: 
```sh
cat archivo_con_mucho_texto.txt | less
```
	nota: `|` este simbolo se llama `pipe` sirve para separar comandos

Para salir de less al igual que con vi damos `:q`

**Caso 4)** 

Modo `inline` este sirve tanto para `>` como para `>>`

Aquí usaremos el comando `echo`que sirve para imprimir texto en pantalla:
```
echo "hola mundo"
---
resultado:
hola mundo
```

Entonces si queremos crear un nuevo archivo y crear texto dentro haremos uso de:
```sh
echo "texto para el nuevo archivo" > archivo.txt
```

Y damos:
```sh
cat archivo.txt
```

nos motrará: 
```sh
texto para el nuevo archivo
```

Ahora, para agregar texto a ese archivo al final.
```sh
 echo "nuevo texto para el archivo" >> archivo.txt
```

Al dar:
```sh
cat archivo.txt
```

nos mostrará:
```sh
texto para el nuevo archivo
nuevo texto para el archivo
```
