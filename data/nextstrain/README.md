# NextStrain or NextClade Phylogenetic Analyses

The code for replicating the phylogenetic analyses in the paper are presented in the script nextstrain_setup_run.sh. That script can be run independently from the other scripts in this repository.

Alternatively, we provide a FASTA file (data/nextstrain/variants_environmental_UCDMC.fasta) that includes our near-complete genomes with all other UCDMC patient sequences from GSAID and some of the more recent (as of Feb 2021) SARS-CoV-2 variants, for context. Note that sample_barcode05/ARTIC/nanopolish_5X == hCoV-19/USA/CA-UCDMC-27/2020 and sample_barcode18/ARTIC/nanopolish_5X == hCoV-19/USA/CA-UCDMC-51/2020.  

This file, variants_environmental_UCDMC.fasta, can be dragged into https://clades.nextstrain.org/ to generate a similar tree (with more updated information), that supports the conclusions drawn in the manuscript.