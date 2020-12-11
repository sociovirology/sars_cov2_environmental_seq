## Sequencing Methods
We prepared RNA extractions for Oxford Nanopore (ONT) MinION sequencing of SARS-CoV-2 viral genomes. We made modifications to the ARCTIC Network Protocol (v2) (Tyson et al., 2020), to optimize sequencing for environmental samples. Our complete protocol is available online (protocols.io, forthcoming). In brief: we conducted random hexamer primed reverse transcription and amplified cDNA using v3 primers, which tile the entire viral genome (save for non-coding regions at the genome ends) with overlapping 400bp fragments. We concentrated PCR products using the Zymo Select-a-Size DNA Clean & Concentrator Kit (Zymo Research, Irvine CA), ligated barcodes using the Oxford Nanopore Native Barcoding kit, and ligated sequencing adaptors. Samples were run on ONT R9.4 or R10.x flow cells. We followed the ARTIC Network bioinformatics SOP, which in brief involved high accuracy basecalling and demultiplexing using ONT Guppy, mapping reads to the Wuhan-Hu-1 (GenBank accession MN908947.3) reference with MiniMap2, signal-level polishing with Nanopolish, and consensus generation. Due to the tiled amplicon design, stringent demultiplexing was used, requiring barcodes on both ends with a minimum score of 60. Negative controls were included in each run.

## Sequencing Results
### Overall sequencing stats
We generated a total of 17,567,849 across 5 separate MinION sequencing runs (Table N), of which 6,670,616 were used for mapping after demultiplexing and quality control. Negative controls (included in all runs) did not yield any reads that mapped to the reference genome, except for Run 4, which was dropped and samples were re-sequenced in Run 5. At least one positive control (included in Runs 4 and 5), per run produced reads that mapped to the reference genome (details in GitHub repository).

The amount of genome coverage obtained from samples was in roughly three groups: >15% (n = 61), 20-40% (n = 5), >75% (n = 5). The percent of the genome covered at a 5X depth, quickly declined as a function of increasing mean Ct values (Figure N). There was a notable threshold of Ct ~ 38, above which no sample achieved >10% genome completeness.

### Whole genome PCR and Sequencing yields more effective detection of SARS-CoV-2 than RT-qPCR
While there was a steep drop-off in achieving a full genome with increasing Ct values, the sequencing protocol was able to detect SARS-CoV-2 presence in samples with undetermined Ct scores from PCR, with an average of 6.27% coverage (range: 2.19-14.78%). Using a sequencing detection cutoff of >2% coverage, sequencing detected SARS-CoV-2 in 15 samples that had no Ct scores, whereas 5 samples had Ct scores that were not detected by sequencing (at >2% coverage).

### Generation of near-complete genomes from environmental samples
We recovered two near-complete genomes from two different patient rooms, D14 and T7 Blue. These samples were collected from two surfaces: the floor and a soiled linens basket lid, respectively. Coverage percentage and Ct scores were D14: 99.26% (Mean Ct = 36.49) T7 Blue 91.75% (Mean Ct = 36.89), both with a depth cutoff of 5X to call a base. The sample from room D14 had an average depth of 371.21 ± 171.30 reads (mean ± SD). The sample from room T7 had an average depth of 377.14 ± 185.03. 

### Effect of protocol modifications for environmental sample sequencing

### Recovered Genome Sequences are from clade 19B and [are likely of patient/community origin]
To determine the likely provenance of the near-complete genomes generated, we conducted phylogenetic analyses of the sequences. First we placed sequences in the global phylogeny, using NextStrain/NextClade (Figure N+1). Strains were in clade 19B in the Nextstrain taxonomy (cite) or XXX in the Rambaut et al. (2020) taxonomy. Second, to determine the relationship with strains circulating locally, we constructed phylogentic trees limited to CA strains, including all publicly available sequenced samples from UCDMC (Figure N+2). Strains were most likely "sourced" from COMMUNITY/PATIENTS.

## Sequencing Discussion
. Although sequencing involves more cost, the difference can be narrowed if routine sequecning is underway.
There is further room for improvement in 
