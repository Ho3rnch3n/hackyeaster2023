from PIL import Image
from pyzbar.pyzbar import decode
import os

#x = 0

def crop_whole(im):
	imgwidth, imgheight = im.size

	#imgwidth -= 2400 # right spacing
	#imgheight -= 2400 # bottom spacing

	height = 69 # height of one sub qrcode
	width = 69 # width of one sub qrcode

	for j in range(0,imgheight,height):
		for i in range(0, imgwidth, width):
			box = (i, j, i+width, j+height)
			a = im.crop(box)
			yield a
			#a.save(os.path.join("out_whole",f"{j}_{i}.png"))
	return

flag = b""

im = Image.open("quilt.png")
for next_part in crop_whole(im):
	result = decode(next_part)
	#print(len(result))
	flag += result[0].data

print(flag)
