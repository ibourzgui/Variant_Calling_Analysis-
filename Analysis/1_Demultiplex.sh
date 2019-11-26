
#enter path of Illumina Run folder with BCL files
BCLDIR=""
SAMPLESHEET="SampleSheetUsed.csv"

mkdir -p fastqs
bcl2fastq -p 4 --ignore-missing-bcls  --no-lane-splitting
 -R  $BCLDIR -o fastqs --sample-sheet $SAMPLESHEET 