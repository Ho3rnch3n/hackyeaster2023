# Description

# Bouncy Not In The Castle

Very bouncy, indeed, but not in a castle.

 - Try <http://ch.hackyeaster.com:2308>

Note: The service is restarted every hour at x:00.

# Solution

ok its a website with a very nice animation, so the flag is probably in the code somewhere...

looking in the script there are eggs generated, probably the characters of the flag or so, lets try to print them out

there is also a script loaded called `background.png.js` this looks also sus!

the variable initialized in this background file is only used here:

```
function getRandomColor(x, z) {
	let pos = (x + z * 21) * 6;
	let val = parseInt(hex.substring(pos, pos + 6), 16);
	console.log("x:" + x + ", z: " + z + ", val: " + val )
	return val;	
}
```

well tried a bunch of stuff but nothing really worked

so i got the hint of `21x21`

after some googeling and trying random stuff i thought, hey thats the size of qr codes!!

so i tried to print the colors in the log as picture with the also printed x and z positions, i saved the output of the log in data.txt

so i built the image and analyzed a bit, after some tinkering around and comparing to the default black and white pixels of a qr code i found that the red value was always odd on a black pixel and even on a white pixel, since the red values are the lsb in my big number i just need to check if this number is odd or even and from that color the pixel right

lets try that:

jeah that looks like a qr code!!

at first the qr code was too low resolution for zbarimg to read it, but i could simply upscale it!

```
$ zbarimg solution.png 
QR-Code:he2023{n0_b0uNc}
scanned 1 barcode symbols from 1 images in 0.01 seconds
```

# FLAG: he2023{n0_b0uNc}
