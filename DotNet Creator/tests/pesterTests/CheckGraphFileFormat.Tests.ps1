Describe "File and Format Checks" {

    It 'File Should Exist' {
            "..\output\result.gv" |
            Should -Exist
        }
    
        It 'Check the file format' {
            $file = "C:\Users\Administrator\Desktop\Tools\DotExamples\Ouptut\outputfile.gv"
            (Get-Content $file)[0] | Should -Match 'digraph \w.*\{'
            (Get-Content $file)[$file.Count - 1] | Should -Match '\{'
        }

        It 'Check the file contents' {
            $file = Get-Content -Path "C:\Users\Administrator\Desktop\Tools\DotExamples\Ouptut\outputfile.gv"
            $fileLength = $file.Count - 1
            for($counter = 1;$counter -lt $fileLength; $counter++ )
            {
                $file[$counter] | Should -Match '\w*? [-][>] \w*|\w* [[]\w*[=]["]\w*["][]]'
            }
        }
    
    }
    