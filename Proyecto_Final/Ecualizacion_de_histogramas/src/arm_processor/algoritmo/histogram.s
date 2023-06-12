.global _start
.section .data
I:
    .byte 4, 4, 4, 4
    .byte 3, 4, 5, 4
    .byte 3, 5, 5, 5
    .byte 3, 4, 5, 4

.section .text
_start:
	@ paso 1
    ldr r0, =I
	@ paso 2
    bl get_histogram
    ldr r0, =histogram
	@ paso 3
    bl get_cumulative_freq
    ldr r0, =cuf
	@ paso 4
    bl normalize_cumulative_freq
	@ paso 6
	ldr r0, =I
	ldr r1, =normalized_cuf
	ldr r2, =Ip
	bl equalize_image
	@ fin del programa
    mov r7,#1
    swi 0
	
get_histogram:
    /* Suponemos que r0 contiene la dirección base de la imagen en memoria */
    /* r1 será nuestro contador de fila, r2 será nuestro contador de columna */
    /* r3 será el índice del histograma */

    /* Inicializar el histograma a cero */
    ldr r4, =histogram
    mov r5, #0
    mov r6, #8
init_histogram:
    strb r5, [r4], #1
    subs r6, r6, #1
    bne init_histogram

    /* Procesar la imagen */
    mov r1, #0
process_rows:
    mov r2, #0
process_cols:
    ldrb r3, [r0, r2]  /* r3 = image[r1][r2] */
    ldrb r5, [r4, r3]  /* r5 = histogram[r3] */
    add r5, r5, #1
    strb r5, [r4, r3]  /* histogram[r3] = r5 */
    add r2, r2, #1
    cmp r2, #4
    blt process_cols
    add r0, r0, #4
    add r1, r1, #1
    cmp r1, #4
    blt process_rows

    /* Finalizar */
    bx lr

get_cumulative_freq:
    /* r0 ahora es el histograma */
    ldr r4, =cuf
    mov r5, #0
    mov r6, #0
    ldrb r3, [r0, r6]  /* r3 = histogram[r6] */
calculate_cuf:
    add r5, r5, r3
    strb r5, [r4, r6]  /* cuf[r6] = r5 */
    add r6, r6, #1
    cmp r6, #8
    bge end_cuf
    ldrb r3, [r0, r6]
    b calculate_cuf
end_cuf:
    bx lr
	

normalize_cumulative_freq:
    /* r0 ahora es la frecuencia acumulativa (cuf) */
    ldr r4, =normalized_cuf
    mov r6, #7
    ldrb r1, [r0, #7]  /* r1 = cuf[7], el total de píxeles */
    mov r7, #7  /* valor constante para la multiplicación */
normalize:
    ldrb r2, [r0, r6]
    mul r2, r2, r7
    bl divide
    strb r0, [r4, r6]  /* normalized_cuf[r6] = r0 (resultado de la división) */
    subs r6, r6, #1
    bpl normalize
    bx lr

divide:
    /* divide r2 por r1, resultado en r0 */
    /* Este es un desplazamiento muy simple, que siempre redondea hacia abajo. */
    mov r0, r2, LSR #3  /* Desplaza r2 tres bits a la derecha y guarda el resultado en r0. */
    bx lr  /* devuelve el control al llamador */


equalize_image:
	/* r0 = dirección base de la imagen original */
	/* r1 = dirección base del mapeo (normalized_cuf) */
	/* r2 = dirección base de la nueva imagen (Ip) */
	mov r3, #0
equalize_rows:
	mov r4, #0
equalize_cols:
	ldrb r5, [r0, r4]  /* r5 = original image[r3][r4] */
	ldrb r5, [r1, r5]  /* r5 = mapping[r5] */
	strb r5, [r2, r4]  /* Ip[r3][r4] = r5 */
	add r4, r4, #1
	cmp r4, #4
	blt equalize_cols
	add r0, r0, #4
	add r2, r2, #4
	add r3, r3, #1
	cmp r3, #4
	blt equalize_rows
	bx lr



histogram: .skip 32
cuf:       .skip 32
normalized_cuf: .skip 32
.section .bss
Ip: .skip 32