$subFolders = Get-ChildItem -Directory .

foreach($folder in $subFolders) {
    if (! $folder.Name.StartsWith(".")) {
        Set-Location -Path $folder.FullName
        Get-Location 
        git pull
        Set-Location -Path $folder.PSParentPath
    }
}