#!/bin/bash

#### SLURM Parameters: ####
#SBATCH --nodes=1
#SBATCH --ntasks=16
#SBATCH --job-name=trim_stagger
#SBATCH --time=00-4:00:00
#SBATCH --mem=128GB
#SBATCH --mail-user=dane.vassiliadis@petermac.org
#SBATCH --mail-type=ALL
#SBATCH --output='./logs/trim_stagger-%j.out'
#SBATCH --error='./logs/trim_stagger-%j.error'
#SBATCH --partition=prod


#### Load default modules ####
module purge

#### RUN Parameters: ####
SCRIPT="/home/dvassiliadis/projects/brian.liddicoat/200224_NGFR_barcode_lib/scripts/extractBarcodeReads.py"
FILE=$1
OUTPUT=$2
PATTERN='([ATCG][ATCG][GC][AT][GC][ATGC][ATCG][AT][GC][AT]){6}' #NNSWSNNWSW pattern


python $SCRIPT --input $FILE --output $OUTPUT --regex $PATTERN --upconstant 'TACGATTGACTA' --downconstant 'TGCTAATGCGTACTG' -q 20 -l 60



