#!/bin/bash
#
#SBATCH -p hpc-bio-pacioli          # Cola a utilizar
#SBATCH --chdir=/home/alumno06/lab3 # Directorio de trabajo
#SBATCH -J cut_job                  # Nombre del trabajo
#SBATCH --ntasks-per-node=4         # Tareas por nodo
#SBATCH --cpus-per-task=1           # CPUs por tarea


# Archivos a procesar
INPUT_FILES=(*.fastq)
PART_TO_KEEP=6

# Procesamiento en paralelo con &
echo "Procesando archivos en paralelo con &"
for file in "${INPUT_FILES[@]}"; do
    ./file-cut.sh "$file" "$PART_TO_KEEP" &
done
wait  
