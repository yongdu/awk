# reverse - print the inout in reverse order by line
{ line[NR] =$0} # remeber each input line
END {
  i = NR; # print line in reverse order
# method 1 by using while statement
#  while (i > 0){print line[i];i--;}
# method 2 by using for statement
{for( i=NR;i>0;i--)
  print line[i]
}

}
