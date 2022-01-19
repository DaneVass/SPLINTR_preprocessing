# SPLINTR Barcode Library Pre-processing. 

1. Amplify SPLINTR barcodes from each library plasmid pool by PCR (see attached PCR protocol).
	1b. Perform PCRs in technical duplicate

2. Sequence library pool to a depth of at least 200-250M reads (~100X coverage) per PCR reaction.
	2a. Lower diversity libraries will require less sequencing. 
	2b. Ideally perform single end 150bp or paired end 75bp, DO NOT perform single end 75bp as reads will not cover the entire barcode.	

3. Generate a text file containing full path of each library fastq file. See example fastqs.txt

4. Confirm sequencing quality by running FastQC

5. **[OPTIONAL]** if paired end 75bp sequencing was performed. Run `flash.sh` to combine paried-end reads into a single overlapped read that covers the entire barcode region.

6. Extract barcode reads from fastq files using `trim_stagger.sbatch` which submits `extractBarcodeReads.py` scripts to a SLURM HPC

7. Run Starcode on the extracted barcode reads to cluster barcodes according to Edit distance

8. Perform QC and analysis of Starcode output in R using `library-analysis=template.Rmd`

9. Output will include a fasta file of barcode sequences within each library whcih can be used to generate a reference library for subsequent barcode alignment.