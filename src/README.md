# Proyecto de Simulación de Algoritmos de Planificación de Procesos

Este proyecto permite simular distintos **algoritmos de planificación de procesos** en sistemas operativos (FCFS, SJF y Round Robin). La infraestructura está organizada en carpetas para separar la lógica de procesos, los algoritmos de planificación y los binarios generados.

---

## Infraestructura del proyecto

```
src/
├── main.c                # Punto de entrada del programa
├── process/              # Definición y utilidades del struct Process
│   └── process.c/.h
└── sched/                # Algoritmos de planificación
    ├── fcfs/             # First Come, First Served
    │   └── fcfs.c/.h
    ├── sjf/              # Shortest Job First
    │   └── sjf.c/.h
    └── rr/               # Round Robin
        └── rr.c/.h
```

- **`process/`**: Contiene la definición del `struct Process` y funciones auxiliares para inicializar, leer y verificar procesos.  
- **`sched/`**: Cada subcarpeta implementa un algoritmo de planificación distinto:
  - `fcfs/`: First Come, First Served.
  - `sjf/`: Shortest Job First.
  - `rr/`: Round Robin.

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
- **`obj/`**: guarda los objetos compilados de cada módulo (`process.o`, `fcfs.o`, etc.).  
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
- `make fcfs-test` → Compila y ejecuta las pruebas unitarias de FCFS.  
- `make sjf-test` → Compila y ejecuta las pruebas unitarias de SJF.  
- `make rr-test` → Compila y ejecuta las pruebas unitarias de Round Robin.  
- `make unit-tests` → Ejecuta todas las pruebas unitarias en secuencia.
- `make clean` → Elimina la carpeta `build/bin/test` completa. 

---

## Algoritmos de planificación

### 1. FCFS (First Come, First Served)
- **Idea**: Los procesos se atienden en el orden en que llegan.  
- **Ejemplo gráfico**:
  ```
  Tiempo: 0   1   2   3   4   5   6
          |---P1---|---P2---|--P3--|
  ```
- **Ventaja**: Simple y justo en orden de llegada.  
- **Desventaja**: Puede causar *efecto convoy* (procesos cortos esperando a uno largo).

---

### 2. SJF (Shortest Job First)
- **Idea**: Se atienden primero los procesos con menor tiempo de ejecución.  
- **Ejemplo gráfico**:
  ```
  Tiempo: 0   1   2   3   4   5   6
          |--P2--|--P3--|----P1----|
  ```
- **Ventaja**: Minimiza el tiempo promedio de espera.  
- **Desventaja**: Puede causar inanición de procesos largos.

---

### 3. RR (Round Robin)
- **Idea**: Cada proceso recibe un *quantum* de CPU en ciclos.  
- **Ejemplo gráfico** (quantum = 2):
  ```
  Tiempo: 0   1   2   3   4   5   6   7   8
          |P1|P2|P3|P1|P2|P3|P1|P2|...
  ```
- **Ventaja**: Justo y equitativo, ideal para sistemas interactivos.  
- **Desventaja**: El rendimiento depende del tamaño del quantum.

---

## El `struct Process`

Definido en `process/process.h`:

```c
typedef struct {
    int id;             // Identificador único del proceso
    int arrival_time;   // Tiempo de llegada
    int burst_time;     // Tiempo de ejecución requerido
    int completion_time;// Tiempo en que termina
    int waiting_time;   // Tiempo en espera
    int turnaround_time;// Tiempo total (completion - arrival)
    int remaining_time; // Tiempo restante (para RR)
} Process;
```

- **`id`**: número del proceso (P1, P2, …).  
- **`arrival_time`**: cuándo llega al sistema.  
- **`burst_time`**: cuánto tarda en ejecutarse.  
- **`completion_time`**: cuándo termina.  
- **`waiting_time`**: cuánto tiempo estuvo esperando.  
- **`turnaround_time`**: tiempo total desde llegada hasta finalización.  
- **`remaining_time`**: usado en Round Robin para controlar el quantum.

---

## Flujo de ejecución

1. El usuario ingresa:
   - Número de procesos.
   - Quantum para Round Robin.
2. Se leen los procesos y se inicializan.
3. Se ejecutan los tres algoritmos:
   - FCFS → resultados.
   - SJF → resultados.
   - RR → resultados.
4. Se imprimen tablas comparativas con tiempos de espera y turnaround.

---

## Objetivo didáctico

Este proyecto permite a los alumnos:
- Comprender cómo se implementan distintos algoritmos de planificación.  
- Observar las diferencias en tiempos de espera y turnaround.  
- Practicar con código modular y reutilizable.  
- Aprender a estructurar proyectos en C con carpetas y Makefiles.  

---

**Autor:** Jesús Salvador López Ortega
[LinkedIn](https://www.linkedin.com/in/jesus-salvador-lopez-ortega/) | [GitHub](https://github.com/chucholoport) | [Correo Institucional](mailto:jlopez@upsrj.edu.mx)