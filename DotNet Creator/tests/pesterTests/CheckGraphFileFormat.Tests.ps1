Describe "Check the File Exists" {
    #    Context "Checking the Header of the file" {
    #        $file = "C:\Users\Administrator\Desktop\Tools\DotExamples\Ouptut\outputfile.gv"
    #        Write-Host "Testing"
    #        It (Get-Content $file)[0] | 
    #        Should -Match 'test' #'digraph \w.*\{'
    #    }
        It 'File Should Exist' {
            "..\output\result.gv" |
            Should -Exist
        }
    
        It 'Check the file format' {
            $file = "C:\Users\Administrator\Desktop\Tools\DotExamples\Ouptut\outputfile.gv"
            (Get-Content $file)[0] | Should -Match 'digraph \w.*\{'
            (Get-Content $file)[$file.Count - 1] | Should -Match '\{'
        }
    
    }
    