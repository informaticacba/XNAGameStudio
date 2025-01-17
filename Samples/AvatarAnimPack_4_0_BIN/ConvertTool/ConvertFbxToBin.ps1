foreach ($arg in $args)
{
    $convertToolRel = ".\AvatarAssetConverter_e.exe"
    dir -path $arg -i *.fbx -rec |
     %{ 
        $outputDir = $_.DirectoryName
        $baseName = $_.basename
        $outputPath = $_.DirectoryName + "\" + $baseName + ".bin"
        echo "Converting $_ and saving to $outputPath"; 
        & $convertTool $outputPath "/bt:Male" "/au:Custom" "/ap:Maya" "/a:$_" "/at:animation" "/as:0.01" "/rt:0.00001" "/st:0.00001" "/pt:0.00001" "/sr:15.0" "/mt:XZ" "/mr:Y"
      }
}