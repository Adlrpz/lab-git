#!/bin/bash

# He creado un script basico para cortar un archivo

file=$1   # Le paso el nombre del archivo
part=$2   # La proporcion a mantener

# Calculo el numero de lineas total
# Calculo el numero de lineas que quiero mantener
total_lines=$(wc -l < "$file")              	
lines_to_keep=$((total_lines / part))        

# Cortar y sobrescribir el archivo original
temp_file="${file}.temp"
head -n "$lines_to_keep" "$file" > "$temp_file"
mv "$temp_file" "$file"

echo "Archivo $file procesado, guardando 1/$part de las líneas."

