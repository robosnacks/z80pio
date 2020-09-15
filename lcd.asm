        output "lcd.com",t
        org     8000h

porta   equ     04h
portb   equ     05h
portc   equ     06h
crtl    equ     07h

initlcd ld      a,80h
        out     crtl,a
        ld      a,0
        out     porta,a
        out     portc,a
        
viiibit ld      b,4
loop     ld      a,38h
        out     porta, a
        ld      a,80h
        out     portc, a
        sub     a
        out     portc, a
        djnz    loop

inc     ld      a,6
        out     porta, a
        ld      a,80h
        out     portc,a
        sub     a
        out     portc,a

dispon  ld      a,0ch
        out     porta,a
        ld      a,80h
        out     portc,80h
        sub     a
        out     portc,a
        

        ret
        
phrase  db      "Hello, World"
        outend