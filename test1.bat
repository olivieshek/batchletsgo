@ECHO off
@CHCP 65001

SETLOCAL EnableDelayedExpansion

GOTO :startOfGame

:startOfGame
:: Начало игры, приветствие.
setlocal DisableDelayedExpansion
echo Добро пожаловать в Удивительный Цифровой Цирк^!
call :wait 2
echo Меня зовут Кейн и я рад приветствовать тебя здесь^!
endlocal
call :wait 2
:: Чистим экран.
pause
cls
echo Не бойся того, что ты не помнишь, как тебя зовут.
call :wait 2
echo Это нормально. Каждый, кто оказывается здесь, сталкивается с этим.
call :wait 2
echo Давай придумаем тебе новое имя?
:: Вызываем функцию newName
call :newName
echo Как тебе твоё новое имя?
set /P userChoice=1(☑) / 0(☒)

exit /b


:newName
:: Создание "нового" имени (начало игры).
set /P userChoice=1(ДА) / 0(НЕТ): 
IF "%userChoice%"=="9" (
    exit /b
) ELSE IF "%userChoice%"=="1" (
	cls
	setlocal EnableDelayedExpansion
    set "alphabet=ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    set "playerName="
    FOR /L %%i in (1,1,5) DO (
    	set /A "index=!random! %% 26"
		for /L %%j in (!index!,1,!index!) DO (
			set "playerName=!playerName!!alphabet:~%%j,1!"
			echo !playerName!
			call :wait 2
			cls
		)
    )
    echo Привет, !playerName!^^!
    set "userChoice="
    endlocal
    GOTO :EOF
) ELSE (
	echo Ха-ха, давай подумаем ещё разок!
	GOTO :newName
)


:wait
:: Ожидание N секунд.
set /A "seconds=%1"
ping -n !seconds! 127.0.0.1 > nul
GOTO :EOF