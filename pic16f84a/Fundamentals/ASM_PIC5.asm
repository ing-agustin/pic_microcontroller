;**************************************************************************
; Title: Fundamentals level - Write EEPROM
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
		 

Sub_EEPROM

    ; ==== EEPROM[0x00] ====

    ;Establecer dato y dirección/Set data and address
    SET_BANK_0
    MOVLW 0X02
    MOVWF EEDATA

    MOVLW 0x00
    MOVWF EEADR

    ;Preparar escritura/Prepare write
    SET_BANK_1
    BSF EECON1, WREN
    BCF INTCON, GIE

    ;Secuencia/Sequence
    MOVLW 0x55
    MOVWF EECON2
    MOVLW 0xAA
    MOVWF EECON2
    BSF EECON1, WR

    ;Waiting
Wait1
    BTFSC EECON1, WR
    GOTO Wait1

    ;Deshabilitar escritura/Disable write
    BCF EECON1, WREN

    ; ==== EEPROM[0x01] ====

    ;Establecer nuevo dato y dirección/Set new data and address
    SET_BANK_0
    MOVLW 0X08
    MOVWF EEDATA

    MOVLW 0x01
    MOVWF EEADR

    ;Preparar escritura/Prepare writing
    SET_BANK_1
    BSF EECON1, WREN
    BCF INTCON, GIE

    ;Secuencia/Sequence
    MOVLW 0x55
    MOVWF EECON2
    MOVLW 0xAA
    MOVWF EECON2
    BSF EECON1, WR

    ;Waiting
Wait2
    BTFSC EECON1, WR
    GOTO Wait2

    ;Deshabilitar escritura y restaurar interrupciones/Disable write and restore interrupts
    BCF EECON1, WREN
    BSF INTCON, GIE

    RETURN


;**************************************************************************
; Main program starts here
;**************************************************************************
Main
		
			Call Sub_EEPROM
;--- Main loop ---
            LOOP GOTO LOOP           ; Infinite loop (wait for interrupts)

            END                      ; End of program


