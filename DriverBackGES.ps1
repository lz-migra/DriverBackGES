# Script de PowerShell para gestionar controladores: Backup y Restauración

# --- Bloque para solicitar permisos de Administrador ---
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    # Re-ejecuta el script con permisos de administrador
    Start-Process powershell.exe -ArgumentList "-ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

# --- Cargar la librería necesaria para el cuadro de diálogo ---
Add-Type -AssemblyName System.Windows.Forms

# --- Funciones ---
function Select-FolderDialog ($title) {
    $dialog = New-Object System.Windows.Forms.FolderBrowserDialog
    $dialog.Description = $title
    $result = $dialog.ShowDialog()

    if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
        return $dialog.SelectedPath
    } else {
        return $null
    }
}

function Create-Backup {
    Write-Host "Por favor, selecciona la carpeta donde guardar la copia de seguridad."
    $destinationPath = Select-FolderDialog "Selecciona la carpeta de destino para el Backup"

    if (-not $destinationPath) {
        Write-Host "Operación cancelada. No se seleccionó ninguna ruta."
        return
    }

    Write-Host "Iniciando la copia de seguridad de los controladores..."
    dism /online /export-driver /destination:$destinationPath

    Write-Host "Copia de seguridad completada."
    Write-Host "Los controladores se han guardado en: $destinationPath"
}

function Restore-Drivers {
    Write-Host "Por favor, selecciona la carpeta con la copia de seguridad de controladores."
    $sourcePath = Select-FolderDialog "Selecciona la carpeta de origen para la Restauración"

    if (-not $sourcePath) {
        Write-Host "Operación cancelada. No se seleccionó ninguna ruta."
        return
    }

    if (-Not (Test-Path "$sourcePath\*.inf")) {
        Write-Host "Error: No se encontraron archivos de controlador (.inf) en la ruta especificada."
        return
    }

    Write-Host "Iniciando la restauración de los controladores desde '$sourcePath'..."
    pnputil /add-driver "$sourcePath\*.inf" /subdirs /install

    Write-Host "Proceso de restauración completado. Es posible que debas reiniciar el sistema para que los cambios surtan efecto."
}

# --- Lógica Principal del Script ---
while ($true) {
    Write-Host "--- Menú de Gestión de Controladores ---"
    Write-Host "1. Crear copia de seguridad de controladores (Backup)"
    Write-Host "2. Restaurar controladores desde una copia de seguridad"
    Write-Host "3. Salir"
    Write-Host "----------------------------------------"

    $choice = Read-Host -Prompt "Ingresa tu elección (1, 2 o 3)"

    switch ($choice) {
        "1" {
            Create-Backup
        }
        "2" {
            Restore-Drivers
        }
        "3" {
            Write-Host "Saliendo del script. ¡Adiós!"
            break
        }
        default {
            Write-Host "Opción no válida. Por favor, elige 1, 2 o 3."
        }
    }
    Write-Host "`nPresiona Enter para continuar..."
    Read-Host | Out-Null
    Clear-Host
    
    if ($choice -eq "3") {
        Exit
    }
}
