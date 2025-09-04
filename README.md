¡Perfecto 🚀!
Te armé una adaptación de esa descripción pero para nuestro proyecto **MHTML2Files** (el extractor de snapshots en MHTML que desarrollamos).

---

# MHTML2Files (Extractor de Snapshots MHTML)

**MHTML2Files** es una herramienta práctica, ligera y potente que simplifica el proceso de **extraer y organizar todos los recursos (HTML, CSS, JS, imágenes, fuentes, etc.) contenidos en un archivo `.mhtml`**. Ideal para desarrolladores web, archivistas digitales o cualquier persona que quiera inspeccionar y reutilizar páginas web guardadas en formato MHTML.

Este proyecto surge para resolver un problema común: los navegadores guardan las páginas en `.mhtml` como un único archivo, y acceder a los recursos internos (que aparecen como `@mhtml.blink`) de forma manual es tedioso. Con **MHTML2Files**, todo se desempaqueta automáticamente en carpetas listas para usar.

---

## Características Principales

* **Extracción Completa**: Convierte cualquier archivo `.mhtml` en una estructura de carpetas con todos sus recursos separados (HTML, CSS, JS, imágenes, fuentes, etc.).

* **Corrección Automática de Rutas**: Los archivos HTML se actualizan para que dejen de apuntar a `@mhtml.blink` y enlacen correctamente a los recursos extraídos.

* **Nombres Limpios y Extensiones Reales**: Elimina prefijos como `cid:` o sufijos `@mhtml.blink`, reemplazando por extensiones reales en base al tipo MIME (`.css`, `.js`, `.png`, etc.).

* **Compatibilidad Universal**: Funciona con cualquier archivo `.mhtml` generado en navegadores modernos como Chrome, Edge u Opera.

* **Interfaz Gráfica Sencilla (PowerShell)**: Incluye un script `.ps1` que permite seleccionar los archivos `.mhtml` de forma visual, sin necesidad de escribir rutas manualmente.

---

## Cómo Usar el Script

### **1. Ejecución Local (Método Clásico)**

1. Descarga el archivo `MHTML2Files.ps1` desde este repositorio.
2. Abre **PowerShell**.
3. Navega a la carpeta donde guardaste el script.
4. Ejecuta:

```powershell
.\MHTML2Files.ps1
```

5. Selecciona el archivo `.mhtml` a procesar.
6. Se creará una carpeta con todos los recursos extraídos.

---

### **2. Ejecución Remota (Directa desde GitHub)**

Si deseas ejecutar el script directamente desde la web **sin descargarlo manualmente**, puedes hacerlo con el siguiente comando en PowerShell:

```powershell
iwr -UseBasicParsing "https://raw.githubusercontent.com/lz-migra/MHTML2Files/refs/heads/main/MHTML2Files.ps1" | iex
```

> ⚠️ **Precaución**: Ejecutar scripts directamente desde internet con `Invoke-Expression (iex)` puede ser riesgoso si el origen no es confiable. Usa este método solo con repositorios de confianza.

---

## Solución de Problemas

Si PowerShell bloquea la ejecución del script:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

Luego, vuelve a ejecutar el script.

---

## Preguntas Frecuentes

**P: ¿Qué archivos extrae el script?**
**R:** Todos los recursos incrustados en el `.mhtml` (HTML, CSS, JS, imágenes, fuentes, etc.).

**P: ¿Puedo usarlo con varios archivos `.mhtml` a la vez?**
**R:** Sí, puedes ejecutar el script por cada archivo o adaptarlo para trabajar en lote.

**P: ¿El script modifica mi sistema?**
**R:** No, solo lee el `.mhtml` y extrae su contenido en carpetas nuevas.

**P: ¿Cómo sé que los recursos quedaron bien enlazados?**
**R:** Abre el HTML extraído en tu navegador. Deberías ver la página renderizada correctamente con todos sus estilos e imágenes.
