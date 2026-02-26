# Práctica: Pipes, ejecución en segundo plano y encadenamiento condicional

## 1. Descripción General

Esta práctica tiene como objetivo reforzar conceptos fundamentales del entorno GNU/Linux relacionados con:

* Uso de **pipes (`|`)**
* Ejecución de procesos en **segundo plano (`&`)**
* **Encadenamiento condicional (`&&`)**
* Procesamiento de archivos de log mediante utilidades estándar de Unix

El estudiante deberá completar la sección `TODO` dentro del archivo `practice.sh`.

Todas las salidas generadas en cada paso **deben ser redirigidas al archivo definido por la variable `$OUT_LOG`**.

---

## 2. Objetivos de Aprendizaje

Al finalizar la práctica, el estudiante será capaz de:

* Procesar archivos de log usando `grep`, `awk`, `sort`, `cut` y herramientas similares.
* Encadenar comandos mediante pipes.
* Ejecutar procesos en segundo plano.
* Aplicar ejecución condicional entre comandos.
* Utilizar expresiones regulares para filtrar datos estructurados (por ejemplo, direcciones IP).
* Redirigir correctamente la salida de comandos.

---

## 3. Estructura del Script

El script proporcionado inicializa la configuración y prepara el directorio de salida:

```bash
source "../config/config.sh"
mkdir -p $OUT_DIR
echo > $OUT_LOG
```

El estudiante debe implementar los 20 puntos del `TODO`, asegurando que:

* Cada comando escriba su salida en `$OUT_LOG`.
* Se utilicen correctamente pipes cuando se requiera.
* Se empleen operadores `&&` o `&` cuando la instrucción lo indique.
* Se respeten las indicaciones sobre concatenación y filtrado.

---

## 4. Operadores Clave del Shell

### 4.1 Pipe (`|`)

El operador pipe redirige la **salida estándar (stdout)** de un comando hacia la **entrada estándar (stdin)** de otro comando.

```
Comando A → (stdout) → | → (stdin) → Comando B
```

---

### 4.2 Ejecución en segundo plano (`&`)

El operador `&` permite ejecutar un proceso en segundo plano, liberando la terminal para seguir ejecutando otros comandos.

Aplicaciones típicas:

* Procesos largos
* Tareas paralelas
* Monitoreo continuo

---

### 4.3 Encadenamiento condicional (`&&`)

El operador `&&` ejecuta el segundo comando **solo si el primero finaliza exitosamente** (código de salida 0).

---

## 5. Comandos a Utilizar

### 5.1 `grep`

Permite buscar patrones dentro de archivos de texto.

Opciones comunes:

* `-i` → Ignorar mayúsculas/minúsculas
* `-v` → Invertir coincidencia
* `-E` → Expresiones regulares extendidas
* `-c` → Contar coincidencias

---

### 5.2 `wc`

Cuenta líneas, palabras o bytes.

* `-l` → Cuenta líneas

---

### 5.3 `awk`

Herramienta de procesamiento de texto basada en patrones y campos.

Permite:

* Extraer columnas
* Procesar logs estructurados
* Filtrar y transformar datos

---

### 5.4 `cut`

Extrae campos específicos de líneas estructuradas.

---

### 5.5 `sort`

Ordena líneas alfabética o numéricamente.

---

### 5.6 `uniq`

Elimina líneas repetidas consecutivas (normalmente usado después de `sort`).

---

### 5.7 Expresiones Regulares

Permiten definir patrones estructurados, como direcciones IP.

---

## 6. Referencia Oficial UNIX

Para documentación formal y estándar:

The Open Group Base Specifications (POSIX / UNIX Standard):
[https://pubs.opengroup.org/onlinepubs/9699919799/](https://pubs.opengroup.org/onlinepubs/9699919799/)

También pueden consultarse las páginas de manual locales:

```bash
man grep
man awk
man wc
man sort
```

**Autor:** Jesús Salvador López Ortega
[LinkedIn](https://www.linkedin.com/in/jesus-salvador-lopez-ortega/) | [GitHub](https://github.com/chucholoport) | [Correo Institucional](mailto:jlopez@upsrj.edu.mx)