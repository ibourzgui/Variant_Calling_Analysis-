# to output stats from sorted bam files with samtools
for file in `ls fastqs/*.sorted.bam`;do
	echo The file is $file   
	samtools stats $file > $file.stats.txt 
done