@echo off 
cd /d %~dp0
::������Ƶ������
set dd=wget.exe --no-check-certificate  -N -P ..\SubScript\
 
::youku
%dd% https://raw.githubusercontent.com/runningcheese/RunningCheese-Firefox/master/chrome/SubScript/QuickSnapshot.uc.js


