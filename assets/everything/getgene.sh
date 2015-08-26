#!/bin/bash

curl -s http://rest.kegg.jp/get/path:cre01040 |
gawk '/^GENE/ {seen = 1 } seen {print}' |
sed -n '/^COMPOUND/q;p' |
perl -pe 's/^GENE\s+|\s+//' 
