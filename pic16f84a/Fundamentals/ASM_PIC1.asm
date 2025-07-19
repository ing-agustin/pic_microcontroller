;**************************************************************************
; Title: Fundamentals level - Arithmetic and Logic Operations on PIC16F84A
;**************************************************************************

            #INCLUDE "p16f84a.inc"    ; Include PIC16F84A register definitions
            #INCLUDE "Conf.inc"       ; Include configuration and definitions

            LIST p=16f84a            ; Processor directive for assembler

;**************************************************************************
            __CONFIG _WDT_OFF         ; Disable Watchdog Timer
;**************************************************************************

            ; Define memory locations for variables
            V1 EQU 0x10              ; Variable 1
            V2 EQU 0x11              ; Variable 2
            V3 EQU 0x12              ; Variable 3
            V4 EQU 0x13              ; Variable 4
            V5 EQU 0x14              ; Variable 5
            V6 EQU 0x15              ; Variable 6
            AUX EQU 0x16             ; Auxiliary variable

;**************************************************************************
            ORG 0x000                ; Program start address
            goto Main                ; Jump to main program

            ORG 0x004                ; Interrupt vector address
            ; No interrupt service routine defined here

;**************************************************************************
; SUB_SUMAR - Sum W and V1, store result in V1
;**************************************************************************
SUB_SUMAR
            movlw .2                 ; Load literal 2 into W
            movwf V1                 ; Store W in V1

            movlw .3                 ; Load literal 3 into W
            addwf V1, F              ; Add W to V1, result in V1
            RETURN                   ; Return from subroutine

;**************************************************************************
; SUB_RESTAR - Subtract W from V2, store result in V2
;**************************************************************************
SUB_RESTAR
            movlw .3                 ; Load literal 3 into W
            movwf V2                 ; Store W in V2

            movlw .2                 ; Load literal 2 into W
            subwf V2, F              ; Subtract W from V2, result in V2 (V2 - W)
            RETURN                   ; Return from subroutine

;**************************************************************************
; SUB_MULTIPLICAR - Multiply V3 by 3 using addition loop
;**************************************************************************
SUB_MULTIPLICAR
            movlw .3                 ; Load literal 3 into W
            movwf V3                 ; Store 3 in V3
            movwf AUX                ; Copy 3 to AUX
            decf AUX, F              ; Decrement AUX by 1 (now AUX=2)

LOOP_MUL
            movlw .3                 ; Load 3 into W
            addwf V3, F              ; Add W to V3 (V3 = V3 + 3)
            decfsz AUX, F            ; Decrement AUX and skip next if zero
            goto LOOP_MUL            ; Loop while AUX != 0
            RETURN                   ; Return from subroutine

;**************************************************************************
; SUB_AND - Logical AND between W and V4, result in V4
;**************************************************************************
SUB_AND
            movlw .3                 ; Load literal 3 into W
            movwf V4                 ; Store 3 in V4

            movlw .2                 ; Load literal 2 into W
            andwf V4, F              ; AND W with V4, store result in V4
            RETURN                   ; Return from subroutine

;**************************************************************************
; SUB_OR - Logical OR between W and V5, result in V5
;**************************************************************************
SUB_OR
            movlw .3                 ; Load literal 3 into W
            movwf V5                 ; Store 3 in V5

            movlw .2                 ; Load literal 2 into W
            iorwf V5, F              ; OR W with V5, store result in V5
            RETURN                   ; Return from subroutine

;**************************************************************************
; SUB_XOR - Logical XOR between W and V6, result in V6
;**************************************************************************
SUB_XOR
            movlw .3                 ; Load literal 3 into W
            movwf V6                 ; Store 3 in V6

            movlw .2                 ; Load literal 2 into W
            xorwf V6, F              ; XOR W with V6, store result in V6
            RETURN                   ; Return from subroutine

;**************************************************************************
; Main program starts here
;**************************************************************************
Main

		; The Clear_memory subroutine is not defined in this file.
		; You must include the Conf.inc file where this routine is defined for it to work properly.

			call Clear_memory
            call SUB_SUMAR           ; Call addition subroutine
            call SUB_RESTAR          ; Call subtraction subroutine
            call SUB_MULTIPLICAR     ; Call multiplication subroutine
            call SUB_AND             ; Call AND subroutine
            call SUB_OR              ; Call OR subroutine
            call SUB_XOR             ; Call XOR subroutine

			LOOP GOTO LOOP

            END                     ; End of program



		

