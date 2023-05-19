# Description

# Global Egg Delivery

Thumper has taken great strides with the digitization of the business of distributing eggs and assorted goodies. Globalizing such a service is not without its pains and requires the additional effort to account for local customs.

Now Thumper has his message all prepared, fed through a block-chain enabled, micro-service driven, AI enhanced, zero trust translation service all that comes back is this...

Can you help Thumper decode the message?

# Solution

so as it is feed through all of this this must be super secure i guess, thats why it says decode and not decrypt :D

uhm i have not thought that it would be that easy...

```
$ xxd message.txt                                                 
00000000: fffe 6800 feff 0065 fffe 3200 feff 0030  ..h....e..2....0
00000010: fffe 3200 feff 0033 fffe 7b00 feff 0075  ..2....3..{....u
00000020: fffe 3700 feff 0192 fffe 5f00 feff 0062  ..7......._....b
00000030: fffe 3000 feff 006d fffe 3500 feff 0073  ..0....m..5....s
00000040: fffe 5f00 feff 0038 fffe 7200 feff 15f1  .._....8..r.....
00000050: fffe 5f00 feff 006e fffe 3000 feff 0037  .._....n..0....7
00000060: fffe 5f00 feff 0038 fffe 6331 feff 0077  .._....8..c1...w
00000070: fffe 6100 feff 0079 fffe 3500 feff 005f  ..a....y..5...._
00000080: fffe 3100 feff 0067 fffe 6e00 feff 0030  ..1....g..n....0
00000090: fffe 7200 feff 15f1 fffe 6400 feff 007d  ..r.......d....}
```

not quite the flag, but i think i can just restore it by hand

```
he2023{u7?_b0m5s_8r?_n07_8c1way5_1gn0r?d}
```

well nope, don't want to try out all cases, lets use python for it, since i know now it is about utf-8 BOM encoding

<https://stackoverflow.com/questions/8898294/convert-utf-8-with-bom-to-utf-8-with-no-bom-in-python>

well not that easy as it seems, after looking at this i think i got it:

<https://de.wikipedia.org/wiki/Byte_Order_Mark>

but it looks like that this sequence is normaly only once at the beginning of a file and not before every character!

so i used this site to just decode the few unknown characters (with more than ony byte) using utf-16, since the wikipedia entries suggested they are utf-16 le or be:

<https://dencode.com/string/hex>

# FLAG: he2023{u7ƒ_b0m5s_8rᗱ_n07_8ㅣway5_1gn0rᗱd}
