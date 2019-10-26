If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]'Administrator')) {
    Write-Host "Admin privilages are required. This script will self elevate to run as an Administrator and continue."
    Start-Sleep 3

    Start-Process powershell.exe -ArgumentList ("-NoProfile -ExecutionPolicy Bypass -File `"{0}`"" -f $PSCommandPath) -Verb RunAs
    Exit
}

function downloadFile($url, $targetFile)
{
    "Downloading $url"
    $uri = New-Object "System.Uri" "$url"
    $request = [System.Net.HttpWebRequest]::Create($uri)
    $request.set_Timeout(15000) #15 second timeout
    $response = $request.GetResponse()
    $totalLength = [System.Math]::Floor($response.get_ContentLength()/1024)
    $responseStream = $response.GetResponseStream()
    $targetStream = New-Object -TypeName System.IO.FileStream -ArgumentList $targetFile, Create
    $buffer = new-object byte[] 800KB
    $count = $responseStream.Read($buffer,0,$buffer.length)
    $downloadedBytes = $count
    while ($count -gt 0)
    {
        [System.Console]::CursorLeft = 0
        [System.Console]::Write("Downloaded {0}K of {1}K", [System.Math]::Floor($downloadedBytes/1024), $totalLength)
        $targetStream.Write($buffer, 0, $count)
        $count = $responseStream.Read($buffer,0,$buffer.length)
        $downloadedBytes = $downloadedBytes + $count
    }
    "Finished Download"
    $targetStream.Flush()
    $targetStream.Close()
    $targetStream.Dispose()
    $responseStream.Dispose()
}
Write-Output "Downloading Docker...."
downloadFile "https://download.docker.com/win/stable/Docker%20for%20Windows%20Installer.exe" "$env:TEMP\docker.exe"

$pathvargs = "$env:TEMP\Docker.exe"
Invoke-Command -ScriptBlock $pathvargs

Write-Output "Downloading Docker-CLI...."
Invoke-WebRequest "https://master.dockerproject.org/windows/x86_64/docker.zip" -OutFile "$env:TEMP\docker.zip" -UseBasicParsing
 
Clear-Host

Write-Output "Unpacking Docker-CLI...."
Expand-Archive -Path "$env:TEMP\docker.zip" -DestinationPath $env:ProgramFiles -Force
Start-Sleep 1.5
Clear-Host

$env:path += ";$env:ProgramFiles\Docker"
 
$Path = [Environment]::GetEnvironmentVariable("Path",[System.EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable("Path", $Path + ";$env:ProgramFiles\Docker", [EnvironmentVariableTarget]::Machine)
	
docker -v

docker run hello-world

Pause

docker pull tiltedphoques/st-game-server

docker run --restart always -p 10578:10578/udp tiltedphoques/st-game-server

Pause
