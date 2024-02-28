#!/bin/bash

#################
# Author - Akash
# Version - 2
#################

sudo yum install -y ansible
sudo yum install -y yum-utils shadow-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform
sudo yum -y install pip
pip install boto3


# Import private key to id_rsa
cat << EOF > /home/ec2-user/.ssh/id_rsa
-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEAg7TSi6OUP7lZwk6pIydnalbKueIzZ80QtNXBmi904ZfBBXC8
yjaReHt4xjq5L4tLgT1J0TdcDzq5dIJL4xhdcWA0KL4AJZbGRbiWcYNf8jrvUTXV
FGdxeoJuhSahgHHSTvT7dl3ByRJNtTvuXEsj2YQDkcIG3IIuAiD4/y6HTfA4YxQ0
fG2GpLrxsfeSkJ+0gb1uwzz2hJLamSznpj2Xn1Fxb48JH1Sa98Q+DcSNTR7t12Ly
87nyVNY1SfxyEroghTOsBAvPbd8p2sGEqtqF7Cjbiw6K3EcuB/qMm0NaPAQO8QkE
+pbSs/Lm68z0b2Fz5P5OWtQJNjGz1vIlAqBNHwIDAQABAoIBADEmZMAZrnRNbjK1
+iaVSOGFPCg8QuTEwSxK7PHmLd8WK8Ek/j8UOBtXMI4BUiRs/iNfxNFfsGo6hwT0
ru8zo4Nw3GYr6ZAdgSZ5qSL5XO/fkHmk9jykEdQfIrFr5i8xysMOZ10Xxf6MZxVw
JRaqL9m3i0F0v+zAY/0FYwaPzYyGxDO6IiDUIhE85jakTIuxIwaP8aqgKliDw0rA
NmRf0UfpnfsTR+KUvwjHQBHrDe9ZcXtlhyooVESx9Dn+lg1Gv1Wj5cx5Qv2cgzVZ
U4+oELhpmci5iezCrpcNGxklGY932R7axJ6Xi2bLin1VGQkn1AtncJo+yY3cPz/r
0PNlx8ECgYEAyy3KbMJRlJVdABL+gLVaHltK6FG8dbnpB1ifUsO2deuJWHS3l+K4
9DmcIoZKyjM3MyQkV/LHPVI55F7/fRA2ROVL8uxMtvm55rnCJVPgk3rBeoouaj6P
VPhHytyjvjdb+bAk4opvWouXDPY7mLV/8gXTdRIl7eG3NLeCuatqNyECgYEApfJN
2n7PEwyam52V+91eXZ6CGSMn1Z9WfyRBKG/dxgWFsZ4z6Ux4S/GJtOp+1x76V44b
NaF1sOggOflZ7XbcnVmtYkXNW4+rXy7PEQifJjhPwIZqIfPpEno/pVK5VLAOH4EO
ozF2p6pXzCzRnQ+Gs3FUEbIdGBwXzHw3lnlxPD8CgYA6C5vwFFfALifClKqW1Lip
QYWV93vy2ikDy0LBH16qM58qYTXuM3yJcUf06Q7G03jqqGGlqptXHn2hi65L6WzH
pAZdoTqNb6y3iMw5Y8wd9gz+WCnIepTyPngsMXqqJiClpbfz7H7BjG2b62C9UOT7
nMR7hrLFUh3H9sFnD9ypYQKBgG3vtUYQBm1PR0nav1cpU2/gJ74xfR1Xvvzh7sy0
N48Nb4G5Fhjz0So2rQ0O4NLxMdY5Tatc+NQnI9pkaAAaY5NWqrfVGHQVHOok34cg
WBcA7UzVf5BYv0q/dFS5FhCVxfV3EVRp23q+LgYUlxVfCNTuOkyy2/Vx/w44KLdm
Yu8PAoGAbqMiR7nfbiePohdvCsix7Xd+amcDNa/gacQ0RhqI5Ij/4IGMf2ZAPIiE
VtY8w7iwJMl7fnxxDObrh38WkkuHUwj4NVJ4r+sl4i2ZBYHOExLtNOABBxh6K9un
VkamSCJB4pISpDmlxTCr9QL3MgGNb9WlfLAtPLJM5Al455grHlI=
-----END RSA PRIVATE KEY-----
EOF

chmod 400 /home/ec2-user/.ssh/id_rsa




