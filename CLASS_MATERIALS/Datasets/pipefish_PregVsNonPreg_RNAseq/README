Notes on Gulf pipefish male brood pouch RNA-Seq data

`pipefish_RNAseq_CPM.tsv`:

- contains normalized RNA-Seq data (copies per million) from the brood pouch tissues of 12 adult males:
    `P09`, `P08`, `P07`, `P06`, `P05`, `P03`, `N11`, `N10`, `N04`, `N03`, `N02`, and `N01`
- samples with “P” in name are from early-stage pregnant males; samples with “N” in name are from non-pregnant males
- only contains information for genes with reliable count data in at least some libraries
- also includes some annotation information, including KEGG orthology IDs, for genes when available
- should be clear separation between pregnant and non-pregnant males in transcriptome space 

Link to paper: https://genomebiology.biomedcentral.com/articles/10.1186/s13059-016-1126-6

To read in the data:
```
pipefish <- read.table("pipefish_RNAseq_CPM.tsv", sep='\t', header=TRUE, quote='')
```
