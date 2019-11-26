

#Install miniconda, uncomment to do
#wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
#bash Miniconda3-latest-Linux-x86_64.sh


#Install all required packages on linux cloud machine with conda
#Bioinformatics NGS software
conda install -c dranew bcl2fastq

conda install -c bioconda  multiqc bcftools picard 
conda install -c bioconda bwa samtools 
conda install -c bioconda vardict-java


#Python dependencies 

conda install pymongo pandas
