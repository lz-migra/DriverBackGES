# DriverBackGES (Driver Backup & Gestion Script)

**DriverBackGES** es una herramienta esencial, simple y potente, diseñada para simplificar el proceso de **copia de seguridad y restauración de controladores** en cualquier sistema operativo Windows. Ideal para antes de una reinstalación limpia, para migrar tus drivers a un nuevo PC o simplemente para tener un respaldo de emergencia. Este script te permite decir adiós a la tediosa búsqueda manual de drivers en internet, ahorrándote tiempo y posibles problemas de compatibilidad.

## Características Principales

  * **Copia de Seguridad (Backup) Completa**: Exporta todos los controladores de dispositivos de terceros instalados en tu sistema (tarjeta gráfica, audio, red, etc.) a una carpeta de tu elección. Utiliza la herramienta integrada de Windows **DISM**, garantizando que la copia de seguridad sea completa y precisa.

  * **Restauración Rápida**: Instala automáticamente todos los controladores desde una copia de seguridad previamente guardada. El script se apoya en **PnPUtil**, la utilidad de Plug and Play de Windows, para que la instalación sea rápida y eficiente.

  * **Interfaz Gráfica Amigable**: Olvídate de escribir rutas largas y propensas a errores. Al ejecutar el script, se abrirá un cuadro de diálogo gráfico que te permite navegar y seleccionar la carpeta de destino o de origen de manera visual y sencilla.

  * **Menú Interactivo**: El script presenta un menú claro e interactivo al inicio, dándote la opción de elegir entre "Backup" y "Restauración", lo que hace que su uso sea intuitivo incluso para usuarios principiantes.

-----

## Cómo Usar el Script

1.  **Descarga el Script**: Clona este repositorio o descarga el archivo `.ps1` directamente.

2.  **Ejecútalo como Administrador**: Haz clic derecho sobre el archivo y selecciona "Ejecutar con PowerShell". Para una máxima compatibilidad, se recomienda abrir el **Terminal de Windows** o **PowerShell como administrador**, navegar a la carpeta donde guardaste el script y ejecutarlo con el siguiente comando:

    ```powershell
    .\DriverBackGES.ps1
    ```

3.  **Sigue las Instrucciones**:

      * Un menú te dará las opciones 1 (Backup), 2 (Restaurar) y 3 (Salir).
      * Si eliges **1**, se abrirá un cuadro de diálogo para que selecciones la carpeta donde guardar la copia de seguridad.
      * Si eliges **2**, se abrirá un cuadro de diálogo para que selecciones la carpeta donde se encuentra tu copia de seguridad.
      * El script mostrará el progreso en la consola y te notificará cuando el proceso haya finalizado.

### Solución de Problemas

Si recibes un error que indica que no puedes ejecutar el script, es posible que la política de ejecución de PowerShell esté restringida. Puedes solucionarlo temporalmente abriendo PowerShell como administrador y ejecutando este comando:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

-----

## Preguntas Frecuentes

**P: ¿Qué controladores se incluyen en la copia de seguridad?**
**R:** El script, usando **DISM**, exporta todos los controladores de terceros instalados en tu sistema. No se incluyen los controladores nativos de Microsoft que vienen preinstalados con Windows, ya que estos se restauran automáticamente.

**P: ¿Puedo usar la copia de seguridad en una versión diferente de Windows?**
**R:** Generalmente, sí. Un driver de un dispositivo es compatible con una arquitectura de sistema (32-bit o 64-bit) y no con una versión específica de Windows. Sin embargo, se recomienda usar la copia de seguridad en la misma versión o en una versión posterior (por ejemplo, de Windows 10 a Windows 11).

**P: ¿El script modifica algo en mi sistema?**
**R:** El script solo lee los controladores del sistema para la copia de seguridad y los instala en la restauración. No modifica archivos del sistema ni configuraciones críticas.

**P: ¿Cómo sé si la restauración funcionó?**
**R:** Puedes ir al **Administrador de Dispositivos** de Windows. Si todos los dispositivos tienen controladores instalados correctamente y no hay "dispositivos desconocidos" con un signo de admiración amarillo, la restauración fue exitosa.

NOTA FINAL: YO LO USO PARA GESTIONAR LOS CONTROLADORES DE MIS EQUIPOS, YA ME LOS FORMATEO MUY FRECUENTEMENTE.
