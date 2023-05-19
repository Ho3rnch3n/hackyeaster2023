# Description

# The Little Rabbit

Oh no! Someone encrypted my poem, using a One-Time-Pad.

Good news: Each line was encrypted individually, with the same key.

Bad news: The plaintext was changed somehow, before encryption.

# Solution

well.. cryptoanalysis it is i guess

it is probably something with xoring the ciphertexts together, because the result should be the same as with xoring just the plaintexts together!

a small example of my theory, plaintexts are `0x41` and `0x7a` key is `0xbb`

```
>>> 0x41 ^ 0x7a
59
>>> 0x41 ^ 0xbb 
250
>>> 0x7a ^ 0xbb
193
>>> 250 ^ 193
59
```

from that you can maybe go back to the different plaintext characters
