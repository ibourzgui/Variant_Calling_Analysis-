

BWAREFDIR=""

# to output vcf file for each sorted bam file


ampliconbed="IAD124911_231_amplicon.bed" #path to BED file for this amplicon experiment
genomefasta="$BWAREFDIR/GRCh37.fa"

for file in `ls fastqs/*.sorted.bam`;do
	echo creating vcf for $file  
	vardict-java  -Q 1 -z 0 -b $file -f 0.01 -v -G $genomefasta  $ampliconbed |  teststrandbias.R | var2vcf_valid.pl -N $file -E -f 0.01 > $file.vcf;

done