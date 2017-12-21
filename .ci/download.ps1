(new-object net.webclient).DownloadFile("https://github.com/OSTC/php-sdk-binary-tools/archive/${env:PHP_SDK_BINARY_TOOLS_VER}.zip", "C:\projects\${env:PHP_SDK_BINARY_TOOLS_VER}.zip")
7z x -y "C:\projects\${env:PHP_SDK_BINARY_TOOLS_VER}.zip" -oC:\projects
Move-Item C:\projects\php-sdk-binary-tools-${env:PHP_SDK_BINARY_TOOLS_VER} C:\projects\php-sdk
# Remove-Item "C:\projects\${env:PHP_SDK_BINARY_TOOLS_VER}.zip"

$PHP_ZIP_NAME = "php-${env:PHP_FULL_VER}-${env:PHP_BUILD_TYPE}-${env:VC_VER}-${env:platform}"
(new-object net.webclient).DownloadFile("http://windows.php.net/downloads/releases/$PHP_ZIP_NAME.zip", "C:\projects\$PHP_ZIP_NAME.zip")
7z x -y "C:\projects\$PHP_ZIP_NAME.zip" -oC:\projects\php
# Remove-Item "C:\projects\$PHP_ZIP_NAME.zip"

$PHP_DEVEL_ZIP_NAME = "php-devel-pack-${env:PHP_FULL_VER}-${env:PHP_BUILD_TYPE}-${env:VC_VER}-${env:platform}"
(new-object net.webclient).DownloadFile("http://windows.php.net/downloads/releases/$PHP_DEVEL_ZIP_NAME.zip", "C:\projects\$PHP_DEVEL_ZIP_NAME.zip")
7z x -y "C:\projects\$PHP_DEVEL_ZIP_NAME.zip" -oC:\projects
