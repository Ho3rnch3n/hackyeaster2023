# Description

# Ghost in a Shell 4

  _, _,_  _,  _, ___   _ _, _    _,    _, _,_ __, _,  _,    , ,   ,  
 / _ |_| / \ (_   |    | |\ |   /_\   (_  |_| |_  |   |     | \   /  
 \ / | | \ / , )  |    | | \|   | |   , ) | | |   | , | ,   |  \ /  
  ~  ~ ~  ~   ~   ~    ~ ~  ~   ~ ~    ~  ~ ~ ~~~ ~~~ ~~~   ~   ~   
______________________________________________________________________  
 ,--.     ,--.     ,--.     ,--.  
| oo |   | oo |   | oo |   | oo |  
| ~~ |   | ~~ |   | ~~ |   | ~~ |  o  o  o  o  o  o  o  o  o  o  o  o  
|/\/\|   |/\/\|   |/\/\|   |/\/\|  
______________________________________________________________________  
  
Connect to the server, snoop around, and find the flag!

 - `ssh ch.hackyeaster.com -p 2306 -l blinky`
 - password is: `blinkblink`
Note: The service is restarted every hour at x:00.

# Solution

so this is a challenge type which is there once or even multiple of them per hacky easter (thats why it is already nr 4)

here we have to get root somehow most of the time

```
$ ssh ch.hackyeaster.com -p 2306 -l blinky
blinky@ch.hackyeaster.com's password: 

  _, _,_  _,  _, ___   _ _, _    _,    _, _,_ __, _,  _,    , ,   ,
 / _ |_| / \ (_   |    | |\ |   /_\   (_  |_| |_  |   |     | \   /
 \ / | | \ / , )  |    | | \|   | |   , ) | | |   | , | ,   |  \ /
  ~  ~ ~  ~   ~   ~    ~ ~  ~   ~ ~    ~  ~ ~ ~~~ ~~~ ~~~   ~   ~ 
______________________________________________________________________
 ,--.     ,--.     ,--.     ,--.
| oo |   | oo |   | oo |   | oo |
| ~~ |   | ~~ |   | ~~ |   | ~~ |  o  o  o  o  o  o  o  o  o  o  o  o
|/\/\|   |/\/\|   |/\/\|   |/\/\|
______________________________________________________________________

Find the flag!
1f833b916b14:~$ 
1f833b916b14:~$ 
1f833b916b14:~$ ls -la
about.txt
blinky
flag.txt
1f833b916b14:~$ cat flag.txt 
|\---/|
| o_o |  meow!
 \___/
1f833b916b14:~$ cat about.txt 
|\---/|
| o_o |  meow!
 \___/
1f833b916b14:~$ cat blinky/
|\---/|
| o_o |  meow!
 \___/
1f833b916b14:~$ ls -lah
about.txt
blinky
flag.txt
1f833b916b14:~$ echo $SHELL
/bin/bash
1f833b916b14:~$ bash
you are not a bash brother
logout
Connection to ch.hackyeaster.com closed.
```

looks we don't have a normal shell...

ok ls has been modified...

```
$ ssh ch.hackyeaster.com -p 2306 -l blinky
blinky@ch.hackyeaster.com's password: 

  _, _,_  _,  _, ___   _ _, _    _,    _, _,_ __, _,  _,    , ,   ,
 / _ |_| / \ (_   |    | |\ |   /_\   (_  |_| |_  |   |     | \   /
 \ / | | \ / , )  |    | | \|   | |   , ) | | |   | , | ,   |  \ /
  ~  ~ ~  ~   ~   ~    ~ ~  ~   ~ ~    ~  ~ ~ ~~~ ~~~ ~~~   ~   ~ 
______________________________________________________________________
 ,--.     ,--.     ,--.     ,--.
| oo |   | oo |   | oo |   | oo |
| ~~ |   | ~~ |   | ~~ |   | ~~ |  o  o  o  o  o  o  o  o  o  o  o  o
|/\/\|   |/\/\|   |/\/\|   |/\/\|
______________________________________________________________________

Find the flag!
1f833b916b14:~$ ls /
about.txt
blinky
flag.txt
1f833b916b14:~$ cd blinky/
1f833b916b14:~$ 
1f833b916b14:~$ pwd
/home/blinky
1f833b916b14:~$ cd ..
1f833b916b14:~$ blinky/
-bash: blinky/: Is a directory
1f833b916b14:~$ pw
-bash: pw: command not found
1f833b916b14:~$ pwd
/home/blinky
1f833b916b14:~$ history
    1  ls /
    2  cd blinky/
    3  pwd
    4  cd ..
    5  blinky/
    6  pw
    7  pwd
    8  history
1f833b916b14:~$ env
SHELL=/bin/bash
PWD=/home/blinky
LOGNAME=blinky
HOME=/home/blinky
SSH_CONNECTION=193.154.121.143 46596 172.20.0.15 22
TERM=xterm-256color
USER=blinky
SHLVL=1
PAGER=less
PS1=\h:\w\$ 
SSH_CLIENT=193.154.121.143 46596 22
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
MAIL=/var/mail/blinky
SSH_TTY=/dev/pts/1
_=/usr/bin/env
1f833b916b14:~$ id
uid=0(root) gid=0(root) groups=0(root)
1f833b916b14:~$ users
-bash: users: command not found
1f833b916b14:~$ ls /bin/
about.txt
blinky
flag.txt
1f833b916b14:~$ /bin/ls
ls     lsblk  
1f833b916b14:~$ /bin/ls .
about.txt  blinky     flag.txt   home
1f833b916b14:~$ which ls
/bin/ls
1f833b916b14:~$ ls
about.txt
blinky
flag.txt
1f833b916b14:~$ which ls
/bin/ls
1f833b916b14:~$ /bin/ls flag.txt 
flag.txt
1f833b916b14:~$ /bin/cat flag.txt 
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣶⣿⣿⣿⣿⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⠿⠟⠛⠻⣿⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀don't try⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣆⣀⣀⠀⣿⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀- brute force⠀⠀⠀⠀⠀⠀⢸⠻⣿⣿⣿⠅⠛⠋⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀- wordlists⠀⠀⠀⠀⠀⠀⠀⠀⠘⢼⣿⣿⣿⣃⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣟⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣛⣛⣫⡄⠀⢸⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⡆⠸⣿⣿⣿⡷⠂⠨⣿⣿⣿⣿⣶⣦⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⣾⣿⣿⣿⣿⡇⢀⣿⡿⠋⠁⢀⡶⠪⣉⢸⣿⣿⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⡏⢸⣿⣷⣿⣿⣷⣦⡙⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣇⢸⣿⣿⣿⣿⣿⣷⣦⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣵⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⡁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
1f833b916b14:~$ 
```

but the real path at `/bin/x` works!

now we have a normal shell!

```
1f833b916b14:~$ /bin/bash
1f833b916b14:~$ ls
about.txt  blinky     flag.txt   home
1f833b916b14:~$ ls -la
total 40
drwxr-xr-x    1 root     root          4096 Apr  7 16:00 .
drwxr-xr-x    1 root     root          4096 Mar 12 13:37 ..
-rwxr-xr-x    1 root     root            15 Apr  7 16:00 .bashrc
-rwxr-xr-x    1 root     root           644 Feb  9 07:49 about.txt
drwxr-xr-x    1 root     root          4096 Mar 12 13:37 blinky
-rwxr-xr-x    1 root     root          2661 Feb  9 07:49 flag.txt
drwxr-xr-x    1 root     root          4096 Mar 12 13:37 home
1f833b916b14:~$ 
```

real exploring

```
1f833b916b14:~$ cat about.txt 
Blinky, ankaŭ konata kiel Akabei, estas la gvidanto de la Fantomoj kaj la ĉefmalamiko de Pac-Man. Li ankaŭ estas prezentita kiel la plej agresema fantomo kiu ĉiam postkuras Pac-Man, kaj malfacilas skui post kiam li komencas. Li povas havi humoron, kaj estas bonaj amikoj kun Pinky, Inky, kaj Clyde. Li ankaŭ havas filinon nomitan Yum-Yum.

Dum origine la ĉefantagonisto en la unua Pac-Man arkadludo, lia antagonisma rolo de la franĉizo estis plejparte malpliigita al aliancano en lastatempaj enkarniĝoj, kvankam li daŭre estas konsiderita la serio-fakta ĉefa antagonisto en refilmigoj de la unua matĉo kaj de pli maljunaj adorantoj.
1f833b916b14:~$ cat .bashrc 
set +o history
```

before i was root, now i am not...

```
1f833b916b14:~$ whoami
blinky
1f833b916b14:~$ id
uid=1000(blinky) gid=1000(blinky) groups=1000(blinky)
```

looks like i found the flag:

```
1f833b916b14:~$ ls -la /home/
total 20
drwxr-xr-x    1 root     root          4096 Mar 12 13:37 .
drwxr-xr-x    1 root     root          4096 Apr  7 16:00 ..
drwxr-xr-x    1 root     root          4096 Apr  7 16:00 blinky
1f833b916b14:~$ ls -la /home/blinky/
total 40
drwxr-xr-x    1 root     root          4096 Apr  7 16:00 .
drwxr-xr-x    1 root     root          4096 Mar 12 13:37 ..
-rwxr-xr-x    1 root     root            15 Apr  7 16:00 .bashrc
-rwxr-xr-x    1 root     root           644 Feb  9 07:49 about.txt
drwxr-xr-x    1 root     root          4096 Mar 12 13:37 blinky
-rwxr-xr-x    1 root     root          2661 Feb  9 07:49 flag.txt
drwxr-xr-x    1 root     root          4096 Mar 12 13:37 home
1f833b916b14:~$ ls -la blinky/
total 12
drwxr-xr-x    1 root     root          4096 Mar 12 13:37 .
drwxr-xr-x    1 root     root          4096 Apr  7 16:00 ..
1f833b916b14:~$ ls -la home/
total 24
drwxr-xr-x    1 root     root          4096 Mar 12 13:37 .
drwxr-xr-x    1 root     root          4096 Apr  7 16:00 ..
drwxr-xr-x    1 root     root          4096 Mar 12 13:37 blinky
1f833b916b14:~$ ls -la home/blinky/
total 20
drwxr-xr-x    1 root     root          4096 Mar 12 13:37 .
drwxr-xr-x    1 root     root          4096 Mar 12 13:37 ..
-rwxr-xr-x    1 root     root           228 Feb  9 07:49 blinkyflag.fzip
1f833b916b14:~$ cd home/blinky/
1f833b916b14:~/home/blinky$ file blinkyflag.fzip 
bash: file: command not found
1f833b916b14:~/home/blinky$ xxd blinkyflag.fzip 
00000000: 504b 0304 0a00 0900 0000 1094 3655 6de8  PK..........6Um.
00000010: c16f 2e00 0000 2200 0000 0800 1c00 666c  .o....".......fl
00000020: 6167 2e74 7874 5554 0900 0320 8e2c 6320  ag.txtUT... .,c 
00000030: 8e2c 6375 780b 0001 04f5 0100 0004 1400  .,cux...........
00000040: 0000 52bf 0fa4 9105 c4cf 0760 022e a42f  ..R........`.../
00000050: e7dd 062a a7c8 38e3 2b7b 67f7 c9e8 2769  ...*..8.+{g...'i
00000060: 4dc3 5533 8d37 5748 8c73 3f42 f216 f70c  M.U3.7WH.s?B....
00000070: 504b 0708 6de8 c16f 2e00 0000 2200 0000  PK..m..o...."...
00000080: 504b 0102 1e03 0a00 0900 0000 1094 3655  PK............6U
00000090: 6de8 c16f 2e00 0000 2200 0000 0800 1800  m..o....".......
000000a0: 0000 0000 0100 0000 a481 0000 0000 666c  ..............fl
000000b0: 6167 2e74 7874 5554 0500 0320 8e2c 6375  ag.txtUT... .,cu
000000c0: 780b 0001 04f5 0100 0004 1400 0000 504b  x.............PK
000000d0: 0506 0000 0000 0100 0100 4e00 0000 8000  ..........N.....
000000e0: 0000 0000                                ....
1f833b916b14:~/home/blinky$ 
```

but well...

```
$ unzip blinkyflag.fzip 
Archive:  blinkyflag.fzip
[blinkyflag.fzip] flag.txt password: 
password incorrect--reenter: 
password incorrect--reenter: 
   skipping: flag.txt                incorrect password
```

well i at first copied the flag file to my computer so i don't need to unzip it there and maybe spoil others or give the flag away for free

```
$ xxd -r flag_xxd.txt > flag.fzip
$ file flag.fzip 
flag.fzip: Zip archive data, at least v1.0 to extract, compression method=store
```

found something in `/var/mail`

```
1f833b916b14:~/home/blinky$ ls -la /var
total 56
drwxr-xr-x    1 root     root          4096 Aug 28  2020 .
drwxr-xr-x    1 root     root          4096 Apr  7 16:00 ..
drwxr-xr-x    1 root     root          4096 May 29  2020 cache
dr-xr-xr-x    2 root     root          4096 May 29  2020 empty
drwxr-xr-x    2 root     root          4096 Aug 28  2020 git
drwxr-xr-x    5 root     root          4096 May 29  2020 lib
drwxr-xr-x    2 root     root          4096 May 29  2020 local
drwxr-xr-x    3 root     root          4096 May 29  2020 lock
drwxr-xr-x    2 root     root          4096 May 29  2020 log
drwxr-xr-x    1 root     root          4096 Mar 12 13:37 mail
drwxr-xr-x    2 root     root          4096 May 29  2020 opt
lrwxrwxrwx    1 root     root             4 May 29  2020 run -> /run
drwxr-xr-x    3 root     root          4096 May 29  2020 spool
drwxr-xr-x    1 root     root          4096 May 29  2020 tmp
1f833b916b14:~/home/blinky$ ls -la /var/mail/
total 12
drwxr-xr-x    1 root     root          4096 Mar 12 13:37 .
drwxr-xr-x    1 root     root          4096 Aug 28  2020 ..
-rw-rw----    1 blinky   mail             0 Mar 12 13:37 blinky
```

but its an empty file...

this is the funny file which made funny things:

```
1f833b916b14:~$ cat /etc/profile.d/alias.sh 
alias bash='echo "you are not a bash brother" && exit'
alias sh='echo "one does not simply sh into Mordor" && exit'
alias zsh='exit'
alias ash='exit'
alias ls='/bin/ls /home/blinky | /bin/grep -v home #'
alias cd=/bin/true
alias pwd='echo /home/blinky #'
alias cat='echo "|\---/|" && echo "| o_o |  meow!" && echo " \___/" #'
alias more='echo "|\---/|" && echo "| o_o |  meow!" && echo " \___/" #'
alias less='echo "|\---/|" && echo "| o_o |  meow!" && echo " \___/" #'
alias grep='echo "" #'
alias egrep='echo "" #'
alias fgrep='echo "" #'
alias vi='echo "command not found: vi" #'
alias vim='echo "command not found: vim" #'
alias zip='echo "command not found: zip" #'
alias fzip='/usr/bin/zip -P "/bin/funzip"'
alias python='echo "command not found: python" #'
alias java='echo "command not found: java" #'
alias find='echo "command not found: find" #'
alias id='echo "uid=0(root) gid=0(root) groups=0(root)"'
alias whoami='echo "you are you"
```

after i saw this, i had a bad guess:

```
alias fzip='/usr/bin/zip -P "/bin/funzip"'
```

the password is probably what is here... i tried it and jeah... the password for the zip is `/bin/funzip`

in the zip was a textfile with the flag:

# FLAG: he2023{al1asses-4-fUn-and-pr0fit}
