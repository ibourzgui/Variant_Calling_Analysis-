
echo "Aligning reads to genome"

#set this to ref dir for BWA mem
BWAREFDIR=""

index=”$BWAREFDIR/GRCh37.fa”


#Alignment Loop
for file in `ls fastqs/*.gz`;do
	echo The file is $file 
      gunzip -c $file > input.fastq
      echo bwa mem $index input.fastq
      bwa mem -R "@RG\tID:$file\tSM:$file\tPL:Illumina" $index input.fastq > $file.sam
done


#BAM conversion
echo "Converting SAM->BAM"
# to output sorted bam files from aligned sam format with samtools
for file in `ls fastqs/*.gz.sam`;do
	echo The file is $file 
    samtools view -S -b $file > $file.bam
    echo sorting $file
	samtools sort $file.bam -o $file.sorted.bam
	echo indexing $file
	samtools index $file.sorted.bam 
done