#!/bin/bash

PATHWAY=$1

curl -s http://rest.kegg.jp/get/path:$PATHWAY |
gawk '/^GENE/ {seen = 1 } seen {print}' |
sed -n '/^COMPOUND/q;p' |
perl -pe 's/^GENE\s+|\s+//'
