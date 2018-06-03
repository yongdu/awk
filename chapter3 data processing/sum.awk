#!/bin/awk -f
# sum print sums of numeric columns
#   input : rows of integer and strings
#   output: sums of numeric columns
#   assume every line has same layout

NF > 0 { 
     nfld = NF
     for (i = 1; i <= NF; i++)
        numcol[i] = isnum($i)
    }

    {
        for(i = 1; i <= NF; i++)
            if (numcol[i])
                sum[i] += $i
    }
END {
        for (i = 1; i <= nfld; i++){
            if(numcol[i])
                printf("%g", sum[i])
            else
                printf("---")
            printf(i < nfld ? "\t" : "\n")
        }
    }

    function isnum(n) { return n ~ /^[+-]?[0-9]+$/ }