


# 📄 Archivos 

## 📁 Fundamentals

Esta carpeta contiene **códigos fundamentales en ensamblador** para trabajar con **microcontroladores PIC**.

## 🧪 Archivos ASM_PIC

  1. **Operaciones aritmeticas y logicas**
  2. **Manipulación de la memoria utilizando el direccionamiento indirecto**
  3. **Plantilla interrupciones PIC**
  4. **Manipulación Timer** - Contar en **50mSeg**
  5. **Escritura EEPROM**


## 📜 Descripción general - archivo conf.inc

Este archivo en ensamblador para el **PIC16F84A** tiene como objetivo principal gestionar interrupciones y almacenar datos en memoria. A continuación, se resumen sus funcionalidades clave:

### ⚙️ Funcionalidades principales

- 🧹 **Limpieza de memoria RAM**  
  Subrutina `Clear_memory` que borra las posiciones MEM1 a MEM10.

- 🚨 **Gestión de interrupciones externas**  
  Subrutina `Enable_ext_int` que habilita interrupciones externas (`INT`, `RBIE`) y limpia sus flags (`INTF`, `RBIF`).

- 🧩 **Definición de macros**  
  Macros como `SET_WREN_1`, `SET_WR_0`, `SET_RD_1` que controlan el acceso a la EEPROM a nivel de bits.

---

> 🛠️ Este código está preparado para ser reutilizable y modular en sistemas que usen interrupciones para capturar eventos y almacenar información.












