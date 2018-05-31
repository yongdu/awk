#!#/bin/awk -f
# concatenated string 

        { s= s substr($1,1,3) " " } # substr(s,p,n) only the first n characters of the suffix that begins at position p of string s are retured
END     { print s}