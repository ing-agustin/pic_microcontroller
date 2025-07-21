
#   📘  Información del PIC16F84A                      #


## 🧩 INTRODUCCIÓN                                               


 El **PIC16F84A** es uno de los microcontroladores más usados en el aprendizaje de sistemas electronicos. Este repositorio contiene ejemplos prácticos en ensamblador, con explicaciones detalladas de su arquitectura y funcionamiento.


## ⚙️  CARACTERÍSTICAS                                           


- 🧮 35 instrucciones ensamblador.
- 🕒 Instrucciones de 1 ciclo (excepto saltos).
- 📈 Hasta 20 MHz de reloj.
- 🧠 1024 palabras de memoria de programa.
- 🧾 68 bytes RAM y 64 bytes EEPROM.
- ⛓️ Stack de 8 niveles.
- 🔁 Interrupciones: RB0/INT, TMR0, RB4-RB7, EEPROM.
- 💾 ICSP, protección de código, watchdog, modo sleep.

## 📍 Tabla de Pines del PIC16F84A


| **Nombre de Pin** | **Pin Nº** | **Descripción** |
|-------------------|------------|------------------|
| `OSC1/CLKIN`      | 16         | Entrada de oscilador de cristal externo. |
| `OSC2/CLKOUT`     | 15         | Salida de oscilador. |
| `MCLR`            | 4          | Master Clear. Entrada de voltaje de programación. |
| `RA0`             | 17         | PORTA. Puerto I/O bidireccional de 5 bits. |
| `RA1`             | 18         | PORTA. Puerto I/O bidireccional de 5 bits. |
| `RA2`             | 1          | PORTA. Puerto I/O bidireccional de 5 bits. |
| `RA3`             | 2          | PORTA. Puerto I/O bidireccional de 5 bits. |
| `RA4/T0CKI`       | 3          | PORTA. Entrada de reloj para el temporizador TMR0. |
| `RB0/INT`         | 6          | PORTB. Entrada/salida. Interrupción externa. |
| `RB1`             | 7          | PORTB. Puerto I/O bidireccional de 8 bits. |
| `RB2`             | 8          | PORTB. Puerto I/O bidireccional de 8 bits. |
| `RB3`             | 9          | PORTB. Puerto I/O bidireccional de 8 bits. |
| `RB4`             | 10         | PORTB. I/O. Interrupción por cambio de estado. |
| `RB5`             | 11         | PORTB. Puerto I/O bidireccional. |
| `RB6`             | 12         | Entrada de reloj para programación serial (ICSP). |
| `RB7`             | 13         | Entrada de datos para programación serial (ICSP). |
| `VSS`             | 5          | GND (tierra). |
| `VDD`             | 14         | Voltaje de alimentación. |


## 🧾 REGISTROS IMPORTANTES                                      


🔹 **STATUS**: Flags (Z, DC, C), selección de banco (RP0).  
🔹 **INTCON**: Habilitación de interrupciones.  
🔹 **OPTION_REG**: Configuración de TMR0, flancos y pull-ups.  
🔹 **PORTA / PORTB**: Entradas y salidas configurables con TRISA/TRISB.


## 🧮 CONJUNTO DE INSTRUCCIONES                                  

### 💾 Instrucciones Orientadas a Registros (18 instrucciones)

| **Mnemónico** | **Operandos** | **Descripción**                                            | **Flags Afectados** | **Ciclos** |
|---------------|---------------|-------------------------------------------------------------|----------------------|------------|
| `ADDWF`       | f, d          | Suma W y f                                                  | C, DC, Z             | 1          |
| `ANDWF`       | f, d          | AND entre W y f                                             | Z                    | 1          |
| `CLRF`        | f             | Borra el registro f                                         | Z                    | 1          |
| `CLRW`        | -             | Borra el registro W                                         | Z                    | 1          |
| `COMF`        | f, d          | Complemento bit a bit de f                                  | Z                    | 1          |
| `DECF`        | f, d          | Decrementa f en 1                                           | Z                    | 1          |
| `DECFSZ`      | f, d          | Decrementa f y salta si el resultado es 0                   | -                    | 1 (2)      |
| `INCF`        | f, d          | Incrementa f en 1                                           | Z                    | 1          |
| `INCFSZ`      | f, d          | Incrementa f y salta si el resultado es 0                   | -                    | 1 (2)      |
| `IORWF`       | f, d          | OR inclusivo entre W y f                                    | Z                    | 1          |
| `MOVF`        | f, d          | Copia el contenido de f                                     | Z                    | 1          |
| `MOVWF`       | f             | Copia W al registro f                                       | -                    | 1          |
| `NOP`         | -             | No realiza ninguna operación                                | -                    | 1          |
| `RLF`         | f, d          | Rota a la izquierda incluyendo el bit Carry                 | C                    | 1          |
| `RRF`         | f, d          | Rota a la derecha incluyendo el bit Carry                   | C                    | 1          |
| `SUBWF`       | f, d          | Resta W de f                                                | C, DC, Z             | 1          |
| `SWAPF`       | f, d          | Intercambia nibbles alto y bajo de f                        | -                    | 1          |
| `XORWF`       | f, d          | XOR entre W y f                                             | Z                    | 1          |


### 🔟 Instrucciones Orientadas a Bit (4 instrucciones)

| **Mnemónico** | **Operandos** | **Descripción**                                                  | **Flags Afectados** | **Ciclos** |
|---------------|---------------|-------------------------------------------------------------------|----------------------|------------|
| `BCF`         | f, b          | Borra (pone a 0) el bit b del registro f                         | -                    | 1          |
| `BSF`         | f, b          | Establece (pone a 1) el bit b del registro f                     | -                    | 1          |
| `BTFSC`       | f, b          | Salta la siguiente instrucción si el bit b de f es 0             | -                    | 1 (2)      |
| `BTFSS`       | f, b          | Salta la siguiente instrucción si el bit b de f es 1             | -                    | 1 (2)      |



### 🔢 Instrucciones con Literales y de Control (13 instrucciones)

| **Mnemónico** | **Operandos** | **Descripción**                                                      | **Flags Afectados** | **Ciclos** |
|---------------|---------------|-----------------------------------------------------------------------|----------------------|------------|
| `ADDLW`       | k             | Suma literal k con W y guarda en W                                   | C, DC, Z             | 1          |
| `ANDLW`       | k             | AND entre literal k y W, guarda en W                                 | Z                    | 1          |
| `CALL`        | k             | Llama a subrutina en dirección k                                     | -                    | 2          |
| `CLRWDT`      | -             | Borra el watchdog timer (WDT)                                        | TO, PD               | 1          |
| `GOTO`        | k             | Salta a dirección k                                                  | -                    | 2          |
| `IORLW`       | k             | OR entre literal k y W, guarda en W                                  | Z                    | 1          |
| `MOVLW`       | k             | Carga literal k en W                                                 | -                    | 1          |
| `RETFIE`      | -             | Retorno de interrupción, reactiva interrupciones                     | -                    | 2          |
| `RETLW`       | k             | Retorno de subrutina y carga k en W                                  | -                    | 2          |
| `RETURN`      | -             | Retorno de subrutina                                                 | -                    | 2          |
| `SLEEP`       | -             | Pone el microcontrolador en modo de bajo consumo                     | TO, PD               | 1          |
| `SUBLW`       | k             | Resta W de literal k, guarda en W                                    | C, DC, Z             | 1          |
| `XORLW`       | k             | XOR entre literal k y W, guarda en W                                 | Z                    | 1          |






## 🛠️  DIRECTIVAS DEL ENSAMBLADOR                               


📌 `EQU` ➤ Definir constantes.  
📌 `ORG` ➤ Indicar posición de memoria.  
📌 `END` ➤ Final del programa.  
📌 `INCLUDE` ➤ Importar definiciones de registros.

🔧 Ejemplo:
```asm
    INCLUDE "p16f84a.inc"
    LIST p=16f84a
    ORG 0x00
    ; Tu código aquí
    END
