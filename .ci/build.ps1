Invoke-BatchFile "C:\projects\php-sdk\bin\phpsdk_setvars.bat"
Invoke-BatchFile "C:\projects\php-${env:PHP_FULL_VER}-devel-${env:VC_VER}-${env:platform}\phpize.bat"
"var PHP_SANITIZER=`"no`"; var PHP_CONFIG_PROFILE=`"no`";" + (Get-Content "configure.js" | Out-String) | Set-Content "configure.js"
./configure.bat --disable-all --enable-psr --with-prefix=C:\projects\php
nmake
