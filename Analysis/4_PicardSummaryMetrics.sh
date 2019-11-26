

#set this to bWA fasta dir
BWAREFDIR=""
genomefasta="$BWAREFDIR/GRCh37.fa"


# to output picard summary metrics
for file in `ls fastqs/*.sorted.bam`; do
	echo running picard alignment summary metrics
	echo The file is $file
	picard CollectAlignmentSummaryMetrics R=$genomefasta I=$file O=$file.picardstats.txt

done


