$ErrorActionPreference = 'Stop'
$version = '9.8.2'
$expectedHash = '21bd5da2de49b642904077f38c0efdc7778e92b3ed0889392dca61b97e389607'
$base = Join-Path $env:USERPROFILE '.gradle\hello-world-distributions'
$gradleHome = Join-Path $base "gradle-$version"
$archive = Join-Path $base "gradle-$version-bin.zip"
$url = "https://services.gradle.org/distributions/gradle-$version-bin.zip"

if (Test-Path (Join-Path $gradleHome 'bin\gradle.bat')) { exit 0 }
New-Item -ItemType Directory -Path $base -Force | Out-Null
try {
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    Invoke-WebRequest -Uri $url -OutFile $archive -UseBasicParsing
    $actualHash = (Get-FileHash -Path $archive -Algorithm SHA256).Hash.ToLowerInvariant()
    if ($actualHash -ne $expectedHash) { throw 'Gradle download checksum mismatch.' }
    Expand-Archive -Path $archive -DestinationPath $base -Force
    if (-not (Test-Path (Join-Path $gradleHome 'bin\gradle.bat'))) {
        throw 'Gradle archive extraction failed.'
    }
} catch {
    Write-Error "Could not set up Gradle: $_"
    exit 1
} finally {
    if (Test-Path $archive) { Remove-Item $archive -Force }
}
