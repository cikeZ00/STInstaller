Echo "
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
Pause
clear

echo "This file NEEDS to be placed within your Skyrim Directory with TESV.exe or SkyrimSE.exe."
echo "It will delete the following files and folders, you will NOT be able to retrieve them."
echo " "
echo "\Data\meshes\Interface\logo\logo.nif"
echo "\Data\Online"
echo "\locales"
echo "\swiftshader"
echo "cef.pak"
echo "cef_100_percent.pak"
echo "cef_200_percent.pak"
echo "cef_extensions.pak"
echo "chrome_elf.dll "
echo "d3dcompiler_43.dll"
echo "d3dcompiler_47.dll"
echo "devtools_resources.pak"
echo "icudtl.dat"
echo "libcef.dll"
echo "libEGL.dll"
echo "libGLESv2.dll"
echo "natives_blob.bin"
echo "SkyrimTogether_r.dll"
echo "snapshot_blob.bin"
echo "st_loader_r.exe"
echo "st_process_r.exe"
echo "v8_context_snapshot.bin"
echo "\logs"
echo "\cache"
echo "\x64"
echo "\x32"
echo "\x86"
echo "\lex"
echo "\server"
echo " "
echo "This file NEEDS to be placed within your Skyrim Directory with TESV.exe or SkyrimSE.exe."
echo "It will delete the entirety of the previous list of files and folders, you will NOT be able to retrieve them."
echo ""
pause
clear

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
Remove-Item "SkyrimTogether_r.dll" 
Remove-Item "snapshot_blob.bin" 
Remove-Item "st_loader_r.exe" 
Remove-Item "st_process_r.exe" 
Remove-Item "v8_context_snapshot.bin" 
Remove-Item "logs" -Recurse 
Remove-Item "cache" -Recurse
Remove-Item "server" -Recurse

$input = read-host "Do you want to remove the SkyrimTogether Logo? Yes or No  (Default: Yes)"
if ($input -eq 'yes'){
    echo "Removing logo..."
    Remove-Item "Data\meshes\Interface\logo\logo.nif" 
    echo "Done!"
}elseif($input -eq 'no'){
    echo "The logo wont be removed"
}else{
    echo "Removing logo..."
    Remove-Item "Data\meshes\Interface\logo\logo.nif" 
    echo "Done!"
    }
echo " "
echo "SkyrimTogether has been uninstalled!"
pause

