# Builds a .zip file for loading with BMBF
$NDKPath = Get-Content $PSScriptRoot/ndkpath.txt

$buildScript = "$NDKPath/build/ndk-build"
if (-not ($PSVersionTable.PSEdition -eq "Core")) {
    $buildScript += ".cmd"
}

& $buildScript NDK_PROJECT_PATH=$PSScriptRoot APP_BUILD_SCRIPT=$PSScriptRoot/Android.mk NDK_APPLICATION_MK=$PSScriptRoot/Application.mk

Compress-Archive -Path "./libs/arm64-v8a/libcustom-fail-text_0_1_7.so", "cover.png", "./extern/libbeatsaber-hook_0_8_4.so", "./extern/libcodegen_0_3_6.so", "./extern/libcustom-types.so", "./extern/libquestui.so", "./bmbfmod.json" -DestinationPath "./custom-fail-text_v0.1.7.zip" -Update
