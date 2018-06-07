# table - simple table format
# this program prints items in columns  with text items left-justified on the widest entry in that column
# numeric items right justified and centered on the widest entry.
BEGIN   { FS ="\t";blanks = sprintf("%100s"," ")
          number = "^([+-]?[0-9]+[.]?[0-9]*|[.][0-9]+)$"  
 }
{  
    row[NR] = $0
    for (i =1 ; i <= NF; i++){
        if ($i ~ number)
            nwid[i] = max( nwid[i], length($i))
        wid[i] = max(wid[i], length($i))
    }
 }

 END    {
     for ( r = 1; r <= NR; r++) {
         n = split(row[r],d)
         for (i = 1; i <= n; i++){
             sep = (i < n) ? "  " : "\n"
             if(d[i] ~ number )
                printf("%" wid[i] "s%s", numjust(i,d[i]), sep )
             else
                print("%-" wid[i] "s%s", d[i], sep)
         }
     }
 }

 function max(x, y) {return (x>y)?x:y}
 function numjust(n, s){
     return s substr(blanks,1,int((wid[n]-nwid[n])/2))
 }