# to convert vcf to bgzip /index vcf Tabix/ vcf stats   
for file in `ls fastqs/*.vcf`;do
	echo converting vcf to bgzip $file   
	bgzip -c $file > $file.gz
	tabix -p vcf $file.gz
	bcftools stats $file.gz > $file.vcfstats.txt

done