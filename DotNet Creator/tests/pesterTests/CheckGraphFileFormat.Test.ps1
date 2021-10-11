Describe "Check the File Format" {
    Context "Checking the Header of the file" {
        $file = "C:\Users\Administrator\Desktop\Tools\DotExamples\Ouptut\outputfile.gv"
        (Get-Content $file)[0] | Should -Match 'digraph \w.*\{'
    }
}