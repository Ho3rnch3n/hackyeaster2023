# Description

# Numbers Station

"Testing, testing, one, two, one, zero.." - the bunnies found a strange radio station when looking for uplifting BunnyBop; can you find out what the nice Spanish lady is saying?

## Hints

There are 10 kinds of people in this world.

Those who understand binary, and those who don't.

# Solution

so we get a audio file where a lady tells us numbers in spanish... is is 8 minutes long...

first i was searching for speech to text programs, but i only found one free one and it was not good a lot of numbers were missing or wrong..

so i transcribed the first numbers till the first "break", i noticed that there are some longer than usual breaks in the file

the transcription got me the following:

```
04361415041304070907171603091709180606161603041402
```

so i tried to interpret these numbers somehow... after a lot of trying and the hint i found a way which looks promisable!

spliting the numbers up like that:

```
04
36
14
15
04
13
04
07
09
07
17
16
03
09
17
09
18
06
06
16
16
03
04
14
02
```

i saw that every second number nearly only had a one or zero, only writing the ones and zeroes down got me this:

```
01101000 01100101 00110010
```

this interpreted as ascii gave me:

```
he2
```

this really looks promising!

what i will do now, is make screenshots of the sounds of 0 and 1, since i think they are just copy pastas, and then compare the waves in sonic visualiser, so i dont have to listen to the whole file and maybe mess up something

```
011010000110010100110010001100000011001000110011011110110100110000110001011100110111010001100101011011100110100101101110011001110101111101110100011011110101111101110011011100000111100101011111011000110011000001101101011011010111010101101110011010010110001101100001011101000011000101101111011011100111001101111101
```

this to ascii gives me the flag:

```
he2023{L1stening_to_spy_c0mmunicat1ons}
```

# FLAG: he2023{L1stening_to_spy_c0mmunicat1ons}
