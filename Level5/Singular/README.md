# Description

# Singular

Wow, so many flags!

Find the real flag, which is unique in multiple ways.

## Hints

This one can be solved with linux commands, with a one-liner.

# Solution

first taking look at the top of the file

```
$ head singular.txt 
he2023{owner_state_edge_include}
he2023{opportunity_ahead_number_yard}
he2023{hope_card_high_something}
he2023{guess_billion_Mr_for}
he2023{much_half_responsibility_at}
he2023{interesting_around_trouble_subject}
he2023{author_fire_read_newspaper}
he2023{law_yeah_product_everyone}
he2023{later_other_bill_school}
he2023{generation_democratic_career_source}
```

so lots of possible flags...
well i guess the flag is the one, where each word is not in any other flag in the file

to challenge myself i want to actually do it with linux commands, else i would have used python

first i extracted only the actual part of the flag:

```
$ head singular.txt | awk -F "[{}]" '{print $2}'
owner_state_edge_include
opportunity_ahead_number_yard
hope_card_high_something
guess_billion_Mr_for
much_half_responsibility_at
interesting_around_trouble_subject
author_fire_read_newspaper
law_yeah_product_everyone
later_other_bill_school
generation_democratic_career_source
```

after that i wrote every word in a single line:

```
$ head singular.txt | awk -F "[{}]" '{print $2}' | tr _ "\n"
owner
state
edge
include
opportunity
ahead
number
yard
hope
card
high
something
guess
billion
Mr
for
much
half
responsibility
at
interesting
around
trouble
subject
author
fire
read
newspaper
law
yeah
product
everyone
later
other
bill
school
generation
democratic
career
source
```

and as last step filter out the uniqe ones:

well nothing is left...

```
$ cat singular.txt | awk -F "[{}]" '{print $2}' | tr _ "\n" | sort | uniq -u | wc
      0       0       0
```

after running this on the whole flag lines i noticed that some lines have a unique start word, so maybe the position of the word also matters...

```
$ cat singular.txt | awk -F "[{}]" '{print $2}' | sort | uniq -u | wc
```

also trying it with python now but didn't help... filtering only the flags with unique first words then second and so on... did not help
