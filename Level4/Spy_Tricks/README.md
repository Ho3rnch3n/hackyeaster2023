# Description

# Spy Tricks

The bunny spymaster found a tiny note in a forgotten dead drop and is now scratching her head; she's sure she once knew the code, but there are too many swirling aorund in her head right now. Can you help her decipher the message?

## Hints

Looks like these numbers have something in common!

# Solution

the first thing i got to mind is the greatest common divisor

jup so first i calculated the greatest common divisor of all numbers in the file and then divided them all by it and interpreted the result as ascii character:

```
$ python3 solve.py 
Found gcd: 313
WE CONGRATULATE YOU ON A SAFE ARRIVAL. WE CONFIRM THE RECEIPT OF YOUR LETTER TO THE ADDRESS V REPEAT V AND THE READING OF LETTER NUMBER 1.
he2023{I_like_303_b3tter_but_thats_n0t_pr1me}
THE PACKAGE WAS DELIVERED TO YOUR WIFE PERSONALLY. EVERYTHING IS ALL RIGHT WITH THE FAMILY. WE WISH YOU SUCCESS. GREETINGS FROM THE COMRADES. NUMBER 1, 3RD OF DECEMBER.
```

# FLAG: he2023{I_like_303_b3tter_but_thats_n0t_pr1me}
