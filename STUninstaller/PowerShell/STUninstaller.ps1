Write-Output "
SkyrimTogether uninstallation tool.

Made by:
          
 :::::::: ::::::::::: :::    ::: :::::::::: ::::::::: :::::::   :::::::  
:+:    :+:    :+:     :+:   :+:  :+:             :+: :+:   :+: :+:   :+: 
+:+           +:+     +:+  +:+   +:+            +:+  +:+  :+:+ +:+  :+:+ 
+#+           +#+     +#++:++    +#++:++#      +#+   +#+ + +:+ +#+ + +:+ 
+#+           +#+     +#+  +#+   +#+          +#+    +#+#  +#+ +#+#  +#+ 
#+#    #+#    #+#     #+#   #+#  #+#         #+#     #+#   #+# #+#   #+# 
 ######## ########### ###    ### ########## ######### #######   #######                                          

                                                     
"
Write-Output "Press any key to continue..."
[void][System.Console]::ReadKey($true)
Clear-Host

Write-Output "This file NEEDS to be placed within your Skyrim Directory with TESV.exe or SkyrimSE.exe."
Write-Output "It will delete the following files and folders, you will NOT be able to retrieve them."
Write-Output " "
Write-Output "\Data\meshes\Interface\logo\logo.nif"
Write-Output "\Data\Online"
Write-Output "\locales"
Write-Output "\swiftshader"
Write-Output "cef.pak"
Write-Output "cef_100_percent.pak"
Write-Output "cef_200_percent.pak"
Write-Output "cef_extensions.pak"
Write-Output "chrome_elf.dll "
Write-Output "d3dcompiler_43.dll"
Write-Output "d3dcompiler_47.dll"
Write-Output "devtools_resources.pak"
Write-Output "icudtl.dat"
Write-Output "libcef.dll"
Write-Output "libEGL.dll"
Write-Output "libGLESv2.dll"
Write-Output "natives_blob.bin"
Write-Output "SkyrimTogether.dll"
Write-Output "snapshot_blob.bin"
Write-Output "st_loader.exe"
Write-Output "st_process.exe"
Write-Output "v8_context_snapshot.bin"
Write-Output "\logs"
Write-Output "\cache"
Write-Output "\x64"
Write-Output "\x32"
Write-Output "\x86"
Write-Output "\lex"
Write-Output "\server"
Write-Output " "
Write-Output "This file NEEDS to be placed within your Skyrim Directory with TESV.exe or SkyrimSE.exe."
Write-Output "It will delete the entirety of the previous list of files and folders, you will NOT be able to retrieve them."
Write-Output ""
Write-Output "Press any key to continue..."
[void][System.Console]::ReadKey($true)
Clear-Host

Remove-Item "Data\Online" -Recurse
Remove-Item "locales" -Recurse
Remove-Item "swiftshader" -Recurse
Remove-Item "cef.pak" 
Remove-Item "cef_100_percent.pak" 
Remove-Item "cef_200_percent.pak" 
Remove-Item "cef_extensions.pak" 
Remove-Item "chrome_elf.dll" 
Remove-Item "d3dcompiler_43.dll" 
Remove-Item "d3dcompiler_47.dll" 
Remove-Item "devtools_resources.pak"
Remove-Item "icudtl.dat" 
Remove-Item "libcef.dll" 
Remove-Item "libEGL.dll" 
Remove-Item "libGLESv2.dll" 
Remove-Item "natives_blob.bin" 
Remove-Item "SkyrimTogether.dll" 
Remove-Item "snapshot_blob.bin" 
Remove-Item "st_loader.exe" 
Remove-Item "st_process.exe" 
Remove-Item "v8_context_snapshot.bin" 
Remove-Item "logs" -Recurse 
Remove-Item "cache" -Recurse
Remove-Item "server" -Recurse
Write-Output "Press any key to continue..."
[void][System.Console]::ReadKey($true)
Clear-Host

$input = read-host "Do you want to remove the SkyrimTogether Logo? Yes or No  (Default: Yes)"
if ($input -eq 'yes'){
    Write-Output "Removing logo..."
    Remove-Item "Data\meshes\Interface\logo\logo.nif" 
    Write-Output "Done!"
}elseif($input -eq 'no'){
    Write-Output "The logo wont be removed"
}else{
    Write-Output "Removing logo..."
    Remove-Item "Data\meshes\Interface\logo\logo.nif" 
    Write-Output "Done!"
    Start-Sleep 3
    Clear-Host
    }
Write-Output " "
Write-Output "SkyrimTogether has been uninstalled!"
Write-Output "Press any key to end..."
[void][System.Console]::ReadKey($true)

