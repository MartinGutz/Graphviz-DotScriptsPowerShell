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

function SetNodeColor()
{
    [CmdletBinding()]
    Param(
    [string]$node,
    [ValidateSet("aliceblue","antiquewhite","aqua","aquamarine","azure","beige","bisque","black","blanchedalmond","blue","blueviolet","brown","burlywood","cadetblue","chartreuse","chocolate","coral","cornflowerblue","cornsilk","crimson","cyan","darkblue","darkcyan","darkgoldenrod","darkgray","darkgreen","darkgrey","darkkhaki","darkmagenta","darkolivegreen","darkorange","darkorchid","darkred","darksalmon","darkseagreen","darkslateblue","darkslategray","darkslategrey","darkturquoise","darkviolet","deeppink","deepskyblue","dimgray","dimgrey","dodgerblue","firebrick","floralwhite","forestgreen","fuchsia","gainsboro","ghostwhite","gold","goldenrod","gray","grey","green","greenyellow","honeydew","hotpink","indianred","indigo","ivory","khaki","lavender","lavenderblush","lawngreen","lemonchiffon","lightblue","lightcoral","lightcyan","lightgoldenrodyellow","lightgray","lightgreen","lightgrey","lightpink","lightsalmon","lightseagreen","lightskyblue","lightslategray","lightslategrey","lightsteelblue","lightyellow","lime","limegreen","linen","magenta","maroon","mediumaquamarine","mediumblue","mediumorchid","mediumpurple","mediumseagreen","mediumslateblue","mediumspringgreen","mediumturquoise","mediumvioletred","midnightblue","mintcream","mistyrose","moccasin","navajowhite","navy","oldlace","olive","olivedrab","orange","orangered","orchid","palegoldenrod","palegreen","paleturquoise","palevioletred","papayawhip","peachpuff","peru","pink","plum","powderblue","purple","red","rosybrown","royalblue","saddlebrown","salmon","sandybrown","seagreen","seashell","sienna","silver","skyblue","slateblue","slategray","slategrey","snow","springgreen","steelblue","tan","teal","thistle","tomato","turquoise","violet","wheat","white","whitesmoke","yellow","yellowgreen")]
    [string]$color
    )

    $global:graphFileContents += "`n`t$node [color=`"$color`"]"
}

# Sample Commands
$global:graphFileContents = CreateDotGraphHeader $GraphName;
ConnectNodes "firstnode" "childnode1"
ConnectNodes "firstnode" "childnode2"
ConnectNodes "firstnode" "childnode3"
SetNodeColor -Node "firstnode" -Color "green"
ConnectNodes "childnode2" "childnode21"
ConnectNodes "childnode2" "childnode22"
ConnectNodes "childnode3" "childnode31"
SetNodeColor -Node "childnode2" -Color "red"
$global:graphFileContents = CreateDotGraphFooter $global:graphFileContents
Set-Content -Value $global:graphFileContents $OutputFile