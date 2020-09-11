        output "traffic.com",t

        org     8000h
pioda   equ     18h     ;data port of pio channel a
pioca   equ     1ah     ;control port of pio channel a

start   ld      a,0fh
        out     (pioca),a       ;pio port a output mode
begin   ld      a,01h
        out     (pioda),a       ;green led light
        call    delay           ;delay 5 sec
        ld      b,4  
flash   push    bc     
        ld      a,0
        out     (pioda),a       ;flash 4 sec
        call    delay1
        ld      a,01
        out     (pioda),a       
        call    delay1
        pop     bc
        djnz    flash
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ld      a,02
        out     (pioda),a       ;yellow led light
        call    delay2          ;1.725 sec
        ld      a,04
        out     (pioda),a       ;red led light
        call    delay           ;5 sec
        jp      begin

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;       delay 4 * 1.25 sec = 5 sec subroutine
;       0.56 us * (16 + 4 + 4 + 10) * 65536 = 1.25sec
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
delay   ld      d,4     ;7t
delx    ld      bc,0    ;10t
de0     cpi             ;16t
        nop             ;4t
        nop             ;4t
        jp      pe,de0  ;10t
        dec     d
        jr      nz,delx
        ret    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;       delay 0.5 sec subroutine
;       0.56 us * (16 + 4 + 4 + 11 + 12) *19000 = 0.5sec
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
delay1  ld      bc,4a38h
de1     cpi
        nop
        nop
        ret     po
        jr      de1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;       delay 1.725 sec subroutine
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
delay2  ld      bc,0
de2     cpi
        nop
        nop
        ret     po
        jr      de2
         
        outend