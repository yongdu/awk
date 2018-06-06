#!/bin/awk -f
# form1 - fromat countries data by continent, pop. den.
BEGIN { FS = ":"
    printf("%-15s %-10s %10s %7s %12s\n", "CONTINENT", "COUNTRY", "POPULATION", "AREA", "POP. DEN." )
 }
 { printf("%-15s %-10s %10d %7d %10.1f\n", $1,$2,$3,$4,$5) }
