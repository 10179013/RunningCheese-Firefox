@echo off
if exist "%~dp0firefox.exe" (echo.) && if exist "%~dp0xul.dll" (
echo ���ҵ���Ҫע����ļ�firefox.exe��xul.dll. 
goto platform
) else (
echo û�ҵ�����ļ�,��ѳ������������İ�װĿ¼ִ��.
goto eof
)

if  not exist %~dp0firefox.exe (
echo û�ҵ�����ļ�,��ѳ������������İ�װĿ¼ִ��.
goto eof
)

:platform
@echo ��ѡ����ע��32λ����64λ��firefox.
@set /p fx=[32λ�밴1,   64λ�밴2]
if "%fx%"=="1" set arch=X86.exe&goto x86
if "%fx%"=="2" set arch=X64.exe&goto x64
@echo ��������ȷ�����֣�&ping -n 1 127.0.0.1>nul&goto platform

:x86
@echo ��ѡ����ע��32λ��firefox�����
injectpe_%arch% firefox.exe portable32.dll
injectpe_%arch% xul.dll portable32.dll
goto err

:x64
@echo ��ѡ����ע��64λ��firefox�����
injectpe_%arch% firefox.exe portable64.dll
injectpe_%arch% xul.dll portable64.dll

:err
if "%errorlevel%"=="0" echo ע��ɹ�,����ϸ�Ķ�readme.txt��portable(example).ini�ļ�!
if "%errorlevel%"=="-1" echo ����ע��ʧ��!

:eof
pause .
@del /s/q injectpe_x*.exe 2>nul 1>nul
if "%fx%"=="1" del /s/q portable64.dll
if "%fx%"=="2" del /s/q portable32.dll
@del /s/q %0
