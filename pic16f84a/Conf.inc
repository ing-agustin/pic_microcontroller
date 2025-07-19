SECTION code

; Define macros to select bank 0 or bank 1 in STATUS register
#define SET_BANK_0 bcf STATUS,RP0    ; Clear RP0 bit to select bank 0
#define SET_BANK_1 bsf STATUS,RP0    ; Set RP0 bit to select bank 1

; Define macros to clear bits related to EEPROM control (WREN, WR, RD)
#define SET_WREN_0 bcf EECON1,WREN   ; Disable write enable
#define SET_WREN_1 bcf EECON1,WREN   ; (Repeated, likely typo, should be bsf for enable)
#define SET_WR_0 bcf EECON1,WR       ; Clear write bit
#define SET_WR_1 bcf EECON1,WR       ; (Repeated, likely typo, should be bsf for set)
#define SET_RD_0 bcf EECON1,RD       ; Clear read bit
#define SET_RD_1 bcf EECON1,RD       ; (Repeated, likely typo, should be bsf for set)

; Define macros to clear interrupt flags
#define CLRFTOIF bcf INTCON,T0IF     ; Clear Timer0 interrupt flag
#define CLRFINTF bcf INTCON,INTF     ; Clear external interrupt flag
#define CLRFRBIF bcf INTCON,RBIF     ; Clear interrupt-on-change flag for PORTB

; Define symbolic names for memory locations 0x10 to 0x19
MEM1 EQU 0x10
MEM2 EQU 0x11
MEM3 EQU 0x12
MEM4 EQU 0x13
MEM5 EQU 0x14
MEM6 EQU 0x15
MEM7 EQU 0x16
MEM8 EQU 0x17
MEM9 EQU 0x18
MEM10 EQU 0x19

;-------------------------
; Clear_memory subroutine
; Clears all memory locations defined above by setting them to zero
Clear_memory
    CLRF MEM1
    CLRF MEM2
    CLRF MEM3
    CLRF MEM4
    CLRF MEM5
    CLRF MEM6
    CLRF MEM7
    CLRF MEM8
    CLRF MEM9
    CLRF MEM10
    RETURN

;-------------------------
; Enable_ext_int subroutine
; Enables external interrupts on the PIC16F84A
Enable_ext_int
    BSF INTCON,GIE   ; Enable global interrupts
    BSF INTCON,RBIE  ; Enable interrupt-on-change for PORTB pins RB7-RB4
    BSF INTCON,INTE  ; Enable external interrupt on RB0/INT pin

    BCF INTCON,RBIF  ; Clear interrupt-on-change flag for PORTB
    BCF INTCON,INTF  ; Clear external interrupt flag

    RETURN


	