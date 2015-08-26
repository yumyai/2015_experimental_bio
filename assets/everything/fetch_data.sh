#!/bin/bash

KEGG_API=http://rest.kegg.jp

SED_OSX="-E"
SED_OTHER="-r"

function get_gene_names() {
  local pathway=$1
  #             fetch                                from                                 to
  curl -s "${KEGG_API}/get/path:${pathway}" | gawk "/^GENE/ {seen = 1 } seen {print}" | sed -n "/^COMPOUND/q;p" | perl -pe 's/^GENE\s+|\s+//' | gawk '{print $1}'
}

function get_aa() {
  local gene_name=$1   # KEGG format
  curl -s "${KEGG_API}/get/${gene_name}/aaseq"
}

function get_nt() {
  local gene_name=$1   # KEGG format
  curl -s "${KEGG_API}/get/${gene_name}/ntseq"
}

function get_ec() {
  local gene_name=$1  # KEGG format
}

function get_name() {
  local gene_name=$1 # KEGG format
}

get_gene_names cre01040 | while read GENENAME; do get_aa cre:${GENENAME} ; done > biosynthesis_of_unsaturated_fatty_acids.faa

# Five pathway

# BLAST
#all: biosynthesis_of_unstaturated_fatty_acids_cre.fa

#get_gene_names 


# curl -s http://rest.kegg.jp/get/path:$1 | gawk '/^GENE/ {seen = 1 } seen {print}' | sed -n '/^COMPOUND/q;p'
  #Fatty acid biosynthesis - Chlamydomonas reinhardtii [map00061]
  #Valine, leucine and isoleucine degradation - Chlamydomonas reinhardtii [map00280]
  #Glycerolipid metabolism - Chlamydomonas reinhardtii [map00561]
  #Carbon fixation in photosynthetic organisms - Chlamydomonas reinhardtii [map00710]
  #Biosynthesis of unsaturated fatty acids - Chlamydomonas reinhardtii [map01040]
