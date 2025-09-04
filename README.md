# DriverBackGES (Driver Backup & Gestion Script)

**DriverBackGES** es una herramienta esencial, simple y potente, diseñada para simplificar el proceso de **copia de seguridad y restauración de controladores** en cualquier sistema operativo Windows. Ideal para antes de una reinstalación limpia, para migrar tus drivers a un nuevo PC o simplemente para tener un respaldo de emergencia. Este script te permite decir adiós a la tediosa búsqueda manual de drivers en internet, ahorrándote tiempo y posibles problemas de compatibilidad.

## Características Principales

* **Copia de Seguridad (Backup) Completa**: Exporta todos los controladores de dispositivos de terceros instalados en tu sistema (tarjeta gráfica, audio, red, etc.) a una carpeta de tu elección. Utiliza la herramienta integrada de Windows **DISM**, garantizando que la copia de seguridad sea completa y precisa.

* **Restauración Rápida**: Instala automáticamente todos los controladores desde una copia de seguridad previamente guardada. El script se apoya en **PnPUtil**, la utilidad de Plug and Play de Windows, para que la instalación sea rápida y eficiente.

* **Interfaz Gráfica Amigable**: Olvídate de escribir rutas largas y propensas a errores. Al ejecutar el script, se abrirá un cuadro de diálogo gráfico que te permite navegar y seleccionar la carpeta de destino o de origen de manera visual y sencilla.

* **Menú Interactivo**: El script presenta un menú claro e interactivo al inicio, dándote la opción de elegir entre "Backup" y "Restauración", lo que hace que su uso sea intuitivo incluso para usuarios principiantes.

---

## Cómo Usar el Script

### **1. Ejecución Local (Método Clásico)**

1. Descarga el archivo `DriverBackGES.ps1` desde este repositorio.
2. Abre **PowerShell** como administrador.
3. Navega a la carpeta donde guardaste el script.
4. Ejecuta:

```powershell
.\DriverBackGES.ps1
```

5. Sigue las instrucciones del menú interactivo.

---

### **2. Ejecución Remota (Directa desde GitHub)**

Si deseas ejecutar el script directamente desde la web **sin descargarlo manualmente**, puedes hacerlo con el siguiente comando en PowerShell (como administrador):

```powershell
iwr -UseBasicParsing "https://raw.githubusercontent.com/lz-migra/DriverBackGES/refs/heads/main/DriverBackGES.ps1" | iex
```

> ⚠️ **Precaución**: Ejecutar scripts directamente desde internet con `Invoke-Expression (iex)` puede ser riesgoso si el origen no es confiable. Este método solo debe usarse con repositorios de confianza.

---

### Solución de Problemas

Si recibes un error de ejecución debido a la política de PowerShell:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

Luego, vuelve a ejecutar el script.

---

## Preguntas Frecuentes

**P: ¿Qué controladores se incluyen en la copia de seguridad?**
**R:** Todos los controladores de terceros. Los controladores nativos de Windows no se incluyen, ya que se restauran automáticamente.

**P: ¿Puedo usar la copia de seguridad en otra versión de Windows?**
**R:** Generalmente sí, mientras la arquitectura (32/64 bits) sea compatible. Se recomienda usar la misma versión o posterior de Windows.

**P: ¿El script modifica mi sistema?**
**R:** No, solo lee los controladores y los instala en la restauración. No altera archivos críticos del sistema.

**P: ¿Cómo sé si la restauración fue exitosa?**
**R:** Verifica en el **Administrador de Dispositivos** que no haya "dispositivos desconocidos" con signos de admiración amarillos.

---

💡 **Tip del Autor**: Yo uso DriverBackGES para gestionar los controladores de mis equipos, especialmente porque formateo y reinstalo Windows con frecuencia.

---
