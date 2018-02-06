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
    $PathsCollection = @("C:\projects\php-sdk\bin")
    $PathsCollection += "C:\projects\php\bin"
    $PathsCollection += "C:\projects\php"

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
