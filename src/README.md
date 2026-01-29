# Práctica: Análisis de la Administración de Memoria en Linux (Ubuntu 22.04)

- [Práctica: Análisis de la Administración de Memoria en Linux (Ubuntu 22.04)](#práctica-análisis-de-la-administración-de-memoria-en-linux-ubuntu-2204)
  - [Objetivo general](#objetivo-general)
  - [¿Qué vas a hacer en esta práctica?](#qué-vas-a-hacer-en-esta-práctica)
  - [Estructura del proyecto](#estructura-del-proyecto)
  - [¿Cómo leer el archivo `mem_analysis.sh`?](#cómo-leer-el-archivo-mem_analysissh)
  - [Conceptos teóricos clave](#conceptos-teóricos-clave)
    - [Memoria RAM (memoria principal)](#memoria-ram-memoria-principal)
    - [Frame (marco de página)](#frame-marco-de-página)
    - [Page (página)](#page-página)
    - [Memoria virtual](#memoria-virtual)
    - [Paging (paginación)](#paging-paginación)
    - [Swap](#swap)
    - [Swappiness](#swappiness)
    - [MMU (Memory Management Unit)](#mmu-memory-management-unit)
    - [Thrashing](#thrashing)
  - [¿Cómo escribir el análisis en el script?](#cómo-escribir-el-análisis-en-el-script)
  - [Restricciones importantes](#restricciones-importantes)
  - [Criterios generales de evaluación](#criterios-generales-de-evaluación)
  - [Notas importantes sobre la evaluación automática](#notas-importantes-sobre-la-evaluación-automática)
    - [Evaluación por secciones](#evaluación-por-secciones)
    - [SECTION 7: THEORETICAL RELATION](#section-7-theoretical-relation)
    - [CONCLUSIONS](#conclusions)
    - [Recomendaciones finales](#recomendaciones-finales)
  - [Cierre](#cierre)

---

## Objetivo general

Comprender cómo un sistema operativo Linux administra la memoria principal y la memoria virtual, observando su comportamiento real mediante un script en Bash que recolecta información del sistema y documenta el análisis del estudiante de forma reproducible.

---

## ¿Qué vas a hacer en esta práctica?

No ejecutarás comandos manualmente.
Tu objetivo es completar un script `.sh`, entendiendo:

* Qué información debe obtener cada sección
* Qué comandos de Linux pueden proporcionar esa información
* Cómo registrar evidencia y análisis automáticamente en un archivo de log

El resultado final será el archivo:

```text
out/mem_analysis.log
```

que contendrá:

* Información real del sistema
* Tu análisis técnico
* Tu autoría (usuario de GitHub)

---

## Estructura del proyecto

```text
tu-repositorio/
├── src/
│   └── mem_analysis.sh
└── out/
    └── mem_analysis.log
```

No modifiques esta estructura.

---

## ¿Cómo leer el archivo `mem_analysis.sh`?

El script está dividido en secciones numeradas.

Cada sección contiene:

1. Comentarios (`#`)
   Explican qué debe hacerse y qué se espera obtener.

2. Bloques `TODO`
   Lugares donde debes:

   * Escribir el comando correcto
   * Redactar tu análisis usando `echo`

3. Notas (`NOTE:`)

   * Explican qué tipo de comando se espera
   * Incluyen referencias oficiales (páginas `man`, documentación del kernel)
   * Mencionan flags útiles, sin dar la solución directa

No elimines comentarios ni notas; forman parte de la evaluación.

---

## Conceptos teóricos clave

Los siguientes conceptos aparecen directa o indirectamente en el script y deben comprenderse para realizar el análisis correctamente.

---

### Memoria RAM (memoria principal)

Es la memoria física instalada en el sistema. En ella residen los programas y datos que están siendo utilizados activamente.

Características:

* Rápida
* Volátil
* Limitada

En Linux, la RAM se divide internamente en frames.

---

### Frame (marco de página)

Un frame es un bloque fijo de memoria física.

* Tamaño típico: 4 KB
* Unidad mínima de asignación en la RAM
* El sistema operativo asigna frames a los procesos

Los frames existen únicamente en memoria física.

---

### Page (página)

Una page es un bloque de memoria virtual.

* Tiene el mismo tamaño que un frame
* Pertenece al espacio de direcciones de un proceso
* Puede estar en RAM, en swap o no estar cargada

Las pages permiten que un proceso crea que tiene más memoria de la que realmente existe.

---

### Memoria virtual

Es una abstracción que permite:

* Ejecutar programas más grandes que la RAM
* Aislar procesos entre sí
* Usar el disco como extensión de la memoria

Linux implementa memoria virtual mediante paginación.

---

### Paging (paginación)

Es el mecanismo mediante el cual:

* Las pages se mueven entre RAM y swap
* El sistema decide qué mantener en memoria física
* Se optimiza el uso de la RAM

Cuando una page sale de RAM ocurre un page-out; cuando regresa ocurre un page-in.

---

### Swap

El swap es un espacio en disco utilizado como respaldo de la RAM.

* Puede ser una partición o un archivo
* Es considerablemente más lento que la RAM
* Permite evitar que el sistema se quede sin memoria

El uso de swap no es un error, pero su uso excesivo puede degradar el rendimiento.

---

### Swappiness

Es un parámetro del kernel que indica:

* Qué tan agresivamente el sistema usa swap
* Valores bajos priorizan la RAM
* Valores altos priorizan el swap

Este parámetro influye directamente en el comportamiento del paging.

---

### MMU (Memory Management Unit)

La MMU es un componente de hardware que:

* Traduce direcciones virtuales a direcciones físicas
* Aplica protección de memoria
* Hace posible la memoria virtual

El sistema operativo configura la MMU, pero la traducción ocurre en hardware.

---

### Thrashing

El thrashing ocurre cuando:

* El sistema pasa más tiempo intercambiando pages
* Que ejecutando procesos
* El rendimiento general se degrada severamente

Indicadores comunes:

* Uso intensivo de swap
* Alto número de page-ins y page-outs
* Sistema lento aun con baja carga de CPU

---

## ¿Cómo escribir el análisis en el script?

Todo el análisis debe escribirse utilizando:

```bash
echo "Texto del análisis" >> "${LOG_FILE}"
```

No se debe imprimir análisis por pantalla; todo debe almacenarse en el archivo de log.

---

## Restricciones importantes

* No modificar parámetros del sistema
* No finalizar procesos
* No usar interfaces gráficas
* No eliminar comentarios ni notas
* No ejecutar el script como superusuario, salvo indicación explícita

---

## Criterios generales de evaluación

Se evaluará:

* Selección correcta de comandos
* Profundidad y claridad del análisis
* Uso adecuado de los conceptos teóricos
* Ejecución correcta del script sin errores
* Evidencia clara en `mem_analysis.log`
* Identificación explícita del autor mediante usuario de GitHub

Perfecto 👍
Te dejo **el apartado actualizado del README**, listo para **agregarse tal cual**, explicando claramente **cómo funciona el tester** y **por qué las keywords deben aparecer explícitamente en el texto** de cada sección.

Puedes insertarlo en una sección tipo **“Notas importantes”** o **“Criterios de evaluación automática”**.

---

## Notas importantes sobre la evaluación automática

Esta práctica cuenta con un **tester automático** que valida el contenido generado por el script `mem_analysis.sh`.
El tester **no interpreta intenciones** ni evalúa sinónimos: analiza **texto literal** dentro de cada sección del archivo `mem_analysis.log`.

### Evaluación por secciones

Para algunas secciones teóricas, el tester **extrae únicamente el contenido de la sección correspondiente** y lo analiza de forma aislada.
Esto significa que **las palabras clave deben aparecer explícitamente dentro de esa sección**, no en otra parte del archivo.

---

### SECTION 7: THEORETICAL RELATION

En esta sección, el tester valida que el texto incluya **todos los conceptos teóricos fundamentales** de la administración de memoria.

Debes asegurarte de que **las siguientes palabras aparezcan literalmente en el texto de la sección**:

* `page`
* `frame`
* `mmu`
* `swap`
* `paging`
* `thrashing`

Notas importantes:

* Las palabras deben aparecer **como parte de una explicación**, no solo listadas.
* No importa si están en mayúsculas o minúsculas.
* Si una palabra clave no aparece, **la sección se considera incompleta** y el tester marcará error.

---

### CONCLUSIONS

La sección de conclusiones también se evalúa de forma aislada.
Debe contener **reflexión real** y no solo frases genéricas.

El tester verifica que el texto incluya explícitamente los siguientes conceptos:

* `memory`
* `RAM`
* `swap`
* `paging`
* `cache`
* `performance`

Notas importantes:

* Las conclusiones deben estar escritas como texto explicativo usando `echo`.
* No se aceptan conclusiones vacías o demasiado superficiales.
* Si falta alguno de los conceptos clave, el tester marcará la sección como **incompleta**.

---

### Recomendaciones finales

* Escribe siempre **frases completas**, no listas sueltas.
* Asegúrate de que cada sección tenga **contenido propio**, incluso si los conceptos se repiten.
* Ejecuta el tester después de completar cada sección para validar tu progreso de forma incremental.

---

## Cierre

Esta práctica busca que el estudiante:

* Observe el sistema operativo en funcionamiento real
* Conecte teoría con evidencia práctica
* Documente técnicamente su análisis de forma reproducible

El script debe entenderse como una herramienta de diagnóstico del sistema operativo.