### 8255 ports
- Port A @ 04H
- Port B @ 05H
- Port C @ 06H
- Ctrl @ 07H

Outputting 80H to Ctrl sets all ports to ouput\
Port A is connected to LCD data pins 7-14\
The 4 LSB's of Port B are connected to the 4 LEDS.\
The 3 MSB's of Port C are connected to LCD pins 3-6\
i.e. bit 7 = E, bit 6 = R/W, bit 5 = RS
### LCD pins

**Pin1 (VSS)**: Ground pin of the LCD module. (0V is given to this pin.)\
**Pin2 (VDD)**: Power to LCD module (+5V supply is given to this pin.)\
**Pin3 (VEE)**: Contrast adjustment pin. This is done by connecting the ends of a 10K potentiometer to +5V and ground and then connecting the slider pin to the VEE pin. The normal setting is between 0.4V and 0.9V.\
**Pin4 (RS)**: RS = 1 = data register, RS = 0 = command register\
**Pin5 (R/W)**: R/W = 1 = read mode, R/W = 0 = write mode\
**Pin6 (E)**: high/low pulse enables LCD module\
**Pin7 (DB0) to Pin14 (DB7)**: The data pins.\
**Pin15(LED+)**: Anode of the back-light LED.\
**Pin16(LED-)**: Cathode of the back-light LED.

0x01 	Clear the display screen\
0x06 	Shift the cursor right\
0x0C 	Display on, cursor off\
0x0E 	Display on, cursor blinking\
0x80 	Force the cursor to the beginning of the 1st line\
0xC0 	Force the cursor to the beginning of the 2nd line\
0x10 	Shift cursor position to the left\
0x14 	Shift cursor position to the right\
0x18 	Shift entire display to the left\
0x1C 	Shift entire display to the right\
0x38 	2 lines, 5×8 matrix, 8-bit mode\
0x28 	2 lines, 5×8 matrix, 4-bit mode\
0x30 	1 line, 8-bit mode

0x20 	1 line, 4-bit mode
