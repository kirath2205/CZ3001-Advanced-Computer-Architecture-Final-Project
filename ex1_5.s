.data
a: .space 96
b: .word 10,11,12,13,0,1,1,0,13,12,11,10
c: .word 1,2,3,4,5,6,6,5,4,3,2,1 

.text
;initialize registers
daddi r1,r0,a
daddi r2,r0,b
daddi r3,r0,c
daddi r4,r0,4

Loop: l.d f5,0(r2) ; element of b
l.d f6,0(r3) ; element of c
l.d f8,8(r2) ; element 2 of b
l.d f9,8(r3) ; element 2 of c
l.d f11,16(r2) ; element 3 of b
l.d f12,16(r3) ; element 3 of c
daddi r2,r2,24
daddi r3,r3,24

add.d f7,f5,f6 ; a[i] = b[i] + c[i];
add.d f10,f8,f9 ; a[i+1] = b[i] + c[i];
add.d f13,f11,f12 ; a[i+2] = b[i] + c[i];

daddi r4,r4,-1 ; i++
s.d f7,0(r1) ; store value in a[i]
s.d f10,8(r1) ; store value in a[i+
s.d f13,16(r1) ; store value in a[i+2]

daddi r1,r1,24 ; increment memory pointers

bnez r4,Loop
end: halt