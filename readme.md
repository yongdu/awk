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

#### Chapter 2 look in detail
