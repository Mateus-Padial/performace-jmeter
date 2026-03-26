@echo off
REM ============================
REM JMeter Execution Script
REM ============================

REM --- Configurações ---
SET JMETER_DIR=C:\apache-jmeter-5.6.3
SET TEST_PLAN=.\test-plans\blazedemo-purchase.jmx
SET RESULTS_DIR=.\results
SET REPORTS_DIR=.\reports
SET DURATION=%1

REM --- Valor padrão se não passar parâmetro ---
IF "%DURATION%"=="" SET DURATION=300

REM --- Limpa resultados anteriores ---
IF EXIST "%RESULTS_DIR%" (
    echo Deleting previous results folder...
    rmdir /s /q "%RESULTS_DIR%"
)
IF EXIST "%REPORTS_DIR%" (
    echo Deleting previous reports folder...
    rmdir /s /q "%REPORTS_DIR%"
)

REM --- Cria pastas vazias ---
mkdir "%RESULTS_DIR%"
mkdir "%REPORTS_DIR%"

REM --- Executa JMeter ---
echo Running JMeter test...
"%JMETER_DIR%\bin\jmeter.bat" -n -t "%TEST_PLAN%" -l "%RESULTS_DIR%\results.jtl" -e -o "%REPORTS_DIR%" -Jduration=%DURATION%

REM --- Fim ---
echo Test execution finished.
pause