write-output "Making a new distribution"
Get-ChildItem -exclude design-files | Compress-Archive -DestinationPath final.love
cmd /c copy /b love.exe+final.love oh-mummy.exe
if (Test-Path dist/oh-mummy.exe)
{
    Remove-Item dist/oh-mummy.exe
}
Move-Item oh-mummy.exe dist
Remove-Item final.love