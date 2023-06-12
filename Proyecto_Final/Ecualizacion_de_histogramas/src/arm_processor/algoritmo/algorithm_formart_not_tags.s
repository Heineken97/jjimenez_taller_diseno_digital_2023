mov r0, #0xdfff
bl #48
mov r0, #0xbfff
bl #128
mov r0, #0xcfff
bl #176
mov r0, #0xdfff
mov r1, #0xefff
mov r2, #0xffff
bl #228
mov r7,#1
swi 0
mov r4, #0xbfff
mov r5, #0
mov r6, #8
strb r5, [r4], #1
subs r6, r6, #1
bne #64
mov r1, #0
mov r2, #0
ldrb r3, [r0, r2]  
ldrb r5, [r4, r3] 
add r5, r5, #1
strb r5, [r4, r3] 
add r2, r2, #1
cmp r2, #4
blt #80
add r0, r0, #4
add r1, r1, #1
cmp r1, #4
blt #76
bx lr
mov r4, #0xcfff
mov r5, #0
mov r6, #0
ldrb r3, [r0, r6] 
add r5, r5, r3
strb r5, [r4, r6]
add r6, r6, #1
cmp r6, #8
bge #172
ldrb r3, [r0, r6]
b #168
bx lr
mov r4, #0xefff
mov r6, #7
ldrb r1, [r0, #7]
mov r7, #7 
ldrb r2, [r0, r6]
mul r2, r2, r7
bl #220
strb r0, [r4, r6] 
subs r6, r6, #1
bpl #192
bx lr
mov r0, r2, LSR #3  
bx lr
mov r3, #0
mov r4, #0
ldrb r5, [r0, r4]  
ldrb r5, [r1, r5] 
strb r5, [r2, r4] 
add r4, r4, #1
cmp r4, #4
blt #236
add r0, r0, #4
add r2, r2, #4
add r3, r3, #1
cmp r3, #4
blt #232
bx lr