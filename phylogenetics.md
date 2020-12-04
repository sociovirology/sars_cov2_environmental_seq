## Sequencing Methods
We prepared RNA extractions for Oxford Nanopore (ONT) MinION sequencing of SARS-CoV-2 viral genomes. We made modifications to the ARCTIC Network Protocol (v2) (Tyson et al., 2020), to optimize sequencing for environmental samples. Our complete protocol is available online (protocols.io, forthcoming). In brief: we conducted random hexamer primed reverse transcription and amplified cDNA using v3 primers, which tile the entire viral genome (save for non-coding regions at the genome ends) with overlapping 400bp fragments. We concentrated PCR products using the Zymo Select-a-Size DNA Clean & Concentrator Kit (Zymo Research, Irvine CA), ligated barcodes using the Oxford Nanopore Native Barcoding kit, and ligated sequencing adaptors. Samples were run on ONT R9.4 or R10.x flow cells. We followed the ARTIC Network bioinformatics SOP, which in brief involved high accuracy basecalling and demultiplexing using ONT Guppy, mapping reads to the Wuhan-Hu-1 (GenBank accession MN908947.3) reference with MiniMap2, signal-level polishing with Nanopolish, and consensus generation. Due to the tiled amplicon design, stringent demultiplexing was used, requiring barcodes on both ends with a minimum score of 60. Negative controls were included in each run.

## Sequencing Results
### Overall sequencing stats
We generated a total of 17,123,849 across 5 separate MinION sequencing runs (Table N), of which 6,582,104 were used for mapping after demultiplexing and quality control. Negative controls did not have any reads mapped, positive controls produced reads in the expected regions, e.g. RdRp or entire genome (details in GitHub repository). The amount of genome coverage from samples was in roughly three groups: >15% (n = 75), 20-40% (n = 5), >75% (n = 5) [note some samples were sequenced >1, includes positives and negatives, will fix]. The percent of the genome covered at a 5X depth, had an [exponential?] decay with increasing mean Ct values (Figure N), which was statistically (STATS TESTS). There was a notable threshold of Ct ~ 38, above which no sample achieved >10% genome completeness.

### Whole genome PCR and Sequencing yields more effective detection of SARS-CoV-2 than RT-qPCR
While there was a steep drop-off in achieving a full genome with increasing Ct values, the sequencing protocol was able to detect SARS-CoV-2 presence in samples with undetermined Ct scores from PCR (percent coverage range: 2.19-14.78%). [WILL GENERATE STATS TEST AND GRAPH]

### Effect of protocol modifications for environmental sample sequencing

### Generation of near-complete genomes from environmental samples
We recovered two near-complete genomes from two different patient rooms, D14 and T7 Blue. These samples were collected from two surfaces: the floor and a soiled linens basket lid, respectively. Coverage percentage and Ct scores were D14: 99.01% (Mean Ct = 36.49) T7 Blue 91.75% (Mean Ct = 36.89), both with a depth cutoff of 5X to call a base. The sample from room D14 had an average depth of 191.1099 ± 153.17 reads (Figure Y). [Will do for other sample]

### Recovered Genome Sequences are from clade 19B and [are likely of patient/community origin]
To determine the likely provenance of the near-complete genomes generated, we conducted phylogenetic analyses of the sequences. First we placed sequences in the global phylogeny, using NextStrain/NextClade (Figure N+1). Strains were in clade 19B in the Nextstrain taxonomy (cite) or XXX in the Rambaut et al. (2020) taxonomy. Second, to determine the relationship with strains circulating locally, we constructed phylogentic trees limited to CA strains, including all publicly available sequenced samples from UCDMC (Figure N+2). Strains were most likely "sourced" from COMMUNITY/PATIENTS.

## Sequencing Discussion
. Although sequencing involves more cost, the difference can be narrowed if routine sequecning is underway.
There is further room for improvement in 
