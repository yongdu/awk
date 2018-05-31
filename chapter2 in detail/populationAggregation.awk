#!/bin/awk -f
# determin the total population of each continent, associative arrays are suited for this kind of aggregation.
BEGIN   { FS = "\t" }
        { pop[$4] += $3 }
END     { for (name in pop)
                print name, pop[name]        
         }