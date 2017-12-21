$env:Path += ";C:\projects\php-sdk\bin;C:\projects\php\bin;C:\projects\php"
$env:TEST_PHP_EXECUTABLE = "C:\projects\php\bin\php.exe"

If (-not (Test-Path env:VCVARSALL)) {
    $env:VCVARSALL = "${env:VSCOMNTOOLS}\..\..\VC\vcvarsall.bat"
}

$env:VS140COMNTOOLS = "C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\Tools\"
If ($env:VC_VER -eq 'vc14') {
    $env:VSCOMNTOOLS = "${env:VS120COMNTOOLS}"
}
If ($env:VC_VER -eq 'vc15') {
    $env:VSCOMNTOOLS = "${env:VS140COMNTOOLS}"
}

If ($env:platform -eq 'x86') {
    Invoke-BatchFile "${env:VCVARSALL}" x86
    If ($env:PHP_BUILD_TYPE -eq 'Win32') {
        $env:RELEASE_FOLDER = "Release"
    } Else {
        $env:RELEASE_FOLDER = "Release_TS"
    }
}
If ($env:platform -eq 'x64') {
    Invoke-BatchFile "${env:WIN_SDK_SETENV}" /x64
    Invoke-BatchFile "${env:VCVARSALL}" x86_amd64
    If ($env:PHP_BUILD_TYPE -eq 'Win32') {
        $env:RELEASE_FOLDER = "x64\Release"
    } Else {
        $env:RELEASE_FOLDER = "x64\Release_TS"
    }
}

$env:RELEASE_ZIPBALL = "psr_${env:platform}_${env:VC_VER}_${env:PHP_VER}_${env:APPVEYOR_BUILD_VERSION}"
