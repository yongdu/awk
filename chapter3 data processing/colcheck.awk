#!/bin/awk -f
# colcheck - check the consitency of columns
# input: rows of numbers and strings
# output: lines whose format differs from first lines

NR == 1 {
    nfld = NF
    for (i = 1; i <= NF; i++)
        type[i] = isnum($i) 
}

{
    if (NF != nfld)
        printf("line %d has %d fields inteads of %d\n", NR, NF, nfld )
    for(i = 1; i <= NF; i++)
        if( isnum($i) != type[i] )
            printf("filed %d in line %d differs from line 1 \n", i, NR)
}

function isnum(n) {return n ~ /^[+-]?[0-9]+$/ }