Get-PSReadLineOption

$Esc = [char]0x1b

Write-Host "$Esc[1;31m[ Color Start ]$Esc[0m"

foreach ($i in 30..37) {
    Write-Host "$Esc[1;${i}mColor$Esc[0m"
}

foreach ($code in 0..255) {
    "{0,3} {1}" -f $code, "$Esc[38;5;${code}mColor$Esc[0m"
}

clang++ -std=c++23 -g -o bin\Demo.exe Main.cpp
.\bin\Demo.exe

$Original = $PSstyle.OutputRendering

$PsStyle.OutputRendering = "Ansi"
$String = Get-ChildItem | Select-Object -First 3 | Out-String

Write-Host $String
$PsStyle.OutputRendering = $Original
$String = Get-ChildItem | Select-Object -First 3 | Out-String
Write-Host $String

$output = "$($PSStyle.Foreground.BrightMagenta)Magenta$($PSStyle.ResetColor)`n$($PSStyle.Bold)Bold`n$($PSStyle.ResetColor)Normal`n$($PSStyle.Foreground.Red)Red$($PSStyle.ResetColor)"
Write-Host $output
