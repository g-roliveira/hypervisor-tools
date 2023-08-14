# Pfad zum Stammordner, in dem die Unterordner mit den Dateien liegen
$stammordner = "Pfad\Zum\Stammordner"

# Funktion zum Umbenennen von Dateien
function Umbenennen {
    param(
        [string]$ordnerpfad
    )

    $dateien = Get-ChildItem -File -Path $ordnerpfad -Recurse
    foreach ($datei in $dateien) {
        $iteration = $datei.BaseName.Substring(4, 1)
        if ($iteration -match '^\d+$' -and [int]$iteration -le 4) {
            $neuerName = "landscape_$iteration$($datei.Extension)"
            Rename-Item -Path $datei.FullName -NewName $neuerName
        }
    }
}

# Hauptteil des Skripts
Umbenennen -ordnerpfad $stammordner
