.data
a: .space 48
b: .word 10,11,12,13,0,1
c: .word 1,2,3,4,5,6
.text
;initialize registers
daddi r1,r0,a
daddi r2,r0,b
daddi r3,r0,c
daddi r4,r0,3

Loop: lw r5,0(r2) ; element of b
lw r6,0(r3) ; element of c
lw r8,8(r2) ; element 2 of b
lw r9,8(r3) ; element 2 of c
daddi r2,r2,16
daddi r3,r3,16

dadd r7,r5,r6 ; a[i] = b[i] + c[i];
dadd r10,r8,r9 ; 2 a[i] = b[i] + c[i];

daddi r4,r4,-1 ; i++
sw r7,0(r1) ; store value in a[i]
sw r10,8(r1) ; store value in a[i]

daddi r1,r1,16 ; increment memory pointers

bnez r4,Loop
end: halt