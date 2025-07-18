 SECTION code 
			#DEFINE SET_BANK_0 bcf STATUS,RP0
			#DEFINE SET_BANK_1 bsf STATUS,RP0
			#DEFINE SET_WREN_0 bcf EECON1,WREN
			#DEFINE SET_WREN_1 bcf EECON1,WREN
			#DEFINE SET_WR_0 bcf EECON1,WR
			#DEFINE SET_WR_1 bcf EECON1,WR
			#DEFINE SET_RD_0 bcf EECON1,RD
			#DEFINE SET_RD_1 bcf EECON1,RD
			#DEFINE CLRFTOIF bcf INCON,T0IF ; Clear flag T0IF
			#DEFINE CLRFINTF bcf INCON,INTF ; Clear flag INTF
			#DEFINE CLRFRBIF bcf INCON,RBIF ; Clear flag RBIF
			

			MEM1 EQU 0X10
			MEM2 EQU 0X11
			MEM3 EQU 0X12
			MEM4 EQU 0X13
			MEM5 EQU 0X14
			MEM6 EQU 0X15
			MEM7 EQU 0X16
			MEM8 EQU 0X17
			MEM9 EQU 0X18
			MEM10 EQU 0X19
			
		
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

	Enable_ext_int

		BSF INTCON,GIE  ; Habilitamos las interrupciones externas
		BSF INTCON, RBIE ; Habilitar interrupción por cambio en RB7-RB4
		BSF INTCON,INTE ; Habilitamos la interrupcion externa 
					
		BCF INTCON, RBIF ; Limpiar flag de RB7-RB4
		BCF INTCON,INTF ; Limpiamos el flag vinculado a la interrupcion externa


		RETURN

	