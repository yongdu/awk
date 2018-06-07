## AWK programming

### Chapter1 quick start

2 ways to run awk program
* run awk in commamd line
```
awk  'pattern {action}' *input files*
e.g.
awk '$3 > 0 {print $1, $2*$3}' emp.data
```

* running an awk program file
```
awk -f progfile  *optional list of input files*
e.g.
awk -f reverse.sh emp.data
```
the input files can be omitted from the command line. If just type
`awk 'program'`, awk will apply the *program* to whatever you type next on your ternimal until you type an end-of-file signal (control-d on Unix systems).
**Example:**
```
awk -f interset1
1000 .06 5
```
In this example, interset1.sh take (1000, 0.06 5 ) as arguments, then calculate
$ 1000* {(1 + 0.06)^5 }$

Easy to do with AWK
* print fields
* select input
* transform data


Awk reads its input one line at a time and splits each line into fields. where, by default, a field is a sequence of characters that doesn't contain any blanks or tabs. The first filed in the current input line is called `$1`, the second field `$2`, and so forth. The entire line is called `$0`.

**Printing every line**
`{ print }` or ` { print $0 } `
If an action has no pattern, the action is peformed for all input lines. the statment `print` by itself printss the current intput line.

**NF, the number of fields**
`{ print NF, $1, $NF }` prints the number of fields, the first and last fileds of each inpuit line.
> Awk counts the number of fields in the current line and stores the count in a built-in variable called **NF**

**Printing line numbers**
`{ print NR, $0 }` prefix each input line with its line numbers
> Awk provides another built-in variable, called **NR**, that counts the number of lines read so far

**Lining up fields**
`printf(format, value1, value2,...,valueN)`, *format* is a string that contains text to be printed verbatim with specifications of how each of the values is to be printed. A specification is a **%** followed by a few characters that control the format of value.
`{ printf ("total pay for %-8s is $%6.2f\n", $1, $2*$3) }` prints the total pay for each emplyee:
 **Data validation**
Data valdiate is to check that data has resonable values and is in right format.
Data validation is essentially negative: instead of printing lines with desirable properties, one prints lines that are suspicious.

**A handful of useful "one-lines"**
1.`END { print NR }` prints the total number of inputs lines
2.`NF > 0` prints every line that has at least one fileds
3.`length($0) > 80 `prints each line longer than 80 characters
4. Exchange the first two fields of each line and then print the line:
```
{ temp = $1; $1 = $2; $2 = temp; print}
```
5.`{$2 =""; print}` prints every line after erasing the second fields

### Chapter 2 look in detail
**Number or String ? **
Only two types of data in awk: `numbers ` and `strings of characters`. Uninitialized variables are created with the numeric value *0* and the string value *""*. Nnexsitense fileds and fields that are explicitly nulkl has only the string value *""*.

In an arithmetic expression like `pop + $3 `, the operand *pop* and *$3* must be numberic.
In a string expression like `$1 $2 `, the operand *$1* and *$2* must be strings to be concatenated, so they will be coerced to strings if necessary.

In the assignment `v = e`,  both the assignment and the variable *v* acquire the type of the expression *e*.
In a comparison expression like ` x == y `, if both operands are numeric, the comparison is numeric; otherwise, any numeric operand is coerced to string and the comparison is made on the string values.

Two idioms for coercing an expression of one type to the other:
* `number "" ` concatenate a null string to number to coerce it to a string
* `string + 0 `add zero to string to coerce it to a number

**Arrays**
the characteristic that sets awk arrays apart from those in most other language is that subscripts are *strings*. 
```
/Asia/      { pop["Asia"] +=  $3 }
/Europe/    { pop["Europe"] +=  $3 }
END         { print "Asian population is ", pop["Asia"], "million."; 
              print "European population is ", pop["Europe"], "million." }
``` 
If we had written *pop[Asia]* instead of *pop["Asia"]*, the expression would have used the value od the variable *Asia* as the subscript, and since the variable is uninitialized, the values would have accumulated in *pop[""]*.

Strings are versatile array subscripts, but the behavior of numeric subscripts are strings may sometimes appear counterintuitive. Since the string values of 1 and *"1"* are the same, arr[1] is the same as arr["1"]. But notice that 01 is not the same string as 1 and the string 10 comes before the string 2.


**User-defined functions**
```
function *name*(parameter-list){
    statements
}
```
for example, the function computes the maximum of its arguments:
```
{ print max( $1, max($2,$3) ) } # print maximum of $1, $2, $3
function max(m,n){
    return m>n ? m:n
}
```
When a function is called with an agument like $1, which is just an ordinary variable, the function is given a caopy , not the variable itself.
The jargon is that such variables , called "scalars"  are passed `by value`.
Arrays are not copied, however, so it is possible for the function to alter array elements or create new ones. this is called `by reference`.


**Command-line variable assignments**
An awk command line can have serveral forms:

```
awk 'program' f1 f2 ...
awk -f progfile f1 f2 ...
awk -Fseq 'program' f1 f2 ...
awk -Fseq -f progfile f1 f2 ...

```

**Command-line arguments**
The command line arguments are available to the awk program in a buildt-in array calle *ARGV*, the value of the buil-in variable *ARGC* is one more than the number of arguments. As the name of command *awk* is counted as argument zero, as it is in C program.

 With the command line ` awk -f progfile a v=1 b`, *ARGC* has the value 4, ARGV[0] contains *awk*, ARGV[1] contains *a*, ARGV[2] contains *v=1*,ARGV[3] contains *b*.

**local variable list in function**
 This function deletes all the elements in an array (recall that the extra whitespace signifies the start of the local variable list):
 ```
 function delarray(a,    i)
 {
     for (i in a)
        delete a[i]
 }
 ```

 **Packaged query**
 when a query is frequently asked, it makes sense ti package it into a comamnd that can be invoked without much typing.

 Suppose we want to determine the population, area, and popolation density of various contries with raw data. 
| COUNTRY  |  AREA |  POPULATION |  CONTINENT |
|----------|-------|-------------|------------|
|  USSR |   8469|  275 | Asia |
| Canada  | 3852  |  25 |  North America |
|  China |  3705 |  1032 |   Asia|
| USA  | 3615  |  237 |  North America |
|  India |  1267 |  746 |   Asia|

Follwing program is to get info by specifying courtries names.
```
awk '
# info.awk -- packaged query to get more specifi info of each country

BEGIN { FS = "\t" }
$1 ~ /'$1'/ {
    printf("%s:\n", $1)
    printf("\t%d million people \n", $3)
    printf("\t%.3f million sq. mi. \n", $2/1000)
    printf("\t%.1f people per sq. mi. \n", 1000*$3/$2)

}'  coutries.data
```

run command `bash info.awk 'Chi|USA'` to retrieve information by specifying coutries names.

