Param(
    [Parameter(Mandatory=$true,
    ValueFromPipeline=$true)]
    [string[]]
    $OutputFile,
    [Parameter(Mandatory=$true,
    ValueFromPipeline=$true)]
    [string[]]
    $GraphName
)

function CreateDotGraphHeader($graphName)
{
    return "digraph $graphName {"
}


function CreateDotGraphFooter($contents)
{
    return "$contents `n}"
}

function ConnectNodes($parentNode, $childNode)
{
    $global:graphFileContents += "`n`t$parentNode -> $childNode"
}

function SetNodeColor($node, $color)
{
    $global:graphFileContents += "`n`t$node [color=`"$color`"]"
}

# Sample Commands
$global:graphFileContents = CreateDotGraphHeader $GraphName;
ConnectNodes "firstnode" "childnode1"
ConnectNodes "firstnode" "childnode2"
ConnectNodes "firstnode" "childnode3"
SetNodeColor "firstnode" "green"
ConnectNodes "childnode2" "childnode21"
ConnectNodes "childnode2" "childnode22"
ConnectNodes "childnode3" "childnode31"
SetNodeColor "childnode2" "red"
$global:graphFileContents = CreateDotGraphFooter $global:graphFileContents
Set-Content -Value $global:graphFileContents $OutputFile