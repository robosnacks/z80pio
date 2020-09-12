        output "counter.com",t
        org     8000h

piodrb  equ     19h     ;data port of pio channel a
piocrb  equ     1bh     ;control port of pio channel a
blank   equ     0ffh    ;for common anode display

        ld      a,00001111b     ;make port b output
        out     (piocrb),a

begin   ld      a,9
count   out     (piodrb),a
        call    delay2
        call    delay2
        dec     a
        jp      nz,count
        jr      begin


delay2  ld      bc,0
de2     cpi
        nop
        nop
        ret     po
        jr      de2

        outend