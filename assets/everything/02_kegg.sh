#!/bin/bash

PATHWAY=$1

# List pathway by
# curl -s http://rest.kegg.jp/list/pathway/hsa
curl -s http://rest.kegg.jp/get/$PATHWAY |
gawk '/^GENE/ {seen = 1 } seen {print}' |
sed '1s/^GENE//g' |
sed -n '/^[^ ]/q;p' |
sed 's/^[ \t]*//' |
gawk '{print $1}'
exit 0
