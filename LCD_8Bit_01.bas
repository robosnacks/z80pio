NEW

1000 rem Testprogram 8255 with LCD HD44780
1010 gosub 10000	:rem Init LCD

2000 rem Main-Loop
2010 tx$="Z80 Basic 8255"
2020 gosub 10300
2030 for i=1 to 2000:next i
2040 gosub 10200
2050 for i=1 to 2000:next i
2055 gosub 10170
2060 goto 2010

10000 rem Init LCD
10010 Out 7,128 	:rem 8255 all ports Output
10020 out 4,0           :rem port a, db0 - db7 to 0
10040 out 6,0           :rem E = low, R/W = write, RS = command

10050 for I=1 to 4
10060 	out 4,56 	:rem 8Bit 38h   00111000b
10070 	out 6,128       :rem 80h        10000000b
10080 	out 6,0
10090 next i

10100 out 4,6 		:rem Increment 
10110 out 6,128         :rem 80h        10000000b
10120 out 6,0

10130 out 4,12 		:rem Cursor on, Display on 
10140 out 6,128         :rem 80h        10000000b
10150 out 6,0

10160 gosub 10200	:rem Clear display
10170 for i=1 to 5
10172 	b=i-1
10174 	c=2^b
10176 	out 5,c		:rem LED on, only for test
10177	for j=1 to 200:next j
10178 next i
10199 return


10200 rem Clear display
10210 out 4,1 		
10220 out 6,128
10230 out 6,0
10290 return


10300 rem Output string tx$ to LCD
10310 l=len(tx$)
10320 for i=1 to l
10330 	t=asc(mid$(tx$,i,1))
10340	out 4,t
10350	out 6,160      :rem A0h         10100000b 
10360 	out 6,0
10370 next
10390 return

