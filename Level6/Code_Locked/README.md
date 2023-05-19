# Description

# Code Locked

Open the code lock at <http://ch.hackyeaster.com:2311> to get your 🚩 flag.

Note: The service is restarted every hour at x:00.

# Solution

ok we got a nice lock to open, when we enter the wrong code we get rickrolled, very nice :D

jup i downloaded everything because its funny :D

but the important thing is the check.wasm file, this is webassembly so jeah... much fun :(

i did this once till now i think, so somewhere i have a writeup on how to decompile this to somewhat readable c code

well i did this in hackyeaster 2019... and used the following decompiling repo

<https://github.com/WebAssembly/wabt>

now i also found this same repo and it is still updated

so i built it like described in the repo, which suprisingly worked without any problems

then i used the tool to create a c file:

```
$ ./wasm2c ../../source/check.wasm -o ../../check.c
```

after reading this:

<https://book.hacktricks.xyz/reversing-and-exploiting/reversing-tools-basic-methods>

i first tried other ways...

ok did not do much...

i don't even know where to start... so uhm jeah...

well after some days, i had a really good idea after solving kaos motorn: just write code to try out everything! (100 million is a bit much but lets try it anyway)

so i wrote this to just paste into the browsers console, i copied most of the code from main.js from the sources!:

```
for(i=0;i<100000000;i++){
    code = String(i).padStart(8, '0')
    msg = checkWASM(code);
    if (msg.startsWith("he2023")) {
        play("success.mp3");
        audioSuccess.play();
        $("#green").show(0).delay(5000).hide(0);
	console.log(code);
        break;
    }
}
```

it just took a few seconds and i got this number:

```
29660145
```

after entering manually i got an alert with the flag:

i could have just written a smarter code, to also print the flag...:

```
for(i=0;i<100000000;i++){
    code = String(i).padStart(8, '0')
    msg = checkWASM(code);
    if (msg.startsWith("he2023")) {
        play("success.mp3");
        audioSuccess.play();
        $("#green").show(0).delay(5000).hide(0);
        console.log(code);
        console.log(msg);
        break;
    }
}
```

# FLAG: he2023{w3b4553m81y_15_FUN}
