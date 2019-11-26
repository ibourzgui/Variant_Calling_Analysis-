# to add variant annotation to multiqc stats results
#Annotate with gene info , HGVS, etc

VEPDIR="$HOME/software/bcbio/genomes/Hsapiens/GRCh37"


for file in `ls fastqs/*.vcf`;do
	vep --fork 2 -i $file \
	--force_overwrite \
	--no_intergenic \
	--format vcf --tab \
	--ccds --uniprot --hgvs --symbol --numbers --domains  --canonical --protein --biotype --uniprot  --appris --gene_phenotype --af --af_1kg --af_esp  --max_af --pubmed --variant_class \
	--hgvs  \
	--no_stats \
	--cache --offline \
	--cache_version 79 \
	--dir $VEPDIR/vep_data  \
	--fasta $VEPDIR/seq/GRCh37.fa \
	--minimal \
	--assembly GRCh37 \
	-o $file.vep.tsv

done 	