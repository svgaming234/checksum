@echo off
color f0
title Checksum 1.0

set dialog="about:<input type=file id=FILE><script>FILE.click();new ActiveXObject
set dialog=%dialog%('Scripting.FileSystemObject').GetStandardStream(1).WriteLine(FILE.value);
set dialog=%dialog%close();resizeTo(0,0);</script>"

for /f "tokens=* delims=" %%p in ('mshta.exe %dialog%') do set "file=%%p"
echo Selected file is : "%file%"

set /p whash= "Which hash do you want to verify? (sha256, md5, etc.): "

echo Checking hash...
certutil -hashfile "%file%" %whash%
pause

