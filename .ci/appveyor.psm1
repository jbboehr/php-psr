Function InitializeReleaseVars {
	If ($Env:PLATFORM -eq 'x86') {
		If ($Env:PHP_BUILD_TYPE -Match "nts-Win32") {
			$Env:RELEASE_FOLDER = "${Env:APPVEYOR_BUILD_FOLDER}\Release"
		} Else {
			$Env:RELEASE_FOLDER = "${Env:APPVEYOR_BUILD_FOLDER}\Release_TS"
		}
	} Else {
		If ($Env:PHP_BUILD_TYPE -Match "nts-Win32") {
			$Env:RELEASE_FOLDER = "${Env:APPVEYOR_BUILD_FOLDER}\${Env:PLATFORM}\Release"
		} Else {
			$Env:RELEASE_FOLDER = "${Env:APPVEYOR_BUILD_FOLDER}\${Env:PLATFORM}\Release_TS"
		}
	}

	$Env:RELEASE_ZIPBALL = "psr_${Env:PLATFORM}_${Env:VC_VER}_${Env:PHP_VER}_${Env:APPVEYOR_BUILD_VERSION}"
}

Function InstallPhpDevPack {
	Write-Host "Install PHP Dev pack: ${Env:PHP_FULL_VER}" -foregroundcolor Cyan

	$RemoteUrl = "http://windows.php.net/downloads/releases/php-devel-pack-${Env:PHP_FULL_VER}-${Env:PHP_BUILD_TYPE}-${Env:VC_VER}-${Env:PLATFORM}.zip"
	$DestinationPath = "C:\Downloads\php-devel-pack-${Env:PHP_FULL_VER}-${Env:PHP_BUILD_TYPE}-${Env:VC_VER}-${Env:PLATFORM}.zip"
	$InstallPath = 'C:\Projects\php-devpack'

	If (-not (Test-Path $InstallPath)) {
		If (-not [System.IO.File]::Exists($DestinationPath)) {
			Write-Host "Downloading PHP Dev pack: ${RemoteUrl} ..."
			DownloadFile $RemoteUrl $DestinationPath
		}

		$DestinationUnzipPath = "${Env:Temp}\php-${Env:PHP_FULL_VER}-devel-${Env:VC_VER}-${Env:PLATFORM}"

		If (-not (Test-Path "$DestinationUnzipPath")) {
			Expand-Item7zip $DestinationPath $Env:Temp
		}

		Move-Item -Path $DestinationUnzipPath -Destination $InstallPath
	}
}

Function InstallPhp {
	Write-Host "Install PHP: ${Env:PHP_FULL_VER}" -foregroundcolor Cyan

	$RemoteUrl = "http://windows.php.net/downloads/releases/php-${Env:PHP_FULL_VER}-${Env:PHP_BUILD_TYPE}-${Env:VC_VER}-${Env:PLATFORM}.zip"
	$DestinationPath = "C:\Downloads\php-${Env:PHP_FULL_VER}-${Env:PHP_BUILD_TYPE}-${Env:VC_VER}-${Env:PLATFORM}.zip"
	$InstallPath = 'C:\Projects\php'

	If (-not (Test-Path $InstallPath)) {
		If (-not [System.IO.File]::Exists($DestinationPath)) {
			Write-Host "Downloading PHP source code: ${RemoteUrl} ..."
			DownloadFile $RemoteUrl $DestinationPath
		}

		Expand-Item7zip $DestinationPath $InstallPath
	}

	If (-not (Test-Path "${InstallPath}\php.ini")) {
		Copy-Item "${InstallPath}\php.ini-development" "${InstallPath}\php.ini"
	}
}

Function InstallSdk {
	Write-Host "Install PHP SDK binary tools: ${Env:PHP_SDK_BINARY_TOOLS_VER}" -foregroundcolor Cyan

	$RemoteUrl = "https://github.com/OSTC/php-sdk-binary-tools/archive/php-sdk-${Env:PHP_SDK_BINARY_TOOLS_VER}.zip"
	$DestinationPath = "C:\Downloads\php-sdk-${Env:PHP_SDK_BINARY_TOOLS_VER}.zip"
	$InstallPath = 'C:\Projects\php-sdk'

	If (-not (Test-Path $InstallPath)) {
		If (-not [System.IO.File]::Exists($DestinationPath)) {
			Write-Host "Downloading PHP SDK binary tools: ${RemoteUrl} ..."
			DownloadFile $RemoteUrl $DestinationPath
		}

		$DestinationUnzipPath = "${Env:Temp}\php-sdk-binary-tools-php-sdk-${Env:PHP_SDK_BINARY_TOOLS_VER}"

		If (-not (Test-Path "$DestinationUnzipPath")) {
			Expand-Item7zip $DestinationPath $Env:Temp
		}

		Move-Item -Path $DestinationUnzipPath -Destination $InstallPath
	}
}

Function Ensure7ZipIsInstalled {
	If (-not (Get-Command "7z" -ErrorAction SilentlyContinue)) {
		$7zipInstallationDirectory = "${Env:ProgramFiles}\7-Zip"

		If (-not (Test-Path "$7zipInstallationDirectory")) {
			Throw "The 7-zip file archiver is needed to use this module"
		}

		$Env:Path += ";$7zipInstallationDirectory"
	}
}

Function EnsureRequiredDirectoriesPresent {
	If (-not (Test-Path 'C:\Downloads')) {
		New-Item -ItemType Directory -Force -Path 'C:\Downloads' | Out-Null
	}

	If (-not (Test-Path 'C:\Projects')) {
		New-Item -ItemType Directory -Force -Path 'C:\Projects' | Out-Null
	}
}

Function InitializeBuildVars {
	switch ($Env:VC_VER) {
		'vc14' {
			If (-not (Test-Path $Env:VS120COMNTOOLS)) {
				Throw'The VS120COMNTOOLS environment variable is not set. Check your VS installation'
			}

			$Env:VSCOMNTOOLS = $Env:VS120COMNTOOLS -replace '\\$', ''
			Break
		}
		'vc15' {
			If (-not (Test-Path $Env:VS140COMNTOOLS)) {
				Throw'The VS140COMNTOOLS environment variable is not set. Check your VS installation'
			}

			$Env:VSCOMNTOOLS = $Env:VS140COMNTOOLS -replace '\\$', ''
			Break
		}
		default {
			Throw 'This script is designed to run with VS 14/15. Check your VS installation'
		}
	}

	If ($Env:PLATFORM -eq 'x64') {
		$Env:ARCH = 'x86_amd64'
	} Else {
		$Env:ARCH = 'x86'
	}
}

Function AppendSessionPath {
	[string[]] $PathsCollection = @(
		"C:\Projects\php-sdk\bin",
		"C:\Projects\php\bin",
		"C:\Projects\php",
		"C:\Projects\php-devpack"
	)

	$CurrentPath = (Get-Item -Path ".\" -Verbose).FullName

	ForEach ($PathItem In $PathsCollection) {
		Set-Location Env:
		$AllPaths = (Get-ChildItem Path).value.split(";") | Sort-Object -Unique

		$AddToPath = $true

		ForEach ($AddedPath In $AllPaths) {
			If (-not "${AddedPath}") {
				Continue
			}

			$AddedPath = $AddedPath -replace '\\$', ''

			If ($PathItem -eq $AddedPath) {
				$AddToPath = $false
			}
		}

		If ($AddToPath) {
			$Env:Path += ";${PathItem}"
		}
	}

	Set-Location "${CurrentPath}"
}

Function SetupPhpVersionString {
	$RemoteUrl = 'http://windows.php.net/downloads/releases/sha256sum.txt'
	$DestinationPath = "${Env:Temp}\php-sha256sum.txt"

	If (-not [System.IO.File]::Exists($DestinationPath)) {
		Write-Host "Downloading PHP SHA Sums: ${RemoteUrl} ..."
		DownloadFile $RemoteUrl $DestinationPath
	}

	$VersionString = Get-Content $DestinationPath | Where-Object {
		$_ -match "php-($Env:PHP_VER\.\d+)-src"
	} | ForEach-Object { $matches[1] }

	If ($VersionString -NotMatch '\d+\.\d+\.\d+') {
		Throw "Unable to obtain PHP version string using pattern 'php-($Env:PHP_MINOR\.\d+)-src'"
	}

	$Env:PHP_FULL_VER = $VersionString
}

Function Expand-Item7zip {
	Param(
		[Parameter(Mandatory=$true)][System.String] $Archive,
		[Parameter(Mandatory=$true)][System.String] $Destination
	)

	If (-not (Test-Path -Path $Archive -PathType Leaf)) {
		Throw "Specified archive File is invalid: [$Archive]"
	}

	If (-not (Test-Path -Path $Destination -PathType Container)) {
		New-Item $Destination -ItemType Directory | Out-Null
	}

	$Result = (& 7z x "$Archive" "-o$Destination" -aoa -bd -y -r)

	$7zipExitCode = $LASTEXITCODE
	If ($7zipExitCode -ne 0) {
		Throw "An error occurred while unzipping [$Archive] to [$Destination]. 7Zip Exit Code was [$7zipExitCode]"
	}
}

Function PrintLogs {
	If (Test-Path -Path "${Env:APPVEYOR_BUILD_FOLDER}\compile-errors.log") {
		Get-Content -Path "${Env:APPVEYOR_BUILD_FOLDER}\compile-errors.log"
	}

	If (Test-Path -Path "${Env:APPVEYOR_BUILD_FOLDER}\compile.log") {
		Get-Content -Path "${Env:APPVEYOR_BUILD_FOLDER}\compile.log"
	}

	If (Test-Path -Path "${Env:APPVEYOR_BUILD_FOLDER}\configure.js") {
		Get-Content -Path "${Env:APPVEYOR_BUILD_FOLDER}\configure.js"
	}
}

Function PrepareReleasePackage {
	$CurrentPath = (Get-Item -Path ".\" -Verbose).FullName
	$PackagePath = "${Env:APPVEYOR_BUILD_FOLDER}\package"

	If (-not (Test-Path $PackagePath)) {
		New-Item -ItemType Directory -Force -Path $PackagePath | Out-Null
	}

	Copy-Item -Path (Join-Path -Path $Env:APPVEYOR_BUILD_FOLDER -ChildPath '\*') -Filter '*.md' -Destination "${PackagePath}" -Force
	Copy-Item "${Env:RELEASE_FOLDER}\php_psr.dll" "${PackagePath}"

	Set-Location "${PackagePath}"
	$Result = (& 7z a "${Env:RELEASE_ZIPBALL}.zip" *.*)

	$7zipExitCode = $LASTEXITCODE
	If ($7zipExitCode -ne 0) {
		Set-Location "${CurrentPath}"
		Throw "An error occurred while creating release zippbal to [${Env:RELEASE_ZIPBALL}.zip]. 7Zip Exit Code was [${7zipExitCode}]"
	}

	Move-Item "${Env:RELEASE_ZIPBALL}.zip" -Destination "${Env:APPVEYOR_BUILD_FOLDER}"

	Set-Location "${CurrentPath}"
}

Function DownloadFile {
	param(
		[Parameter(Mandatory=$true)][System.String] $RemoteUrl,
		[Parameter(Mandatory=$true)][System.String] $DestinationPath
	)

	$RetryMax   = 5
	$RetryCount = 0
	$Completed  = $false

	$WebClient = New-Object System.Net.WebClient
	$WebClient.Headers.Add('User-Agent', 'AppVeyor PowerShell Script')

	While (-not $Completed) {
		Try {
			$WebClient.DownloadFile($RemoteUrl, $DestinationPath)
			$Completed = $true
		} Catch {
			If ($RetryCount -ge $RetryMax) {
				$ErrorMessage = $_.Exception.Message
				Write-Host "Error downloadingig ${RemoteUrl}: $ErrorMessage"
				$Completed = $true
			} Else {
				$RetryCount++
			}
		}
	}
}
