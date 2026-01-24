# Algoritmos de Reemplazo de Páginas

Este proyecto permite simular distintos **algoritmos de reemplazo de páginas** en sistemas operativos (FIFO y LRU). La infraestructura está organizada en carpetas para separar la lógica de memoria, los algoritmos de reemplazo y los binarios generados.

---

## Infraestructura del proyecto

```
src/
├── main.c                # Punto de entrada del programa
├── memory/               # Definición y utilidades para estructuras de memoria
│   └── memory.c/.h
├── fifo/                 # Algoritmo FIFO (First-In, First-Out)
│   └── fifo.c/.h
└── lru/                  # Algoritmo LRU (Least Recently Used)
    └── lru.c/.h
```

- **`main.c`**: Define la cadena de referencias y las estructuras de memoria que se usan en las simulaciones.  
- **`memory/`**: Contiene funciones auxiliares para inicializar, imprimir y verificar el estado de los frames de memoria.  
- **`fifo/`**: Implementa el algoritmo de reemplazo de páginas **First-In, First-Out**.  
- **`lru/`**: Implementa el algoritmo de reemplazo de páginas **Least Recently Used**.  

---

## Estructuras definidas en `main.c`

En el archivo `main.c` se inicializan las estructuras necesarias para las simulaciones:

```c
/* Example reference string for simulation */
int reference_string[MAX_REF] = {1, 2, 3, 4, 1, 2, 5, 1, 2, 3, 4, 5};
int ref_length = 12;

/* Memory structures */
int frames[MAX_FRAMES];
int aux[MAX_FRAMES];       /* Auxiliary array for FIFO */
int last_used[MAX_FRAMES]; /* Auxiliary array for LRU */
int frame_count = 3;
```

- **`reference_string`**: secuencia de páginas a simular.  
- **`ref_length`**: longitud de la secuencia.  
- **`frames`**: representan las páginas cargadas en memoria.  
- **`aux`**: usado por FIFO para llevar el índice circular.  
- **`last_used`**: usado por LRU para registrar el tiempo de último acceso.  
- **`frame_count`**: número de frames disponibles en la simulación.  

---

## Constantes definidas en `memory.h`

En el archivo `memory/memory.h` se definen las macros que parametrizan la simulación:

```c
/** @def MAX_FRAMES
 *  @brief Maximum number of memory frames available.
 */
#define MAX_FRAMES 10

/** @def MAX_REF
 *  @brief Maximum number of page references in a simulation.
 */
#define MAX_REF    50

/** @def EMPTY_PAGE
 *  @brief Value indicating an empty frame (no page loaded).
 */
#define EMPTY_PAGE (-1)
```

- **`MAX_FRAMES`**: número máximo de frames de memoria disponibles.  
- **`MAX_REF`**: número máximo de referencias de páginas en una simulación.  
- **`EMPTY_PAGE`**: valor que indica que un frame está vacío (sin página cargada).  

---

## Carpeta `build/`

Cuando se compila el proyecto, se crea automáticamente la carpeta `build/` con tres subcarpetas:

```
build/
├── bin/   # Binarios ejecutables (main, tests)
├── obj/   # Archivos objeto (.o) generados por cada fuente
└── log/   # Archivos de salida (.log) con resultados de ejecución
```

- **`bin/`**: contiene el ejecutable principal (`main`) y los binarios de pruebas unitarias.  
- **`obj/`**: guarda los objetos compilados de cada módulo (`memory.o`, `fifo.o`, `lru.o`).  
- **`log/`**: almacena los resultados de ejecución cuando se usa el target `run-save`.  

---

## Macros disponibles en el Makefile

El Makefile dentro de `src` define varios **targets** que automatizan la compilación y ejecución:

- `make all` → Compila todos los objetos y genera el binario principal en `build/bin/main`.  
- `make run` → Ejecuta el binario principal directamente.  
- `make run-save` → Ejecuta el binario y guarda la salida en `build/log/main.log`.  
- `make clean` → Elimina la carpeta `build/` completa.  

El Makefile dentro de `test` define varios **targets** que automatizan la compilación y ejecución:  
- `make all` → Compila los objetos en modo `UNIT_TEST` en `build/bin/test/`.  
- `make fifo-test` → Compila y ejecuta las pruebas unitarias de FIFO.  
- `make lru-test` → Compila y ejecuta las pruebas unitarias de LRU.  
- `make unit-tests` → Ejecuta todas las pruebas unitarias en secuencia.  
- `make clean` → Elimina la carpeta `build/bin/test` completa.  

---

## Algoritmos de reemplazo de páginas

### 1. FIFO (First-In, First-Out)
- **Idea**: Se reemplaza la página que lleva más tiempo en memoria (la primera que entró).  
- **Ejemplo gráfico** (3 frames, referencia `{1,2,3,4,1,2,5,1,2,3,4,5}`):  
  ```
  Estado final: [5,3,4]
  ```
- **Ventaja**: Simple de implementar.  
- **Desventaja**: Puede reemplazar páginas aún útiles, causando más fallos de página.  

---

### 2. LRU (Least Recently Used)
- **Idea**: Se reemplaza la página que no ha sido usada por más tiempo.  
- **Ejemplo gráfico** (3 frames, referencia `{1,2,3,4,1,2,5,1,2,3,4,5}`):  
  ```
  Estado final: [3,4,5]
  ```
- **Ventaja**: Se aproxima mejor al óptimo, minimizando fallos de página.  
- **Desventaja**: Requiere llevar registro del uso reciente de cada página.  

---

## Flujo de ejecución

1. El usuario define en `main.c`:  
   - Cadena de referencias de páginas (`reference_string`).  
   - Número de frames disponibles (`frame_count`).  
2. Se inicializan las estructuras de memoria (`frames`, `aux`, `last_used`).  
3. Se ejecutan los algoritmos:  
   - FIFO → resultados.  
   - LRU → resultados.  
4. Se imprimen los estados de los frames en cada paso y el estado final.  

---

## Objetivo didáctico

Este proyecto permite a los alumnos:  
- Comprender cómo funcionan los algoritmos de reemplazo de páginas en sistemas operativos.  
- Observar las diferencias entre FIFO y LRU en términos de fallos de página.  
- Practicar con código modular y reutilizable.  
- Aprender a estructurar proyectos en C con carpetas y Makefiles.  

---

**Autor:** Jesús Salvador López Ortega  
[LinkedIn](https://www.linkedin.com/in/jesus-salvador-lopez-ortega/) | [GitHub](https://github.com/chucholoport) | [Correo Institucional](mailto:jlopez@upsrj.edu.mx)  