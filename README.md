# SPLINTR Barcode Library Pre-processing. 

For more information: (Fennell and Vassiliadis et al., [2021](https://www.nature.com/articles/s41586-021-04206-7))

## Procedure to generate SPLINTR reference barcode libraries:

- Amplify SPLINTR barcodes from each library plasmid pool by PCR (see attached PCR protocol).
  - Perform PCRs in technical duplicate

- Sequence library pool to a depth of at least 200-250M reads (~100X coverage) per PCR reaction.
  - Lower diversity libraries will require less sequencing. 
  - Ideally perform single end 150bp or paired end 75bp, DO NOT perform single end 75bp as reads will not cover the entire barcode.	

- Generate a text file containing full path of each library fastq file. See example `fastqs.txt`

- Confirm sequencing quality by running FastQC

- **[OPTIONAL]** if paired end 75bp sequencing was performed. Run `flash.sh` to combine paried-end reads into a single overlapped read that covers the entire barcode region.

- Extract barcode reads from fastq files using `trim_stagger.sbatch` which submits `extractBarcodeReads.py` scripts to a SLURM HPC

- Run Starcode on the extracted barcode reads to cluster barcodes according to Edit distance

- Perform QC and analysis of Starcode output in R using `library-analysis=template.Rmd`

- Output will include a fasta file of barcode sequences within each library which can be used to generate a reference library for subsequent barcode alignment.