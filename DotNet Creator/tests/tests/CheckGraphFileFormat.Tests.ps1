Describe "File and Format Checks" {
    BeforeAll {
        $outputLocation = "TestDrive:\myoutputfile.txt"
        $command = { .\src\CreateDotNetFile.ps1 -OutputFile $outputLocation -GraphName "TestGraph" }
        Invoke-Command -ScriptBlock $command
    }

    It 'File Should Exist' {
        $outputLocation | Should -Exist
    }
     
    It 'Check the file format' {
        $file = $outputLocation
        (Get-Content $file)[0] | Should -Match 'digraph \w.*\{'
        (Get-Content $file)[$file.Count - 1] | Should -Match '\{'
    }
     
    It 'Check the file contents' {
        $file = Get-Content -Path $outputLocation
        $fileLength = $file.Count - 1
        for($counter = 1;$counter -lt $fileLength; $counter++ )
        {
            $file[$counter] | Should -Match '\w*? [-][>] \w*|\w* [[]\w*[=]["]\w*["][]]'
        }
    }

}
    