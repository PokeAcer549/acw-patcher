echo off
echo Wiimmfi Patcher for Animal Crossing: City Folk.
echo Patcher by PokeAcer and Larsenv. SZS and ISO tools by Wiimm.
echo This will both patch the server URLs and change the text from Nintendo WFC to Wiimmfi.
echo This also patches Nintendo's DLC key to receive DLC from RiiConnect24. For more information, please go to http://riiconnect24.net.

:extract
echo Extracting...
wit extract . -n RUU.01 --DEST ./accf-data/ --psel=DATA -ovv --wiimmfi

for /f %%i in ('wit id8 *.wbfs') do set ID=%%i

if %VERSION%==RUUE01 00.00 (
	set OFFSET=80474CB8
	set BMG=USA
	GOTO PATCH
	)
if %VERSION%==RUUE01 00.01 (
	set OFFSET=80474F38
	set BMG=USA
	GOTO PATCH
	)
if %VERSION%==RUUJ01 00.01 (
	set OFFSET=80474DE8
	set BMG=JPN
	GOTO PATCH
	)
if %VERSION%==RUUK01 00.01 (
	set OFFSET=8047DE98
	set BMG=KOR
	GOTO PATCH
	)
if %VERSION%==RUUP01 00.00 (
	set OFFSET=804753F8
	set BMG=EUR
	GOTO PATCH
	)
if %VERSION%==RUUP01 00.01 (
	set OFFSET=80475678
	set BMG=EUR
	GOTO PATCH
	)

:PATCH
wit dolpatch accf-data/sys/main.dol %OFFSET%=B1E7F92ACACD2034E602C73DF43CCE515731279711F4E105CB7E5E1D69EA2A56170E72E1F81CA9FA9EEFAC654BD6C6DC5E4AD1780C8F774BC3190CB618BA5483757D6734F8A1121B01986C6F28F1FAB6AFD2CFAC4570415F23C9B3D3F489934274CE61A93978E0C90A7584AC43330F73B09A8E3A75344D3C90BE67E70E0C1AB8A1C19396F5373EB92251D15EA13719D973A2E0143292ED28F86B16DC9A96D3F6271EAD8CE0764C7D4F88DBB2FD5E4C5CBC426D89434FA9D04E28EAF6C11E7B4C93A6701D344D891A65CB4C7C74FFC3551C5949A2D0368C6A68B81E8B985EB8665C72C3E6FF98A4B1AE4D5D7910729494A1E6F26D5AB2824262EC0482BDCE324D

if %BMG%==USA (
	wbmgt patch accf-data/files/Script/ENG/NPC_SP/NPC_gatekeeperA.bmg --patch replace=../BMG/ENG/NPC_gatekeeperA.txt
	wbmgt patch accf-data/files/Script/ENG/NPC_SP/NPC_periko.bmg --patch replace=../BMG/ENG/NPC_periko.txt
	wbmgt patch accf-data/files/Script/ENG/NPC_SP/NPC_perimi.bmg --patch replace=../BMG/ENG/NPC_perimi.txt
	wbmgt patch accf-data/files/Script/ENG/NPC_SP/NPC_tel.bmg --patch replace=../BMG/ENG/NPC_tel.txt
	wbmgt patch accf-data/files/Script/ENG/SYS_mess/SYS_Bus.bmg --patch replace=../BMG/ENG/SYS_Bus.txt
	wbmgt patch accf-data/files/Script/ENG/SYS_mess/SYS_NetworkError.bmg --patch replace=../BMG/ENG/SYS_NetworkError.txt
	wbmgt patch accf-data/files/Script/ENG/SYS_mess/SYS_Start.bmg --patch replace=../BMG/ENG/SYS_Start.txt
	copy /b ..\BMG\ENG\script.arc accf-data\files\Script\ENG\script.arc
	wbmgt patch accf-data/files/Script/FRA/NPC_SP/NPC_gatekeeperA.bmg --patch replace=../BMG/FRA/NPC_gatekeeperA.txt
	wbmgt patch accf-data/files/Script/FRA/NPC_SP/NPC_periko.bmg --patch replace=../BMG/FRA/NPC_periko.txt
	wbmgt patch accf-data/files/Script/FRA/NPC_SP/NPC_perimi.bmg --patch replace=../BMG/FRA/NPC_perimi.txt
	wbmgt patch accf-data/files/Script/FRA/NPC_SP/NPC_tel.bmg --patch replace=../BMG/FRA/NPC_tel.txt
	wbmgt patch accf-data/files/Script/FRA/SYS_mess/SYS_Bus.bmg --patch replace=../BMG/FRA/SYS_Bus.txt
	wbmgt patch accf-data/files/Script/FRA/SYS_mess/SYS_NetworkError.bmg --patch replace=../BMG/FRA/SYS_NetworkError.txt
	wbmgt patch accf-data/files/Script/FRA/SYS_mess/SYS_Start.bmg --patch replace=../BMG/FRA/SYS_Start.txt
	copy /b ..\BMG\FRA\script.arc accf-data\files\Script\FRA\script.arc
	wbmgt patch accf-data/files/Script/SPA/NPC_SP/NPC_gatekeeperA.bmg --patch replace=../BMG/SPA/NPC_gatekeeperA.txt
	wbmgt patch accf-data/files/Script/SPA/NPC_SP/NPC_periko.bmg --patch replace=../BMG/SPA/NPC_periko.txt
	wbmgt patch accf-data/files/Script/SPA/NPC_SP/NPC_perimi.bmg --patch replace=../BMG/SPA/NPC_perimi.txt
	wbmgt patch accf-data/files/Script/SPA/NPC_SP/NPC_tel.bmg --patch replace=../BMG/SPA/NPC_tel.txt
	wbmgt patch accf-data/files/Script/SPA/SYS_mess/SYS_Bus.bmg --patch replace=../BMG/SPA/SYS_Bus.txt
	wbmgt patch accf-data/files/Script/SPA/SYS_mess/SYS_NetworkError.bmg --patch replace=../BMG/SPA/SYS_NetworkError.txt
	wbmgt patch accf-data/files/Script/SPA/SYS_mess/SYS_Start.bmg --patch replace=../BMG/ENG/SYS_Start.txt
	copy /b ..\BMG\SPA\script.arc accf-data\files\Script\SPA\script.arc
	)
if %BMG%==JPN (
	wbmgt patch accf-data/files/Script/JPN/NPC_SP/NPC_gatekeeperA.bmg --patch replace=../BMG/JPN/NPC_gatekeeperA.txt
	wbmgt patch accf-data/files/Script/JPN/NPC_SP/NPC_periko.bmg --patch replace=../BMG/JPN/NPC_periko.txt
	wbmgt patch accf-data/files/Script/JPN/NPC_SP/NPC_perimi.bmg --patch replace=../BMG/JPN/NPC_perimi.txt
	wbmgt patch accf-data/files/Script/JPN/NPC_SP/NPC_tel.bmg --patch replace=../BMG/JPN/NPC_tel.txt
	wbmgt patch accf-data/files/Script/JPN/SYS_mess/SYS_Bus.bmg --patch replace=../BMG/JPN/SYS_Bus.txt
	wbmgt patch accf-data/files/Script/JPN/SYS_mess/SYS_NetworkError.bmg --patch replace=../BMG/JPN/SYS_NetworkError.txt
	wbmgt patch accf-data/files/Script/JPN/SYS_mess/SYS_Start.bmg --patch replace=../BMG/JPN/SYS_Start.txt
	copy /b ..\BMG\JPN\script.arc accf-data\files\Script\JPN\script.arc
	)
if %BMG%==KOR (
	wbmgt patch accf-data/files/Script/KOR/NPC_SP/NPC_gatekeeperA.bmg --patch replace=../BMG/KOR/NPC_gatekeeperA.txt
	wbmgt patch accf-data/files/Script/KOR/NPC_SP/NPC_periko.bmg --patch replace=../BMG/KOR/NPC_periko.txt
	wbmgt patch accf-data/files/Script/KOR/NPC_SP/NPC_perimi.bmg --patch replace=../BMG/KOR/NPC_perimi.txt
	wbmgt patch accf-data/files/Script/KOR/NPC_SP/NPC_tel.bmg --patch replace=../BMG/KOR/NPC_tel.txt
	wbmgt patch accf-data/files/Script/KOR/SYS_mess/SYS_Bus.bmg --patch replace=../BMG/KOR/SYS_Bus.txt
	wbmgt patch accf-data/files/Script/KOR/SYS_mess/SYS_NetworkError.bmg --patch replace=../BMG/KOR/SYS_NetworkError.txt
	wbmgt patch accf-data/files/Script/KOR/SYS_mess/SYS_Start.bmg --patch replace=../BMG/KOR/SYS_Start.txt
	copy /b ..\BMG\KOR\script.arc accf-data\files\Script\KOR\script.arc
	wbmgt patch accf-data/files/Script/JPN/NPC_SP/NPC_gatekeeperA.bmg --patch replace=../BMG/JPN/NPC_gatekeeperA.txt
	wbmgt patch accf-data/files/Script/JPN/NPC_SP/NPC_periko.bmg --patch replace=../BMG/JPN/NPC_periko.txt
	wbmgt patch accf-data/files/Script/JPN/NPC_SP/NPC_perimi.bmg --patch replace=../BMG/JPN/NPC_perimi.txt
	wbmgt patch accf-data/files/Script/JPN/NPC_SP/NPC_tel.bmg --patch replace=../BMG/JPN/NPC_tel.txt
	wbmgt patch accf-data/files/Script/JPN/SYS_mess/SYS_Bus.bmg --patch replace=../BMG/JPN/SYS_Bus.txt
	wbmgt patch accf-data/files/Script/JPN/SYS_mess/SYS_NetworkError.bmg --patch replace=../BMG/JPN/SYS_NetworkError.txt
	wbmgt patch accf-data/files/Script/JPN/SYS_mess/SYS_Start.bmg --patch replace=../BMG/JPN/SYS_Start.txt
	copy /b ..\BMG\JPN\script.arc accf-data\files\Script\JPN\script.arc
	)
if %BMG%==EUR (
	wbmgt patch accf-data/files/Script/ENG/NPC_SP/NPC_gatekeeperA.bmg --patch replace=../BMG/ENG/NPC_gatekeeperA.txt
	wbmgt patch accf-data/files/Script/ENG/NPC_SP/NPC_periko.bmg --patch replace=../BMG/ENG/NPC_periko.txt
	wbmgt patch accf-data/files/Script/ENG/NPC_SP/NPC_perimi.bmg --patch replace=../BMG/ENG/NPC_perimi.txt
	wbmgt patch accf-data/files/Script/ENG/NPC_SP/NPC_tel.bmg --patch replace=../BMG/ENG/NPC_tel.txt
	wbmgt patch accf-data/files/Script/ENG/SYS_mess/SYS_Bus.bmg --patch replace=../BMG/ENG/SYS_Bus.txt
	wbmgt patch accf-data/files/Script/ENG/SYS_mess/SYS_NetworkError.bmg --patch replace=../BMG/ENG/SYS_NetworkError.txt
	wbmgt patch accf-data/files/Script/ENG/SYS_mess/SYS_Start.bmg --patch replace=../BMG/ENG/SYS_Start.txt
	copy /b ..\BMG\ENG\script.arc accf-data\files\Script\ENG\script.arc
	wbmgt patch accf-data/files/Script/FRA/NPC_SP/NPC_gatekeeperA.bmg --patch replace=../BMG/FRA/NPC_gatekeeperA.txt
	wbmgt patch accf-data/files/Script/FRA/NPC_SP/NPC_periko.bmg --patch replace=../BMG/FRA/NPC_periko.txt
	wbmgt patch accf-data/files/Script/FRA/NPC_SP/NPC_perimi.bmg --patch replace=../BMG/FRA/NPC_perimi.txt
	wbmgt patch accf-data/files/Script/FRA/NPC_SP/NPC_tel.bmg --patch replace=../BMG/FRA/NPC_tel.txt
	wbmgt patch accf-data/files/Script/FRA/SYS_mess/SYS_Bus.bmg --patch replace=../BMG/FRA/SYS_Bus.txt
	wbmgt patch accf-data/files/Script/FRA/SYS_mess/SYS_NetworkError.bmg --patch replace=../BMG/FRA/SYS_NetworkError.txt
	wbmgt patch accf-data/files/Script/FRA/SYS_mess/SYS_Start.bmg --patch replace=../BMG/FRA/SYS_Start.txt
	copy /b ..\BMG\FRA\script.arc accf-data\files\Script\FRA\script.arc
	wbmgt patch accf-data/files/Script/GER/NPC_SP/NPC_gatekeeperA.bmg --patch replace=../BMG/GER/NPC_gatekeeperA.txt
	wbmgt patch accf-data/files/Script/GER/NPC_SP/NPC_periko.bmg --patch replace=../BMG/GER/NPC_periko.txt
	wbmgt patch accf-data/files/Script/GER/NPC_SP/NPC_perimi.bmg --patch replace=../BMG/GER/NPC_perimi.txt
	wbmgt patch accf-data/files/Script/GER/NPC_SP/NPC_tel.bmg --patch replace=../BMG/GER/NPC_tel.txt
	wbmgt patch accf-data/files/Script/GER/SYS_mess/SYS_Bus.bmg --patch replace=../BMG/GER/SYS_Bus.txt
	wbmgt patch accf-data/files/Script/GER/SYS_mess/SYS_NetworkError.bmg --patch replace=../BMG/GER/SYS_NetworkError.txt
	wbmgt patch accf-data/files/Script/GER/SYS_mess/SYS_Start.bmg --patch replace=../BMG/GER/SYS_Start.txt
	copy /b ..\BMG\GER\script.arc accf-data\files\Script\GER\script.arc
	wbmgt patch accf-data/files/Script/SPA/NPC_SP/NPC_gatekeeperA.bmg --patch replace=../BMG/SPA/NPC_gatekeeperA.txt
	wbmgt patch accf-data/files/Script/SPA/NPC_SP/NPC_periko.bmg --patch replace=../BMG/SPA/NPC_periko.txt
	wbmgt patch accf-data/files/Script/SPA/NPC_SP/NPC_perimi.bmg --patch replace=../BMG/SPA/NPC_perimi.txt
	wbmgt patch accf-data/files/Script/SPA/NPC_SP/NPC_tel.bmg --patch replace=../BMG/SPA/NPC_tel.txt
	wbmgt patch accf-data/files/Script/SPA/SYS_mess/SYS_Bus.bmg --patch replace=../BMG/SPA/SYS_Bus.txt
	wbmgt patch accf-data/files/Script/SPA/SYS_mess/SYS_NetworkError.bmg --patch replace=../BMG/SPA/SYS_NetworkError.txt
	wbmgt patch accf-data/files/Script/SPA/SYS_mess/SYS_Start.bmg --patch replace=../BMG/SPA/SYS_Start.txt
	copy /b ..\BMG\SPA\script.arc accf-data\files\Script\SPA\script.arc
	wbmgt patch accf-data/files/Script/ITA/NPC_SP/NPC_gatekeeperA.bmg --patch replace=../BMG/ITA/NPC_gatekeeperA.txt
	wbmgt patch accf-data/files/Script/ITA/NPC_SP/NPC_periko.bmg --patch replace=../BMG/ITA/NPC_periko.txt
	wbmgt patch accf-data/files/Script/ITA/NPC_SP/NPC_perimi.bmg --patch replace=../BMG/ITA/NPC_perimi.txt
	wbmgt patch accf-data/files/Script/ITA/NPC_SP/NPC_tel.bmg --patch replace=../BMG/ITA/NPC_tel.txt
	wbmgt patch accf-data/files/Script/ITA/SYS_mess/SYS_Bus.bmg --patch replace=../BMG/ITA/SYS_Bus.txt
	wbmgt patch accf-data/files/Script/ITA/SYS_mess/SYS_NetworkError.bmg --patch replace=../BMG/ITA/SYS_NetworkError.txt
	wbmgt patch accf-data/files/Script/ITA/SYS_mess/SYS_Start.bmg --patch replace=../BMG/ITA/SYS_Start.txt
	copy /b ..\BMG\ITA\script.arc accf-data\files\Script\ITA\script.arc
	)

mkdir wiimmfi-images
wit copy accf-data wiimmfi-images --update --psel=DATA --wiimmfi -ovv
wit move wiimmfi-images/accf-data.wbfs wiimmfi-images

rmdir accf-data

echo Done.

echo If your patch completed successfully, your WBFS will now be in the "wiimmfi-images" folder - please copy the WBFS in there to your USB.
pause
