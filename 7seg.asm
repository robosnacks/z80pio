        output "7seg.com",t

        org     8000h
piodrb  equ     19h     ;data port of pio channel a
piocrb  equ     1bh     ;control port of pio channel a
blank   equ     0ffh    ;for common anode display

        ld      a,00001111b     ;make port b output
        out     (piocrb),a
        ld      b,blank         ;get blank code
        ld      a,(data)        ;get data
        cp      10              ;is data a decimal digit?
        jr      nc,dsply        ;no, display blanks
        ld      de,sseg         ;get base address of 7-seg
                                ;table
        ld      h,0             ;make data into 16-bit index
        ld      l,a
        add     hl,de           ;access element in table
        ld      b,(hl)          ;get 7-seg code
dsply   ld      a,b
        out     (piodrb),a      ;send code to display
        ret

data    db      05
sseg    db              
        outend