brctl addbr brNSG-C1
brctl addbr brNSG-C2
ifconfig brNSG-C1 up
ifconfig brNSG-C2 up
brctl addif brNSG-C1 eno2.204
brctl addif brNSG-C2 eno2.205

brctl addbr brNSG-C3
brctl addbr brNSG-C4
ifconfig brNSG-C3 up
ifconfig brNSG-C4 up
brctl addif brNSG-C3 eno2.233
brctl addif brNSG-C4 eno2.234

brctl addbr brNSG-E1
brctl addbr brNSG-E2
ifconfig brNSG-E1 up
ifconfig brNSG-E2 up
brctl addif brNSG-E1 eno2.207
brctl addif brNSG-E2 eno2.208

brctl addbr brNSG-E2001
brctl addbr brNSG-E2002
ifconfig brNSG-E2001 up
ifconfig brNSG-E2002 up
brctl addif brNSG-E2001 eno2.210
brctl addif brNSG-E2002 eno2.211

brctl addbr brNSG-E2003
brctl addbr brNSG-E2004
ifconfig brNSG-E2003 up
ifconfig brNSG-E2004 up
brctl addif brNSG-E2003 eno2.236
brctl addif brNSG-E2004 eno2.237

brctl addbr brNSG-E3001
brctl addbr brNSG-E3002
ifconfig brNSG-E3001 up
ifconfig brNSG-E3002 up
brctl addif brNSG-E3001 eno2.213
brctl addif brNSG-E3002 eno2.214

brctl addbr brNSG-X2001
brctl addbr brNSG-X2002
ifconfig brNSG-X2001 up
ifconfig brNSG-X2002 up
brctl addif brNSG-X2001 eno2.216
brctl addif brNSG-X2002 eno2.217

brctl addbr brNSG-X1
brctl addbr brNSG-X2
ifconfig brNSG-X1 up
ifconfig brNSG-X2 up
brctl addif brNSG-X1 eno2.219
brctl addif brNSG-X2 eno2.220

brctl addbr brNSG-X3
brctl addbr brNSG-X4
ifconfig brNSG-X3 up
ifconfig brNSG-X4 up
brctl addif brNSG-X3 eno2.221
brctl addif brNSG-X4 eno2.222

brctl addbr brNSG-E2061
brctl addbr brNSG-E2062
ifconfig brNSG-E2061 up
ifconfig brNSG-E2062 up
brctl addif brNSG-E2061 eno2.224
brctl addif brNSG-E2062 eno2.225

brctl addbr brNSG-E3061
brctl addbr brNSG-E3062
ifconfig brNSG-E3061 up
ifconfig brNSG-E3062 up
brctl addif brNSG-E3061 eno2.227
brctl addif brNSG-E3062 eno2.228

brctl addbr brNSG-E2021
brctl addbr brNSG-E2022
ifconfig brNSG-E2021 up
ifconfig brNSG-E2022 up
brctl addif brNSG-E2021 eno2.230
brctl addif brNSG-E2022 eno2.231