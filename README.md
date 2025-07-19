# 📦 Microcontroladores PIC 

## 🧠 ¿Qué son los microcontroladores PIC?

Los **microcontroladores PIC** (Peripheral Interface Controller) son una familia de microcontroladores. Son dispositivos electrónicos programables que integran en un solo chip una **CPU**, **memoria**, **periféricos**, **temporizadores**, **convertidores A/D** y **puertos de entrada/salida**, lo que los hace ideales para controlar procesos electrónicos embebidos.

# 📄 Archivos 

## 📁 Fundamentals

Esta carpeta contiene **códigos fundamentales en ensamblador** para trabajar con **microcontroladores PIC**.





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






## 📎 Herramientas recomendadas

- [MPLAB X IDE]
- [Compiladores XC8, XC16, XC32]
