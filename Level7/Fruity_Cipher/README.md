# Description

# Fruity Cipher

I found this fruity message. Can you decrypt it?

🥦🥝🍋🍊🥭🍌🫑🧅 🧅🥝🥖 🍉🍠🥬🫐 🍉🫐🥔🥥🍈 🥔🍌🥝🥖🍏 🥐🍍🥦🍉🍇🥥🍋 🥑🍉🍍🥐🍉 🍅🍠🥦 🍋🥭🍓🍐🌶🍇 🥕🌶🥔🥭🍓🍏🍒🍆🍏 🌶🫐🍎🍏🍒🥥🍊 🍎🥝 🍅🥝🥥🍇 🍎🍉🥔🍓 🥝🍓🍇 🥐🥭🥦🍉🍇🥥🍏🫐🍆🍎 🌶🫐🍎🍏🍇🥥🍋 🍎🍉🍇🍊🫐 🍠🥥🍒 🥐🍠🌶🫑🫐🍈 🍉🥝🍅🥝🥦🍉🥝🍓🍍🥐 🥐🍍🥕🍉🫐🥥🍋 🍏🍉🍇 🍋🥝🫑🥖🍏🍍🥝🍓 🥭🍋 🍉🧅🥦🍒🥥🥬🥭🍏🍠🍅🥭🍓🥝🍋🥭🍊

🚩 Flag

 - lowercase only, no spaces
 - wrap into he2023{ and }
 - example: he2023{exampleflagonly}

## Hints

 - the plaintext consist of lowercase letters (and spaces) only
 - there are more than 26 symbols
 - 🍏 == 🍎

# Solution

so we have a bunch of emojies...


decoding to hex characters with:

<https://onlineunicodetools.com/convert-unicode-to-hex>

```
0xd83edd66 0xd83edd5d 0xd83cdf4b 0xd83cdf4a 0xd83edd6d 0xd83cdf4c 0xd83eded1 0xd83eddc5 0x0020 0xd83eddc5 0xd83edd5d 0xd83edd56 0x0020 0xd83cdf49 0xd83cdf60 0xd83edd6c 0xd83eded0 0x0020 0xd83cdf49 0xd83eded0 0xd83edd54 0xd83edd65 0xd83cdf48 0x0020 0xd83edd54 0xd83cdf4c 0xd83edd5d 0xd83edd56 0xd83cdf4f 0x0020 0xd83edd50 0xd83cdf4d 0xd83edd66 0xd83cdf49 0xd83cdf47 0xd83edd65 0xd83cdf4b 0x0020 0xd83edd51 0xd83cdf49 0xd83cdf4d 0xd83edd50 0xd83cdf49 0x0020 0xd83cdf45 0xd83cdf60 0xd83edd66 0x0020 0xd83cdf4b 0xd83edd6d 0xd83cdf53 0xd83cdf50 0xd83cdf36 0xd83cdf47 0x0020 0xd83edd55 0xd83cdf36 0xd83edd54 0xd83edd6d 0xd83cdf53 0xd83cdf4f 0xd83cdf52 0xd83cdf46 0xd83cdf4f 0x0020 0xd83cdf36 0xd83eded0 0xd83cdf4e 0xd83cdf4f 0xd83cdf52 0xd83edd65 0xd83cdf4a 0x0020 0xd83cdf4e 0xd83edd5d 0x0020 0xd83cdf45 0xd83edd5d 0xd83edd65 0xd83cdf47 0x0020 0xd83cdf4e 0xd83cdf49 0xd83edd54 0xd83cdf53 0x0020 0xd83edd5d 0xd83cdf53 0xd83cdf47 0x0020 0xd83edd50 0xd83edd6d 0xd83edd66 0xd83cdf49 0xd83cdf47 0xd83edd65 0xd83cdf4f 0xd83eded0 0xd83cdf46 0xd83cdf4e 0x0020 0xd83cdf36 0xd83eded0 0xd83cdf4e 0xd83cdf4f 0xd83cdf47 0xd83edd65 0xd83cdf4b 0x0020 0xd83cdf4e 0xd83cdf49 0xd83cdf47 0xd83cdf4a 0xd83eded0 0x0020 0xd83cdf60 0xd83edd65 0xd83cdf52 0x0020 0xd83edd50 0xd83cdf60 0xd83cdf36 0xd83eded1 0xd83eded0 0xd83cdf48 0x0020 0xd83cdf49 0xd83edd5d 0xd83cdf45 0xd83edd5d 0xd83edd66 0xd83cdf49 0xd83edd5d 0xd83cdf53 0xd83cdf4d 0xd83edd50 0x0020 0xd83edd50 0xd83cdf4d 0xd83edd55 0xd83cdf49 0xd83eded0 0xd83edd65 0xd83cdf4b 0x0020 0xd83cdf4f 0xd83cdf49 0xd83cdf47 0x0020 0xd83cdf4b 0xd83edd5d 0xd83eded1 0xd83edd56 0xd83cdf4f 0xd83cdf4d 0xd83edd5d 0xd83cdf53 0x0020 0xd83edd6d 0xd83cdf4b 0x0020 0xd83cdf49 0xd83eddc5 0xd83edd66 0xd83cdf52 0xd83edd65 0xd83edd6c 0xd83edd6d 0xd83cdf4f 0xd83cdf60 0xd83cdf45 0xd83edd6d 0xd83cdf53 0xd83edd5d 0xd83cdf4b 0xd83edd6d 0xd83cdf4a
```

every character starts with 0xd83ed - so maybe there is something in the lower bytes - except the spaces (0x0020)

after some more fiddeling i figured that this was a wrong path...

some days later i tried to just replace all the emojis with normal characters like in a substitution cipher...

my first attempt looked like this (i grouped all the emojis with similar utf8 bytes together)

```
abccecgh hbi jklm jmnop ncbiq rsajtoc ujsrj vka cewxyt zynewqdfq ymqqdoc qb vbot qjnw bwt reajtoqmfq ymqqtoc qjtcm kod rkygmp jbvbajbwsr rszjmoc qjt cbgiqsbw ec jhadoleqkvewbcec

🥦=a
🥝=b
🍋=c=🍊=🍌
🍒=d
🥭=e
🍆=f
🫑=g
🧅=h
🥖=i
🍉=j
🍠=k
🥬=l
🫐=m
🥔=n
🥥=o
🍈=p
🍏=🍎=q
🥐=r
🍍=s
🍇=t
🥑=u
🍅=v
🍓=w
🍐=x
🌶=y
🥕=z
```

using this substitution cipher solver i got the following "solution"

<https://www.dcode.fr/monoalphabetic-substitution>

```
POSSISJQ QOF HAVU HUXRZ XSOFT CYPHERS WHYCH MAP SINGBE KBXINTDLT BUTTDRS TO MORE THXN ONE CIPHERTULT BUTTERS THESU ARD CABJUZ HOMOPHONYC CYKHURS THE SOJFTYON IS HQPDRVITAMINOSIS 
```

this already looks like some words are right, but not everything, but i think i am heading in the right direction

with that information i tried to solve the substitution by hand!

for that i used this tool

<https://www.boxentriq.com/code-breaking/cryptogram>

also i built myself a new starting string, since i figured the assumptions about the same letters i made are wrong, for that i used some german umlaute

```
abcdefgh hbi jklm jmnop nfbiq rsajtoc ujsrj vka cewxyt zynewqäüq ymqqäod qb vbot qjnw bwt reajtoqmüq ymqqtoc qjtdm koä rkygmp jbvbajbwsr rszjmoc qjt cbgiqsbw ec jhaäoleqkvewbced

🥦=a
🥝=b
🍋=c
🍊=d
🥭=e
🍌=f
🫑=g
🧅=h
🥖=i
🍉=j
🍠=k
🥬=l
🫐=m
🥔=n
🥥=o
🍈=p
🍏=🍎=q
🥐=r
🍍=s
🍇=t
🥑=u
🍅=v
🍓=w
🍐=x
🌶=y
🥕=z
🍒=ä
🍆=ü
```

after some fiddeling i got the right answertext!

```
possibly you have heard about ciphers which map single plaintext letters to more than one ciphertext letters these are called homophonic ciphers the solution is hypervitaminosis
```

the mapping i created is the following:

```
a=p
b=o
c=s
d=s
e=i
f=b
g=l
h=y
i=u
j=h
k=a
l=v
m=e
n=a
o=r
p=d
q=t
r=c
s=i
t=e
u=w
v=m
w=n
x=g
y=l
z=p
ä=e
ü=x
```

so the flag is

# FLAG: he2023{hypervitaminosis}
