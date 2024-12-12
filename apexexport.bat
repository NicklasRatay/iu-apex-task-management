:: Export APEX application and database schema into /src
::------------------------------
:: Parameters:
:: %1 = DB wallet zip file
:: %2 = DB connection string
::------------------------------

@echo off
:: Save the current working directory to a variable
set "CURRENT_DIR=%CD%"

:: Define the target directory as the /src subdirectory
set "TARGET_DIR=%CURRENT_DIR%\src"

:: Ensure the /src subdirectory exists
if not exist "%TARGET_DIR%" mkdir "%TARGET_DIR%"

:: Recreate the temporary stage directory and change directory to it
if exist %TEMP%\stage_f100 rmdir /s /q %TEMP%\stage_f100
mkdir %TEMP%\stage_f100
cd %TEMP%\stage_f100

:: Read the master_data_tables.txt file and append table names to include for data export
set "CONFIG_FILE=%CURRENT_DIR%\master_data_tables.txt"
set "INCLUDE_TABLES="

:: Enable delayed variable expansion
setlocal enabledelayedexpansion

:: Read the file and append table names to INCLUDE_TABLES
for /F "tokens=* delims=" %%a in ('Type "%CONFIG_FILE%"') do (
    if "!INCLUDE_TABLES!"=="" (
        set "INCLUDE_TABLES=%%a"
    ) else (
        set "INCLUDE_TABLES=!INCLUDE_TABLES!,%%a"
    )
)

:: Store the final concatenated list into a standard variable (no delayed expansion required now)
endlocal & set "FINAL_INCLUDE_TABLES=%INCLUDE_TABLES%"

:: Export APEX application and schema to stage directory
(
echo set cloudconfig %CURRENT_DIR%\wallets\%1
echo connect %2
echo apex export -applicationid 100 -split -skipExportDate -expOriginalIds -expSupportingObjects Y -expType APPLICATION_SOURCE,READABLE_YAML
echo set ddl storage off
echo set ddl partitioning off
echo set ddl segment_attributes off
echo set ddl tablespace off
echo set ddl emit_schema off
echo lb generate-schema -split
echo lb data -output-file master_data.xml -include-objects %FINAL_INCLUDE_TABLES%
) | sql /nolog

:: Copy APEX application export files in the ./fNNN subdirectory to the original working directory
robocopy %TEMP%\stage_f100\f100 "%TARGET_DIR%" * /mir

:: Remove APEX export files, leaving only Liquibase DB export artifacts
rmdir /s /q %TEMP%\stage_f100\f100

:: Copy the Liquibase DB export artifacts to ./database subdir of the original working directory
if not exist "%TARGET_DIR%\database" mkdir "%TARGET_DIR%\database"
robocopy %TEMP%\stage_f100 "%TARGET_DIR%\database" * /mir

:: Change directory back to the original working directory
cd "%CURRENT_DIR%"
