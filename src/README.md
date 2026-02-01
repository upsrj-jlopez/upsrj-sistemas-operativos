# File Handling y Gestión de Archivos en Sistemas Operativos

Este proyecto permite explorar el **manejo de archivos a bajo nivel** en sistemas operativos usando llamadas POSIX (`open`, `read`, `write`, `close`). El objetivo principal es que el alumno comprenda cómo el sistema operativo representa los archivos mediante **file descriptors (índices enteros)** y cómo el contenido de un archivo debe cargarse explícitamente en memoria dinámica usando `malloc`.

---

## Infraestructura del proyecto

```
src/
├── main.c          # Punto de entrada del programa
├── utils/          # Utilidades de manejo de archivos
│   ├── file_utils.c
│   └── file_utils.h
```

* **`main.c`**: Controla el flujo general del programa. Solicita la lectura de un archivo, manipula su contenido en memoria y genera un archivo de salida.
* **`utils/file_utils.c`**: Implementa el acceso a archivos usando llamadas al sistema y la gestión de memoria dinámica.
* **`utils/file_utils.h`**: Declara las funciones públicas y documenta su comportamiento mediante comentarios Doxygen.

---

## Flujo general del programa

El programa se ejecuta desde consola con dos argumentos:

```bash
./file_exercise input.txt output.txt
```

1. Se abre el archivo de entrada usando `open()`.
2. Se obtiene su tamaño y se reserva memoria dinámica con `malloc()`.
3. El contenido del archivo se lee completamente en memoria.
4. El contenido se manipula directamente desde el heap.
5. Se escribe el resultado en un archivo de salida usando `write()`.
6. Se libera la memoria reservada y se cierran los descriptores de archivo.

---

## Uso de File Descriptors

En este proyecto **no se utilizan funciones de la librería estándar (`fopen`, `fread`, etc.)**. En su lugar:

* `open()` devuelve un **file descriptor**, que es un entero que el sistema operativo usa como índice a una tabla interna de archivos abiertos.
* Todas las operaciones (`read`, `write`, `lseek`, `close`) se realizan usando este descriptor.

Este enfoque permite observar directamente cómo el sistema operativo abstrae el acceso a archivos.

---

## Gestión de memoria dinámica

El contenido del archivo **no se carga automáticamente en memoria**. El alumno debe:

* Determinar el tamaño del archivo.
* Reservar exactamente la memoria necesaria usando `malloc()`.
* Leer los datos al buffer dinámico.
* Manipular los datos desde memoria.
* Liberar correctamente la memoria con `free()`.

Esto refuerza la relación entre **almacenamiento secundario (archivo)** y **memoria principal (RAM)**.

---

## Carpeta `build/`

Al compilar el proyecto, se genera automáticamente la carpeta `build/`:

```
build/
├── bin/   # Binarios ejecutables
├── obj/   # Archivos objeto (.o)
└── log/   # Salida de ejecución (opcional)
```

* **`bin/`**: contiene el ejecutable final (`file_exercise`).
* **`obj/`**: almacena los archivos objeto generados durante la compilación.
* **`log/`**: guarda la salida del programa si se redirige o automatiza su ejecución.

---

## Compilación

Ejemplo de compilación manual:

```bash
gcc -Wall -Wextra -o file_exercise src/main.c src/utils/file_utils.c
```

---

## Actividades a desarrollar (TODO)

El alumno deberá completar los bloques marcados como `TODO` en el código fuente:

* Apertura y cierre correcto de archivos.
* Cálculo del tamaño del archivo.
* Reserva y liberación de memoria dinámica.
* Lectura y escritura completa del contenido.
* Manipulación del buffer en memoria.

No se permite el uso de funciones de alto nivel de la librería estándar de C para archivos.

---

## Objetivo didáctico

Este ejercicio permite a los alumnos:

* Comprender cómo el sistema operativo gestiona archivos mediante índices (file descriptors).
* Relacionar archivos con estructuras internas del kernel.
* Practicar el uso de memoria dinámica aplicada a un caso real.
* Reforzar el uso de llamadas al sistema en C.
* Desarrollar código modular y documentado profesionalmente.

---

**Autor:** Jesús Salvador López Ortega
[LinkedIn](https://www.linkedin.com/in/jesus-salvador-lopez-ortega/) | [GitHub](https://github.com/chucholoport) | [Correo Institucional](mailto:jlopez@upsrj.edu.mx)
