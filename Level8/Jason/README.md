# Description

# Jason

Jason has implemented an information service.

He has hidden a flag in it, can you find it?

Connect to the server:

 - nc ch.hackyeaster.com 2304

Note: The service is restarted every hour at x:00.

# Solution

nothing more, no binary no nothing...

```
$ nc ch.hackyeaster.com 2304
Hi, I am Jason!
Tell me what you want to know about me!
----------------------
> enter "name", "surname", "street", "city", "country", or "q" to quit
> name
Result: "Jason"
> enter "name", "surname", "street", "city", "country", or "q" to quit
> {{asdf}}
Invalid input!
> enter "name", "surname", "street", "city", "country", or "q" to quit
> asdf
Result: null
> enter "name", "surname", "street", "city", "country", or "q" to quit
>      
Something went wrong.
> enter "name", "surname", "street", "city", "country", or "q" to quit
> {asdf}
Invalid input!
> enter "name", "surname", "street", "city", "country", or "q" to quit
> !
Something went wrong.
> enter "name", "surname", "street", "city", "country", or "q" to quit
> !asdf
Invalid input!
> enter "name", "surname", "street", "city", "country", or "q" to quit
> sur
Something went wrong.
> enter "name", "surname", "street", "city", "country", or "q" to quit
> name
Result: "Hamstat"
> enter "name", "surname", "street", "city", "country", or "q" to quit
> street
Result: "100 Kent St"
> enter "name", "surname", "street", "city", "country", or "q" to quit
> city
Result: "Sydney"
> enter "name", "surname", "street", "city", "country", or "q" to quit
> country
Result: "Australia"
> enter "name", "surname", "street", "city", "country", or "q" to quit
> q
Bye!
```

so it probably is about json deserialization
