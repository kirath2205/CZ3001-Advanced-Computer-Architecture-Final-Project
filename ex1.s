.data
a: .space 96
b: .word 10,11,12,13,0,1,10,11,12,13,0,1
c: .word 1,2,3,4,5,6,1,2,3,4,5,6
.text
;initialize registers
daddi r1,r0,a
daddi r2,r0,b
daddi r3,r0,c
daddi r4,r0,12
Loop: lw r5,0(r2) ; element of b
lw r6,0(r3) ; element of c
dadd r7,r5,r6 ; a[i] = b[i] + c[i];
sw r7,0(r1) ; store value in a[i]
daddi r1,r1,8 ; increment memory pointers
daddi r2,r2,8
daddi r3,r3,8
daddi r4,r4,-1 ; i++
bnez r4,Loop
end: halt