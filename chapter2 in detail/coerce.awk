#!/bin/awk -f

# the string value of a number is computed by formating the number with the output format conversion OFMT. 
# OFMT also controls the conversion of numbneric values to strings for concatnation,comparison,and the creation of array subscripts.
# the default value of OFMT is "%.6g", the "%.6g" is a print conversion specifier to generate a signed decimal fractional representation with or without a decimal power-of-ten exponent, as appropriate. %g       double x       (double)x"
# For %g conversion, the generated text takes the same form as either %e or %f conversion. For %G conversion, it takes the same form as either %E or %F conversion. The precision p specifies the number of significant digits generated. (If p is zero, it is changed to 1.) If %e conversion would yield an exponent in the range [-4, p), then %f conversion occurs instead. The generated text has no trailing zeros in any fraction and has a decimal point only if there are nonzero fraction digits, unless you specify the # format flag.

#    printf("%.6g", 31.4)            generates 31.4
#    printf("%.1g", 31.4)            generates 3.14e+01

BEGIN   { OFMT ="%.1g"; print 1E2 "", 12E-2 "",E12 "", 1.23456789 "" }