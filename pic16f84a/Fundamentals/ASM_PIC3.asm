;**************************************************************************
; Title: Fundamentals level - Template interruption
;**************************************************************************

            #INCLUDE "p16f84a.inc"    ; Include PIC16F84A register definitions
            #INCLUDE "Conf.inc"       ; Include configuration and definitions

            LIST p=16f84a            ; Processor directive for assembler

;**************************************************************************
            __CONFIG _WDT_OFF         ; Disable Watchdog Timer
;**************************************************************************

            ORG 0x000                ; Program start address
            goto Main                ; Jump to main program

            ORG 0x004               
            ;RSI
		 	BTFSC INTCON, INTF        ; Check if external interrupt flag is set
            GOTO Sub_INTF             ; If yes, jump to Sub_INTF
            BTFSC INTCON, RBIF        ; Check if port change interrupt flag is set
            GOTO Sub_RBIF             ; If yes, jump to Sub_RBIF
			GOTO Sub_ACT_TMR0
	

		


;**************************************************************************
; Main program starts here
;**************************************************************************
Main

;--- Initialization section ---

            BSF INTCON, GIE          ; Enable global interrupts
            BSF INTCON, T0IE         ; Enable TMR0 overflow interrupt
            BSF INTCON, RBIE         ; Enable port B change interrupt (RB4 to RB7)
            BSF INTCON, INTE         ; Enable external interrupt on RB0

            BCF INTCON, RBIF         ; Clear the RB port change interrupt flag
            BCF INTCON, INTF         ; Clear the external interrupt flag
            BCF INTCON, T0IF         ; Clear the TMR0 overflow interrupt flag

            SET_BANK_1               ; Switch to Bank 1

            BCF OPTION_REG, T0SE     ; Select rising edge for external clock (TMR0)
            BCF TRISA, RA0           ; Set RA0 as output
            BCF TRISA, RA1           ; Set RA1 as output
            BCF TRISA, RA2           ; Set RA2 as output
            BCF TRISA, RA3           ; Set RA3 as output

            BCF OPTION_REG, PSA      ; Assign prescaler to TMR0
            BSF OPTION_REG, PS0      ; Set prescaler bits: 100 = 1:4
            BCF OPTION_REG, PS1		 ; TMR0=4
            BCF OPTION_REG, PS2

            SET_BANK_0               ; Return to Bank 0

            BCF PORTA, RA0           ; Set RA0 to LOW
            BCF PORTA, RA1           ; Set RA1 to LOW
            BCF PORTA, RA2           ; Set RA2 to LOW
            BCF PORTA, RA3           ; Set RA3 to LOW

;--- Main loop ---
            LOOP GOTO LOOP           ; Infinite loop (wait for interrupts)

            END                      ; End of program



		

Sub_INTF
    ; External interrupt service routine
    ; (Triggered on RB0 when INTF is set)
    ; --- Your interrupt code here ---
    BCF INTCON, INTF                ; Clear external interrupt flag
    RETFIE                          ; Return from interrupt (restore context)

Sub_RBIF
    ; Port B change interrupt service routine
    ; (Triggered by changes on RB4–RB7)
    ; --- Your interrupt code here ---
    BCF INTCON, RBIF                ; Clear port change interrupt flag
    RETFIE                          ; Return from interrupt

Sub_ACT_TMR0
    ; Timer0 overflow interrupt service routine
    ; --- Your interrupt code here ---
    BCF INTCON, T0IF                ; Clear Timer0 interrupt flag
    RETFIE                          ; Return from interrupt

