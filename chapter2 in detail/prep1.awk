#!/bin/awk -f
# prep1 - prepare coutries by continent and pop, den.
BEGIN   { FS = "\t" }
        { 
            printf("%s:%s:%d:%d:%.1f\n", $4, $1, $3, $2, 1000*$3/$2) | "sort -t: +0 -1 +4rn"
         }