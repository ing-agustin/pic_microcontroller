;**************************************************************************
; Title: Fundamentals level - Timer 50mSeg
;**************************************************************************

            #INCLUDE "p16f84a.inc"    ; Include PIC16F84A register definitions
            #INCLUDE "Conf.inc"       ; Include configuration and definitions

            LIST p=16f84a            ; Processor directive for assembler

;**************************************************************************
            __CONFIG _WDT_OFF         ; Disable Watchdog Timer
;**************************************************************************
			N_overflows EQU 0X22 ; .200
            ORG 0x000                ; Program start address
            goto Main                ; Jump to main program

            ORG 0x004               
            ;RSI
		 	DECFSZ N_overflows,F
			GOTO Sub_TMR0
			GOTO Sub_overflows

		

Sub_TMR0
		NOP
		movlw 0x08
		movwf TMR0
		bcf INTCON,T0IF ; Flag timer

		RETFIE

		

Sub_overflows

		NOP ;  breakpoint here    <----------------------- 50mSeg



		RETFIE
;**************************************************************************
; Main program starts here
;**************************************************************************
Main

;--- Initialization section ---
; Overflows
			movlw 0xFA ; 250
			movwf N_overflows

     		MOVLW 0x84 ;  We set an initial count value for the timer
			MOVWF TMR0
			BSF INTCON, T0IE       ; Enable Timer0
            BSF INTCON, GIE        ; Enable GIE
			bcf INTCON,T0IF ; Clear Flag timer 
			SET_BANK_1
			BCF OPTION_REG,PSA ; PSA=0
			BSF OPTION_REG,PS0 ;\
			BCF OPTION_REG,PS1 ; } PS2PS1PS0=000 => t=4 
			BCF OPTION_REG,PS2 ;/
			BCF OPTION_REG,T0CS ; breakpoint here    <-----------------------
			SET_BANK_0
			

;--- Main loop ---
            LOOP GOTO LOOP           ; Infinite loop (wait for interrupts)

            END                      ; End of program


;Importante/Important
;--------------------------------------------------------------
; Cálculos temporales con cristal de 20 MHz
;
; 1 ciclo de reloj  = 1 / 20 MHz = 50 ns
; 1 ciclo instrucción = 4 * 50 ns = 200 ns = 0,2 µs
;
; ¿Cuántos ciclos de instrucción caben en 1 segundo?
; 1 segundo / 0,2 µs = 5.000.000 ciclos de instrucción
;--------------------------------------------------------------

;--------------------------------------------------------------
; Timing calculations with 20 MHz crystal
;
; 1 clock cycle       = 1 / 20 MHz = 50 ns
; 1 instruction cycle = 4 * 50 ns = 200 ns = 0.2 µs
;
; How many instruction cycles fit in 1 second?
; 1 second / 0.2 µs = 5,000,000 instruction cycles
;--------------------------------------------------------------
