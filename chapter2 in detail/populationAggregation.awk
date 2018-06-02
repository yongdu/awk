#!/bin/awk -f
# determin the total population of each continent, associative arrays are suited for this kind of aggregation.
# output into pipes, the statement print | command
BEGIN   { FS = "\t" }
        { pop[$4] += $3 }
END     { for (name in pop)
                printf("%15s\t%6d\n",name, pop[name] )      
         }