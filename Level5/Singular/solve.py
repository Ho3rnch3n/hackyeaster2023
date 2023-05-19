from collections import Counter

with open("singular.txt","r") as f:
	data = f.readlines()

all_flags = []

for flag in data:
	raw_flag = flag.strip().replace("he2023{","").replace("}","")
	all_flags.append(raw_flag)
blub = set(all_flags)

all_flags = Counter(all_flags)
all_flags = [k for k,v in all_flags.items() if v == 1]

for flag in blub:
	cap = sum(1 for c in flag if c.isupper())
	if cap >= 2:
		print(cap)
		print(flag)
		print("----")



'''
first_words = []

for flag in all_flags:
	part_one = flag.split("_")[0]
	first_words.append(part_one)

unique_first_words = Counter(first_words)

unique_first = [k for k,v in unique_first_words.items() if v == 1]

next_flags = []

for flag in all_flags:
	part_one = flag.split("_")[0]
	if part_one in unique_first:
		next_flags.append(flag)

flags = next_flags

#### second word

first_words = []

for flag in all_flags:
	part_one = flag.split("_")[1]
	first_words.append(part_one)

unique_first_words = Counter(first_words)

unique_first = [k for k,v in unique_first_words.items() if v == 1]

next_flags = []

for flag in flags:
	part_one = flag.split("_")[1]
	if part_one in unique_first:
		next_flags.append(flag)

flags = next_flags

#### third word

first_words = []

for flag in all_flags:
	part_one = flag.split("_")[2]
	first_words.append(part_one)

unique_first_words = Counter(first_words)

unique_first = [k for k,v in unique_first_words.items() if v == 1]

next_flags = []

for flag in flags:
	part_one = flag.split("_")[2]
	if part_one in unique_first:
		next_flags.append(flag)

flags = next_flags

### fourth word

first_words = []

for flag in all_flags:
	part_one = flag.split("_")[3]
	first_words.append(part_one)

unique_first_words = Counter(first_words)

unique_first = [k for k,v in unique_first_words.items() if v == 1]

next_flags = []

for flag in flags:
	part_one = flag.split("_")[3]
	if part_one in unique_first:
		next_flags.append(flag)

flags = next_flags

for flag in flags:
	print("hv2023{" + flag + "}")
'''
