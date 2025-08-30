# ============================
# Script de PowerShell para gestionar controladores: Backup y Restauracion
# ============================

# Forzar que la consola interprete UTF-8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# --- Verificar si el script se esta ejecutando como Administrador ---
If (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Add-Type -AssemblyName System.Windows.Forms
    [System.Windows.Forms.MessageBox]::Show(
        "Este script necesita ejecutarse como Administrador. Por favor, abre PowerShell/Terminal como Administrador y vuelve a ejecutar el script.",
        "Permisos insuficientes",
        [System.Windows.Forms.MessageBoxButtons]::OK,
        [System.Windows.Forms.MessageBoxIcon]::Warning
    )
    Exit
}

# --- Cargar la libreria necesaria para el cuadro de dialogo ---
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
        Write-Host "Operacion cancelada. No se selecciono ninguna ruta."
        return
    }

    Write-Host "Iniciando la copia de seguridad de los controladores..."
    dism /online /export-driver /destination:$destinationPath

    Write-Host "Copia de seguridad completada."
    Write-Host "Los controladores se han guardado en: $destinationPath"
}

function Restore-Drivers {
    Write-Host "Por favor, selecciona la carpeta con la copia de seguridad de controladores."
    $sourcePath = Select-FolderDialog "Selecciona la carpeta de origen para la Restauracion"

    if (-not $sourcePath) {
        Write-Host "Operacion cancelada. No se selecciono ninguna ruta."
        return
    }

    if (-Not (Test-Path "$sourcePath\*.inf")) {
        Write-Host "Error: No se encontraron archivos de controlador (.inf) en la ruta especificada."
        return
    }

    Write-Host "Iniciando la restauracion de los controladores desde '$sourcePath'..."
    pnputil /add-driver "$sourcePath\*.inf" /subdirs /install

    Write-Host "Proceso de restauracion completado. Es posible que debas reiniciar el sistema para que los cambios surtan efecto."
}

# --- Logica Principal del Script ---
while ($true) {
    Write-Host "--- Menu de Gestion de Controladores ---"
    Write-Host "1. Crear copia de seguridad de controladores (Backup)"
    Write-Host "2. Restaurar controladores desde una copia de seguridad"
    Write-Host "3. Salir"
    Write-Host "----------------------------------------"

    $choice = Read-Host -Prompt "Ingresa tu eleccion (1, 2 o 3)"

    switch ($choice) {
        "1" {
            Create-Backup
        }
        "2" {
            Restore-Drivers
        }
        "3" {
            Write-Host "Saliendo del script. ¡Adios!"
            break
        }
        default {
            Write-Host "Opcion no valida. Por favor, elige 1, 2 o 3."
        }
    }
    Write-Host "`nPresiona Enter para continuar..."
    Read-Host | Out-Null
    Clear-Host
    
    # La solucion para salir del script al presionar 3. 
    if ($choice -eq "3") {
        Exit
    }
}
