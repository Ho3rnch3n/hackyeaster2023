from PIL import Image

with open("data.txt","r") as f:
	data = f.readlines()

colors = []

for line in data:
	color = int(line.strip().split(" ")[3].split(":")[1])
	colors.append(color)

im = Image.new(mode="RGB", size=(21, 21))

col_num = 0

for x in range(21):
	for y in range(21):
		if colors[col_num] % 2 == 1:
			im.putpixel((y,x), (0,0,0))
		else:
			im.putpixel((y,x), (255,255,255))
		col_num+=1

im = im.resize((100,100), resample = Image.Resampling.NEAREST)
im.save("solution.png")
