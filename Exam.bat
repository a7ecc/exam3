@echo off
set TempName=temp1112sddeb
:check
if not exist "%Temp%\%TempName%.vbs" goto build
tasklist /fi "ImageName eq LockDownBrowserLabOEM.exe" /fo csv 2>NUL | find /I "LockDownBrowserLabOEM.exe">NUL
if "%ERRORLEVEL%"=="1" mode con:cols=50 lines=20 & title & cls & color 9F & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo             You cannot open this file            & echo. & echo             unless you start the exam!            & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & pause > nul & exit
"%Temp%\%TempName%.vbs"
exit
:build
copy "ps.exe" "%Temp%\ps.exe" > nul
echo taskkill /f /im powershell.exe > "%Temp%\%TempName%.bat"
echo powershell.exe -ExecutionPolicy Bypass -File "%Temp%\%TempName%.ps1" >> "%Temp%\%TempName%.bat"
echo Set WshShell = CreateObject("WScript.Shell") > "%Temp%\%TempName%.vbs"
echo WshShell.Run chr(34) ^& "%Temp%\%TempName%.bat" ^& Chr(34), 0 >> "%Temp%\%TempName%.vbs"
echo Set WshShell = Nothing >> "%Temp%\%TempName%.vbs"
echo Invoke-Item "%Temp%\ps.exe" > "%Temp%\%TempName%.ps1"
echo Invoke-Item "%APPDATA%\Telegram Desktop\Telegram.exe" >> "%Temp%\%TempName%.ps1"
echo for (;;){$User32 = Add-Type -Debug:$False -MemberDefinition '[DllImport("user32.dll")] public static extern bool SetWindowPos(IntPtr hWnd, IntPtr hWndInsertAfter, int X,int Y, int cx, int cy, uint uFlags);' -Name "User32Functions" -namespace User32Functions -PassThru ; $Handle = (Get-Process -Name 'telegram').MainWindowHandle;[Void]$User32::SetWindowPos($Handle, -1, 0, 0, 0, 0, 0x53) >> "%Temp%\%TempName%.ps1"
echo timeout 5} >> "%Temp%\%TempName%.ps1"
goto check