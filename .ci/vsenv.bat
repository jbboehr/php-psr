@echo off
rem Copyright (c) 2011-present, Phalcon Team
rem All rights reserved.
rem
rem Redistribution and use in source and binary forms, with or without
rem modification, are permitted provided that the following conditions are met:
rem
rem * Redistributions of source code must retain the above copyright notice, this
rem   list of conditions and the following disclaimer.
rem
rem * Redistributions in binary form must reproduce the above copyright notice,
rem   this list of conditions and the following disclaimer in the documentation
rem   and/or other materials provided with the distribution.
rem
rem * Neither the name of the copyright holder nor the names of its
rem   contributors may be used to endorse or promote products derived from
rem   this software without specific prior written permission.
rem
rem THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
rem AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
rem IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
rem DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
rem FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
rem DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
rem SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
rem CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
rem OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
rem OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
cls

rem For more see: https://github.com/microsoft/vswhere/wiki/Find-VC
rem
rem For the software installed on GitHub-hosted runners see:
rem https://help.github.com/en/actions/automating-your-workflow-with-github-actions/software-installed-on-github-hosted-runners
rem
echo "Find VC..."
SET VSWHERE="C:\Program Files (x86)\Microsoft Visual Studio\Installer\vswhere"

for /f "usebackq tokens=*" %%i in (`%VSWHERE% -latest -products * -requires Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -property installationPath`) do (
  set InstallDir=%%i
)

if exist "%InstallDir%\Common7\Tools\vsdevcmd.bat" (
  echo "Found %InstallDir%\Common7\Tools\vsdevcmd.bat"
  call "%InstallDir%\Common7\Tools\vsdevcmd.bat" %*
) else "VC not found"

echo "------------- phpsdk-starter ---------------------------"
call "%PHP_SDK_PATH%\phpsdk-vs16-%PHP_ARCH%.bat"

echo "------------- phpsdk_setvars ---------------------------"
call "%PHP_SDK_PATH%\bin\phpsdk_setvars.bat"

rem Loop over all environment variables and make them global using set-env.
rem
rem See: https://help.github.com/en/articles/development-tools-for-github-actions#set-an-environment-variable-set-env
rem See: https://stackoverflow.com/questions/39183272/loop-through-all-environmental-variables-and-take-actions-depending-on-prefix
setlocal
for /f "delims== tokens=1,2" %%a in ('set') do (
  powershell -Command "& {Write-Output '%%a=%%b' | Out-File -FilePath $env:GITHUB_ENV -Encoding utf8 -Append;}"
)
endlocal
