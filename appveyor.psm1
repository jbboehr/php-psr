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
	$PathsCollection = @("C:\Projects\php-sdk\bin")
	$PathsCollection += "C:\Projects\php\bin"
	$PathsCollection += "C:\Projects\php"
	$PathsCollection += "C:\Projects\php-devpack"

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
	$RemoteUrl = 'http://windows.php.net/downloads/releases/sha1sum.txt'
	$DestinationPath = "${Env:Temp}\php-sha1sum.txt"

	If (-not [System.IO.File]::Exists($DestinationPath)) {
		Write-Host "Downloading PHP SHA Sums: ${RemoteUrl} ..."
		DownloadFile $RemoteUrl $DestinationPath
	}

	$versions = Get-Content $DestinationPath | Where-Object {
		$_ -match "php-($Env:PHP_VER\.\d+)-src"
	} | ForEach-Object { $matches[1] }

	$Env:PHP_FULL_VER = $versions.Split(' ')[-1]
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

Function DownloadFile {
	param(
		[Parameter(Mandatory=$true)][System.String] $RemoteUrl,
		[Parameter(Mandatory=$true)][System.String] $DestinationPath
	)

	$RetryMax   = 5
	$RetryCount = 0
	$Completed  = $false

	$WebClient = new-object System.Net.WebClient

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
