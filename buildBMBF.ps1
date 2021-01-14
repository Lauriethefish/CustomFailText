# Builds a .zip file for loading with BMBF
$NDKPath = Get-Content $PSScriptRoot/ndkpath.txt

$buildScript = "$NDKPath/build/ndk-build"
if (-not ($PSVersionTable.PSEdition -eq "Core")) {
    $buildScript += ".cmd"
}

& $buildScript NDK_PROJECT_PATH=$PSScriptRoot APP_BUILD_SCRIPT=$PSScriptRoot/Android.mk NDK_APPLICATION_MK=$PSScriptRoot/Application.mk

Compress-Archive -Path "./libs/arm64-v8a/libcustom-fail-text.so", "cover.png", "./extern/libbeatsaber-hook_1_0_9.so", "./extern/libcodegen_0_5_3.so", "./extern/libcustom-types.so", "./extern/libquestui.so", "./bmbfmod.json" -DestinationPath "./custom-fail-text_v0.1.8.zip" -Update
