Function SetupPhpVersionString {
    $RemoteUrl = 'http://windows.php.net/downloads/releases/sha1sum.txt'
    $DestinationPath = "${Env:Temp}\php-sha1sum.txt"

    If (-not [System.IO.File]::Exists($DestinationPath)) {
        Write-Host "Downloading PHP SHA Sums: $RemoteUrl..."
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

    $Retrycount = 5
    $Retrycount = 0
    $Completed  = $false

    $WebClient = new-object System.Net.WebClient

    While (-not $Completed) {
        Try {
            $WebClient.DownloadFile($RemoteUrl, $DestinationPath)
            $Completed = $true
        } Catch {
            If ($Retrycount -ge $Retrycount) {
                $ErrorMessage = $_.Exception.Message
                Write-Host "Error downloadingig ${RemoteUrl}: $ErrorMessage"
                $Completed = $true
            } Else {
                $Retrycount++
            }
        }
    }
}
