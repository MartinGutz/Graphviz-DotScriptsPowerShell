Import-Module "C:\Users\Administrator\Desktop\Tools\PowerShell Gallery\Pester.psm1"
#CreateDotNetFile.ps1
..\src\CreateDotNetFile.ps1
Invoke-Pester -Path "C:\Users\Administrator\Desktop\Tools\DotExamples\DotNet Creator\tests\pesterTests\*"


