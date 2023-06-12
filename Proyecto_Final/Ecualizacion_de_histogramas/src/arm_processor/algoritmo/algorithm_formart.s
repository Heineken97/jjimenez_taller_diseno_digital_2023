ldr r0, 0x0000f000
bl get_histogram
ldr r0, 0x000ff000
bl get_cumulative_freq
ldr r0, 0x00fff000
bl normalize_cumulative_freq
ldr r0, 0x0000f000
ldr r1, 0x0ffff000
ldr r2, 0xfffff000
bl equalize_image
mov r7,#1
swi 0
get_histogram ldr r4, 0x000ff000
mov r5, #0
mov r6, #8
init_histogram strb r5, [r4], #1
subs r6, r6, #1
bne init_histogram
mov r1, #0
process_rows mov r2, #0
process_cols ldrb r3, [r0, r2]  
ldrb r5, [r4, r3] 
add r5, r5, #1
strb r5, [r4, r3] 
add r2, r2, #1
cmp r2, #4
blt process_cols
add r0, r0, #4
add r1, r1, #1
cmp r1, #4
blt process_rows
bx lr
get_cumulative_freq ldr r4, 0x00fff000
mov r5, #0
mov r6, #0
ldrb r3, [r0, r6] 
calculate_cuf add r5, r5, r3
strb r5, [r4, r6]
add r6, r6, #1
cmp r6, #8
bge end_cuf
ldrb r3, [r0, r6]
b calculate_cuf
end_cuf bx lr
normalize_cumulative_freq ldr r4, 0x0ffff000
mov r6, #7
ldrb r1, [r0, #7]
mov r7, #7 
normalize ldrb r2, [r0, r6]
mul r2, r2, r7
bl divide
strb r0, [r4, r6] 
subs r6, r6, #1
bpl normalize
bx lr
divide mov r0, r2, LSR #3  
bx lr
equalize_image mov r3, #0
equalize_rows mov r4, #0
equalize_cols ldrb r5, [r0, r4]  
ldrb r5, [r1, r5] 
strb r5, [r2, r4] 
add r4, r4, #1
cmp r4, #4
blt equalize_cols
add r0, r0, #4
add r2, r2, #4
add r3, r3, #1
cmp r3, #4
blt equalize_rows
bx lr