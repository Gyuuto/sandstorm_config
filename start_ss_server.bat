@echo off

rem set SteamAPPID=581330

setlocal enabledelayedexpansion

set Map[Crossing]=Canyon
set Map[Farmhouse]=Framhouse
set Map[Hideout]=Town
set Map[Precinct]=Precinct
set Map[Refinery]=Olifield
set Map[Summit]=Mountain

set n=0
for /f %%s in (MapCycle.txt) do (
    set scenario[!n!]=%%s
    set /a n=n+1
)

echo %random%
set /a selectIdx=%random%*%n%/32767

call set firstScenario=%%scenario[%selectIdx%]%%
set firstScenario=%firstScenario:_Checkpoint_Security=%
set firstScenario=%firstScenario:_Checkpoint_Insurgents=%
set firstScenario=%firstScenario:~9%

call set map=%%Map[%firstScenario%]%%
call set firstScenario=%%scenario[%selectIdx%]%%

echo %firstScenario%
echo %map%

d:\steam\steamapps\common\sandstorm_server\InsurgencyServer.exe %map%?Scenario=%firstScenario%?password=5963?MaxPlayers=8 -log -hostname="[JP Only]パスワードはご苦労さんを数字で" -Port=62944 -QueryPort=62945
