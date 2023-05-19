# Description

# Going Round

I got a flag, but it's encrypted somehow:

```
ip0232j{1t_x_v0z4b3bm__v4xvq}a
```

It was created using the following service:

http://ch.hackyeaster.com:2305

Note: The service is restarted every hour at x:00.

# Solution

so looks like a transposition cipher + a substitution cipher (but only for `[a-z]`)

the transposition looks like that each 2 characters are exchanged so lets try to unmangle this:

```
pi2023{jt1x_v_z0b4b3_mv_x4qva}
```

and now lets try some rot!

```
ha2023{bl1p_n_r0t4t3_en_p4ins}
```

well looks like something but there is `ha` not `he` ?! (rot was 18)

so i tried a second rot so the e is right (rot 22) - i thought maybe every second char is rot shifted in a different way, so i moved every second char to the other solution:

```
le2023{fp1t_r_v0x4x3_ir_t4mrw}
```

the two shifts combined look like a valid flag!

```
he2023{fl1p_n_r0t4t3_in_p4irs}
```

# FLAG: he2023{fl1p_n_r0t4t3_in_p4irs}
