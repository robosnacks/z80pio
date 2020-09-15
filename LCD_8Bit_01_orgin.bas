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
10010 Out 3,128 	:rem 8255 all ports Output
10020 out 0,0
10040 out 2,0

10050 for I=1 to 4
10060 	out 0,56 	:rem 8Bit 
10070 	out 2,128
10080 	out 2,0
10090 next i

10100 out 0,6 		:rem Increment 
10110 out 2,128
10120 out 2,0

10130 out 0,12 		:rem Cursor on, Display on 
10140 out 2,128
10150 out 2,0

10160 gosub 10200	:rem Clear display
10170 for i=1 to 5
10172 	b=i-1
10174 	c=2^b
10176 	out 1,c		:rem LED on, only for test
10177	for j=1 to 200:next j
10178 next i
10199 return


10200 rem Clear display
10210 out 0,1 		
10220 out 2,128
10230 out 2,0
10290 return


10300 rem Output string tx$ to LCD
10310 l=len(tx$)
10320 for i=1 to l
10330 	t=asc(mid$(tx$,i,1))
10340	out 0,t
10350	out 2,160
10360 	out 2,0
10370 next
10390 return

