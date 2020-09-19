        output "lcd.com",t
        org     8000h

porta   equ     04h
portb   equ     05h
portc   equ     06h
crtl    equ     07h

;initialise LCD
;set LCD to 8 bit operation
;increment
;cursor on and display on
;clear display
;display string

initlcd ld      a,80h
        out     crtl,a
        sub     a
        out     porta,a
        out     portc,a
        
lcdmode ld      a,38h
        out     porta, a
        call    pulse
       

increm  ld      a,6
        out     porta, a
        call    pulse

dispon  ld      a,0ch
        out     porta,a
        call    pulse

cls     ld      a,1
        out     porta,a
        call    pulse 
        
string  ld      hl,phrase
print   ld      a,(hl)
        cp      0
        jp      z,finish
        out     porta,a
        ld      a,0a0h
        out     portc,a
        
        push    af,bc,de,hl
        call    delay1
        pop     hl,de,bc,af
        sub     a
        out     portc,a
        inc     hl
        jp      print

finish  ret

pulse   ld      a,80h
        out     portc, a
       
        push    af,bc,de,hl
        call    delay1
        pop     hl,de,bc,af
        sub     a
        out     portc, a
        ret

delay1  ld      bc,4a38h
de1     cpi
        nop
        nop
        ret     po
        jr      de1 
        
phrase  db      "Hello, Alistair!", 0
        outend