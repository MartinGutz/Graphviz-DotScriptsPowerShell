Import-Module "C:\Users\Administrator\Desktop\Tools\PowerShell Gallery\Pester.psm1"
#CreateDotNetFile.ps1
..\src\CreateDotNetFile.ps1 -GraphName "SampleGraph" -OutputFile "..\output\result.gv"

while($true)
{
    Clear-Host
    Invoke-Pester -Path ".\pesterTests"
    Start-Sleep -Seconds 5    
}


