# 📦 Microcontroladores PIC 

## 🧠 ¿Qué son los microcontroladores PIC?

Los **microcontroladores PIC** (Peripheral Interface Controller) son una familia de microcontroladores. Son dispositivos electrónicos programables que integran en un solo chip una **CPU**, **memoria**, **periféricos**, **temporizadores**, **convertidores A/D** y **puertos de entrada/salida**, lo que los hace ideales para controlar procesos electrónicos embebidos.


## 🖥️ Introducción a las Arquitecturas de Computadora

En el mundo del diseño de microprocesadores y microcontroladores, la forma en que se organizan y conectan la memoria, la CPU y los buses determina en gran medida el rendimiento y la eficiencia del sistema.
Dos de las arquitecturas más influyentes y estudiadas en el ámbito académico y profesional son la arquitectura de Von Neumann y la arquitectura Harvard.

Ambas definen cómo el procesador accede a las instrucciones y a los datos, pero lo hacen con enfoques diferentes:

### Arquitectura Von Neumann

La arquitectura de Von Neumann es un modelo fundamental para el diseño de computadoras digitales que ha sido la base de la mayoría de los sistemas informáticos desde mediados del siglo XX. Algunas de sus características son:

- Sus cinco partes básicas: memoria, unidad aritmético-lógica (ALU), unidad de control, entrada y salida.
- La memoria guarda instrucciones y datos en un mismo espacio.
- Las instrucciones se dividen en tipo y dirección (8 bits tipo, 12 bits dirección).
- La ALU y unidad de control forman el "cerebro", ahora integrado en la CPU.
- ALU realiza operaciones como suma, resta, lógica; el resultado se guarda en registros o memoria.

### Arquitectura Harvard

La arquitectura Harvard es un diseño de computadora en el que la memoria para instrucciones y la memoria para datos están físicamente separadas. Esto significa que el procesador tiene caminos de acceso (buses) independientes para leer instrucciones y para acceder a datos, lo que permite que ambas operaciones ocurran simultáneamente.Algunas de sus características son:

- **Memoria separada**: El código (programa) y los datos se almacenan en memorias físicas diferentes.
- **Buses independientes**: Hay un bus exclusivo para la memoria de instrucciones y otro para la memoria de datos.
- **Ejecución más rápida**: Al poder acceder simultáneamente a instrucciones y datos, el procesador puede ejecutar instrucciones más eficientemente y evitar cuellos de botella.
- **Mayor seguridad**: La separación física hace que el programa no pueda ser modificado accidentalmente por operaciones sobre datos, lo que mejora la integridad del código.
- **Menor flexibilidad**: Esta separación hace más difícil (o imposible) modificar el programa desde el propio código, a menos que se usen técnicas específicas de auto-programación.
- **Uso común en microcontroladores**: La mayoría de los microcontroladores PIC (como el PIC16F84A) usan esta arquitectura para optimizar velocidad y seguridad.


## 📎 Herramientas recomendadas

- [MPLAB X IDE]
- [Compiladores XC8, XC16, XC32]

## 📚 Referencias

- Microchip Technology Inc. (2023). *PIC16F84A Data Sheet*.
- José María Angulo Usategui, Ignacio Angulo Martínez y Aritza Etxebarría Ruiz. Microcontroladores PIC: Diseño práctico de aplicaciones ( primera parte ). McGraw-Hill, 2007, 4a ed.
- Tanenbaum, A. S. (2013). *Structured Computer Organization*. Pearson.
