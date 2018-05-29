# interest 1- compute compound interset
# intput: amount rate years
# output: compunded value at the end of each years
{
  i= 1
  while (i<= $3) {
      printf ("\t%.2f\n", $1*(1 +$2)^i)
      i++
  }
}
