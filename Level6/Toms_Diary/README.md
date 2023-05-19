# Description

# Tom's Diary

Tom found a flag and wrote something about it in his diary.

Can you get the flag?

## Hints

Neither brute force nor word lists are necessary.

# Solution

looking at the file we can see a base64 encoded string, decoding it gives me a zip header!

so lets convert it to a file

well its encrypted...

looking at the cleartext file again i noticed that the slashes and dashes in the middle are not in a certain order to look like "art"

so maybe thats an encoded password for the file?!

googeling a bit got me to:

<https://www.bergziege-owl.de/tom-tom-code/>

jeah that it is called toms diary makes sense now...

here is a online decoder:

<https://www.dcode.fr/tom-tom-code>

and the decoded text:

```
SLASHESFORPROFITSLASHESFORPROFIT
```

after trying i got the right password for the zip:

```
slashesforprofit
```

opening the zip got me straight to the flag

#FLAG: he2023{sl4sh3s_m4k3_m3_h4ppy}
