function DownloadFile($url, $targetFile)

{

   $uri = New-Object "System.Uri" "$url"

   $request = [System.Net.HttpWebRequest]::Create($uri)

   $request.set_Timeout(15000) #15 second timeout

   $response = $request.GetResponse()

   $totalLength = [System.Math]::Floor($response.get_ContentLength()/1024)

   $responseStream = $response.GetResponseStream()

   $targetStream = New-Object -TypeName System.IO.FileStream -ArgumentList $targetFile, Create

   $buffer = new-object byte[] 3MB

   $count = $responseStream.Read($buffer,0,$buffer.length)

   $downloadedBytes = $count

   while ($count -gt 0)

   {

       $targetStream.Write($buffer, 0, $count)

       $count = $responseStream.Read($buffer,0,$buffer.length)

       $downloadedBytes = $downloadedBytes + $count

       Write-Progress -activity "Downloading file '$($url.split('/') | Select-Object -Last 1)'" -status "Downloaded ($([System.Math]::Floor($downloadedBytes/1024))K of $($totalLength)K): " -PercentComplete ((([System.Math]::Floor($downloadedBytes/1024)) / $totalLength)  * 100)

   }

   Write-Progress -activity "Finished downloading file '$($url.split('/') | Select-Object -Last 1)'"

   $targetStream.Flush()

   $targetStream.Close()

   $targetStream.Dispose()

   $responseStream.Dispose()

}

Write-Output "
A SkyrimTogether auto installation tool.

Made by:
          
 :::::::: ::::::::::: :::    ::: :::::::::: ::::::::: :::::::   :::::::  
:+:    :+:    :+:     :+:   :+:  :+:             :+: :+:   :+: :+:   :+: 
+:+           +:+     +:+  +:+   +:+            +:+  +:+  :+:+ +:+  :+:+ 
+#+           +#+     +#++:++    +#++:++#      +#+   +#+ + +:+ +#+ + +:+ 
+#+           +#+     +#+  +#+   +#+          +#+    +#+#  +#+ +#+#  +#+ 
#+#    #+#    #+#     #+#   #+#  #+#         #+#     #+#   #+# #+#   #+# 
 ######## ########### ###    ### ########## ######### #######   #######                                          

                                                     
"
pause
New-Item -Path 'C:\SkyrimTogether' -ItemType Directory
Clear-Host

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
downloadFile "https://github.com/SkyrimTogether/issues-launcher/releases/download/v1.0.6/Harbor-1.0.6.exe" "C:\SkyrimTogether\Harbor-1.0.6.exe"

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
downloadFile "https://github.com/cikeZ00/STInstaller/raw/master/Server.exe" "C:\SkyrimTogether\Server.exe"

$pathvargs = {C:\SkyrimTogether\Harbor-1.0.6.exe /S /v/qn }
Invoke-Command -ScriptBlock $pathvargs

Write-Output "Installation complete!"

$input = read-host "Do you want to start the server? Yes or No (Default: Yes)"
if ($input -eq 'yes'){
    Start-Process -FilePath "C:\SkyrimTogether\Server.exe"
}elseif($input -eq 'no'){
    Write-Output "Alright, the server should be located in skyrim/server when you install ST"
    Remove-Item "C:\SkyrimTogether\Server.exe"
}else{
    Start-Process -FilePath "C:\SkyrimTogether\Server.exe"
    }
Start-Sleep 4
Clear-Host

Write-Output "Starting Harbor"
Start-Process -FilePath "C:\Program Files (x86)\Tilted` Phoques\Harbor\Harbor.exe"