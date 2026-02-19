# Script para mover e renomear imagens de assets/ para assets/img/
# Execute na raiz do projeto: .\assets\images\mover-imagens.ps1

$assets = Join-Path $PSScriptRoot ".."
$dest = Join-Path $assets "img"
if (-not (Test-Path $dest)) { New-Item -ItemType Directory -Path $dest -Force | Out-Null }

$map = @{
    "9f023d8e-7464-4eea-9789-18f1b0_f8655a97e45a.webp" = "laboratorio-medico.webp"
    "7d3d7aa0-9b80-49e5-94f8-4b8527_81892e210b37.jpg" = "consulta-medico-paciente.jpg"
    "photo-1612349317150-e413f6a5b1_a4fe4a0f4738.avif" = "avatar-equipe-1.avif"
    "photo-1612531386530-97286d97c2_02f597743435.avif" = "avatar-equipe-2.avif"
    "5d0296a8-c467-44ef-9d51-ce4ee3_70f671a6e3f5.webp" = "avatar-michael.webp"
    "c6ec4622-d827-4c9e-9744-0c24c8_11a0e78f541c.webp" = "avatar-sarah.webp"
}

foreach ($old in $map.Keys) {
    $origem = Join-Path $assets $old
    $novo = Join-Path $dest $map[$old]
    if (Test-Path $origem) {
        Copy-Item $origem $novo -Force
        Write-Host "OK: $old -> img/$($map[$old])"
    }
    else {
        Write-Host "Arquivo nao encontrado: $old"
    }
}

Write-Host "Concluido. Verifique assets/img/"
