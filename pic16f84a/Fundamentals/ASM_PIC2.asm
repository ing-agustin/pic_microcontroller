;**************************************************************************
; Title: Fundamentals level - Basic memory manipulation using indirect addressing
;**************************************************************************

            #INCLUDE "p16f84a.inc"    ; Include PIC16F84A register definitions
            #INCLUDE "Conf.inc"       ; Include configuration and definitions

            LIST p=16f84a            ; Processor directive for assembler

;**************************************************************************
            __CONFIG _WDT_OFF         ; Disable Watchdog Timer
;**************************************************************************

            ORG 0x000                ; Program start address
            goto Main                ; Jump to main program

            ORG 0x004                ; Interrupt vector address
            ; No interrupt service routine defined here


;**************************************************************************
; Main program starts here
;**************************************************************************
Main

		; The Clear_memory subroutine is not defined in this file.
		; You must include the Conf.inc file where this routine is defined for it to work properly.

			call Clear_memory
            
;--- Initialize memory variables

        movlw .2                     ; Load literal value 2
        movwf MEM1                   ; Store into MEM1

        movlw .7                     ; Load literal value 7
        movwf MEM3                   ; Store into MEM3

        movlw .3                     ; Load literal value 3
        movwf MEM10                  ; Store into MEM10 (used as a loop counter)

        movlw MEM1                  ; Load the address of MEM1 into WREG (e.g., 0x10)
        movwf FSR                   ; Store WREG into FSR (set indirect pointer)

;--- Subroutine to increment 3 memory locations starting at MEM1

SUB_FSR
        INCF INDF, F                ; Increment the value at the address pointed by FSR
        INCF FSR, F                 ; Increment FSR to point to the next memory location
        DECFSZ MEM10, F             ; Decrement MEM10, skip next instruction if zero
        GOTO SUB_FSR                ; Repeat the loop if MEM10 is not zero
;---
			LOOP GOTO LOOP

            END                     ; End of program



		

