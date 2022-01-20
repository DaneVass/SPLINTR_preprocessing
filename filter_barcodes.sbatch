#!/bin/bash

#### SLURM Parameters: ####
#SBATCH --nodes=1
#SBATCH --ntasks=16
#SBATCH --job-name=trim_stagger
#SBATCH --time=00-4:00:00
#SBATCH --mem=128GB
#SBATCH --mail-user=''
#SBATCH --mail-type=ALL
#SBATCH --output='extract-barcodes-%j.out'
#SBATCH --error='extract-barcodes-%j.error'
#SBATCH --partition=prod


#### Load default modules ####
module purge

#### RUN Parameters: ####

SCRIPT="full path to extractBarcodeReads.py script"
INFILE=$1
OUTPUT=$2
PATTERN='([ATCG][ATCG][GC][AT][GC][ATGC][ATCG][AT][GC][AT]){6}' #NNSWS NNWSW - SPLINTR GFP pattern
#PATTERN='([ATCG][ATCG][AT][GC][AT][ATGC][ATCG][GC][AT][GC]){6}' #NNWSW NNSWS - SPLINTR BFP pattern
#PATTERN='([ATCG][AT][ATGC][GC][ATGC][AT][ATCG][GC][ATGC][AT][ATCG][GC]){5}' #NWNSNW NSNWNS - SPLINTR mCHERRY pattern


python $SCRIPT --input $INFILE --output $OUTPUT --regex $PATTERN --upconstant 'TACGATTGACTA' --downconstant 'TGCTAATGCGTACTG' -q 20 -l 60



