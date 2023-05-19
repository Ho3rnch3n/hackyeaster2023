# Description

# Kaos Motorn

What?
Is?
This?
[Kaos](https://docs.google.com/spreadsheets/d/1yxWyraRKss6Wqbw_ejuws6v92vwdE1AEAP1Cc8oec7M/edit?usp=sharing)?

## Hints

Inputs are in the range 0..9.

# Solution

so a kind of crossword puzzle in excel i guess?!

so i figured the flag must be in the middle, and the characters are more or less calculated by a lot of other fields

as a first step i wrote down all the calulation steps done, and i also made the assumption that the `he2023{` prefix will also be in the printed flag in the excel sheet

as a result i got myself the following (i just used the field position as variable names since it was easier for me to remember where which thing was)

```
h = 104 = 52 + b5
e = 101 = 44 + i7
2 = 50 = 48 + j3
0 = 48 = 45 + e6
2 = 50 = 42 + i5
3 = 51 = 63 - f10
{ = 123 = 93 + h13
} = 125 = e6 * h11 - 25


b5 = (j13 + d11 + f12 + i10) % 64
i7 = (f12 + d11 * g6 + h3) % 64 
j3 = (f12 + d11 + d5 + f4) % 64 
e6 = (f4 + d11 + i10) % 64 
i5 = (h3 + d5) % 64 
f10 = (j13 + f12 + d11 + f4 + 17) % 64 
h13 = (h3 + g6 + f12 + d11 + b13 + b13) % 64 
h11 = (c3 + h3 + f12) % 64 


j13 = (d14 + b7 * e2) % 64
d11 = (e2 * g14) % 64
f12 = (e2 * b7 + d14) % 64
i10 = (j6 * g14 + b7) % 64
g6 = (g14 * b7 + d14) % 64
h3 = (b7 * j6 * 7) % 64
d5 = (e2 + j6 + b7 + d14 + g14) % 64
f4 = (e2 * g14 + d14 + j6) % 64
b13 = (b7 * j6 * g14 + 5) % 64
c3 = (j6 + b7 + 34 + g14) % 64


d14 = input
b7 = input
e2 = input
g14 = input
j6 = input
```

so i only have 5 inputfields i need to actually use?! i rechecked it and did not find any errors

with only 5 inputs from 0-9 i should be able to easily bruteforce inputs which produce the `he2023{` prefix for the first outputs, since 100000 tries are not that much

hopefully the rest of the flag will then be generated correctly!

so lets write a small python script, i was able to use the already written down formulas in the script!

the script found something!

```
$ python3 solve.py
valid combination found:
d14: 1
b7: 2
e2: 8
g14: 5
j6: 8
```

entering this values gave me the following flag:

```
he2023{Th4tSKa0Z!}
```

and this is the right flag!

after thinking again i actually made a huge mistake, because i only wrote down the formulas of the fields i assumed with the flag format, not all the formulas, so i could have missed some inputs

but it did not matter so no problem!

# FLAG: he2023{Th4tSKa0Z!}
