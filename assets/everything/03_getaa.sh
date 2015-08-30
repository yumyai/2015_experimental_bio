#!/bin/bash

GENE=$1
curl -s "http://rest.kegg.jp/get/$GENE/aaseq"
