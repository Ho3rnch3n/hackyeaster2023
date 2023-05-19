import math

with open("intercepted_message.txt","r") as f:
	data = f.read().split("\n")[:-1]
	numbers = []
	for x in data:
		next = x.strip().split(" ")
		numbers.extend(next)

numbers = list(map(int,numbers))


numbers_gcd = math.gcd(*numbers)

print("Found gcd: " + str(numbers_gcd))

text = ""

for number in numbers:
	text += chr(number//numbers_gcd)

print(text)
