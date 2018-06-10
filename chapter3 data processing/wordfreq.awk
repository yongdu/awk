#wordfreq - print number of occurrences of each word
# inptut  : text
# output  : number-word pairs sorted by number
{ gsub(/[.,:;!?(){}]/,"") # remove puctuation
    for (i=1; i<=NF;i++)
        count[$i]++
 } 

 END { for (w in count)
        print count[w],w | "sort -rn" 
     }

# to fold upper and lower case together, could use "tr", cat file | tr "[A-Z]" "[a-z]" 
# example echo "Hi WorlD" | tr "[A-Z]" "[a-z]"  , output: "hi world"