:: 2018�� 11�� 7��
:: �����л翡�� ���ͳ��� ���ϰ� ����ϱ� ���� ������.
:: ���� 8�� �������� �����ϱ�� �Ȱ� ���� �ؾߵ� �� ���Ƽ�, ����� ������ �迡 ������� ����.
::

:: ���α׷��� �����ϱ� ���� ������ ������ ��� ����. �۵����� ���� ���� ����. �׷� ���, ������ �������� �����ϸ� �ذ��.
@echo off
echo ���α׷� ���� ��...
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
pushd "%CD%"
    CD /D "%~dp0"

:: ����ڰ� �������̸� ������ �� �ִ� �б⹮
:LOOP
cls
echo.
echo                     ========[ �����л� ��Ʈ��ũ ���� ] ========
echo.
echo.
echo �����л� �������̿� ���� : A
echo �Ϲ� ����� ���� : B
echo ������ ����(���� �߻� �� Ȯ���� ��) : C
echo.
echo (��ҹ��� ���� ����)
echo.
echo  (A/B/C)?
setlocal
set /p str=�Է� :
echo.
if /i "%str%" == "a" goto D
if /i "%str%" == "b" goto H
if /i "%str%" == "c" goto W
echo �߸��� �Է��Դϴ�.
timeout /t 2 /nobreak > nul
goto LOOP

:D

:: å�� ��ȣ�� �Է¹޾Ƽ�, +90�� ���� IP ���ڸ��� ����.
:: ������ å�� ��ȣ�� 46���̸�, IP ���ڸ��� 146.
:: �������� 0~90���� ����δ� �� Ȥ�� ����. ���߿� ����� ��ǻ�ͳ� �ٸ� �� �Ҵ��� ���� �����ϱ�.
:: �̷��� �ϸ� 170������ 250������ 80�� ��µ�, �̰� ����Ʈ�� ��������� ��� ��. ���ø����̼��� ����� �ôµ�, �Ｚ������ �� ���ư��� ����.
:: �� ��쿡 ����Ʈ�� ������ �ڸ� ��ȣ+170�ϸ� ��.
:: �� �����л� ������ 80���̶�� �� ���� �Ͽ� �ۼ���. 80���� �þ�� �� ����.
:: �׸��� ���Ŀ� netsh ��ɾ� ���� �� �Ǹ� �׶� �� ����.

cls
echo.
echo ==============[ �����л� �������� ���� ]==============
echo.
echo   ������� �����л� ��ȣ(å���ȣ)�� �Է����ּ���.
set /p num=�Է� :
set /a num=%num%+90
echo.
echo ������...
netsh interface ip set address name="Wi-Fi" source=static addr=10.72.79.%num% mask=255.255.252.0 gateway=10.72.76.1 gwmetric=1 > nul
netsh -c int ip set dns name="Wi-Fi" source=static addr=188.219.1.1 register=PRIMARY > nul
netsh -c int ip add dns name="Wi-Fi" 168.126.63.1 > nul
echo.
echo  ::  �������̸� �����л翡 ���߾� �����Ͽ����ϴ�.  ::
echo.
goto E

:H

:: �������̸� �Ϲ� �������� �ǵ���
netsh interface ip set address name="Wi-Fi" source=dhcp > nul
netsh -c int ip set dns name="Wi-Fi" source=dhcp > nul
reg delete HKLM\Software\Classes\cmdfile\shell /ve /f > nul
netsh interface ip set address name="�̴���" source=dhcp > nul
netsh -c int ip set dns name="�̴���" source=dhcp > nul

cls
echo.
echo ==============[ �Ϲ� �������� ��� ����]==============
echo.
echo.
echo  :: �������̸� �ڵ� ����(����)���� �����߽��ϴ�. ::
echo.
goto E

:W
cls
echo.
echo =====================[ ������ ���� ]=====================
echo.
echo   2018�� ����� �������ε� ���⿣ ������
echo.
echo  �̸��� : Unknownpgr@gmail.com
echo.
echo  ������ �� �ǰų� ���� �߻� ��, ���� �̸��Ϸ� �������ֽø� �ð��� �� ��ĥ ����.
echo  ������ ���� ��, ���ͳ� ���� ���� ���� ��ư(������ ȭ�鿡�� s)�� ���� ǥ�õǴ� ������ ÷���ϸ� ������ ��.
echo  cmd ���� �� �ƴ� ����̸� ipconfig /all�� �Ͱ� ������.
echo  �׸��� ������ ������ �˷��ָ� ���� ��. ��PC - ��Ŭ�� - �Ӽ� ���� ���� ���� �빮¦���ϰ� ����.
echo.
echo.
echo  # ���� �߻� ��, ���� ������ ���� �Ʒ��� Ȯ���� ��. #
echo.  
echo  1. �׳� �����ؼ� �� �Ǹ�, ��Ŭ���ؼ� '������ �������� ����' �� ��������.
echo. 2. Ȥ�� ���ͳ� ��ü�� ������ �� �� �� �ƴ��� ���캻��. �� ���α׷��� �����л� �������̿� ����Ǿ� ���� �� 
echo.    �����Ǹ� �ٲ��ִ� ���α׷��̰�, ��������(gangdong)�� �����ϴ� �� �簨�����׼� ��й�ȣ �޾Ƽ� Ȯ���ؾ� ��.
echo  3. ���� ���߿� DNS ������ �߸��Ǿ��ٴ���, ������Ʈ�� Ű�� ���ٴ��� �ϸ鼭 ������ �� ���� ����.
echo     �ٵ� �����ϴ� �Ŷ��� ���谡 ���� ������, ������������ ���̹� ���� ���ӵǴ��� Ȯ���غ� ��.
echo.
echo.
echo  # Ȥ�� ���α׷��� �̻��� �� ������� ������ �ǽɽ����� ����� ���ؼ� #
echo.
echo  - �� ���α׷��� bat���Ϸ� �ۼ��Ǿ��� ������, Ȯ���ڸ� bat���� txt�� �ٲٸ� ������ ��� ���� ����.
echo  - ������ ������ netsh ��ɾ�� ip �� dns�� �ٲٱ� ���� �ʿ���.
echo.
pause
goto E

:E
timeout /t 2 /nobreak > nul
cls
echo.
echo ���ͳ� ���� ���� ���� : s
echo ó������ : f
echo �� �� �ƹ� Ű�� ������ �˾Ƽ� �����ϴ�.
set /p str=�Է����ּ��� :
if /i "%str%"=="s" goto info
if /i "%str%"=="f" goto LOOP
cls
goto EE

:info

cls
ipconfig /all
pause
goto E

:EE

endlocal
exit