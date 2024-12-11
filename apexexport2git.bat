:: APEX Export to Git
::-----------------------------
:: %1 = DB connection string
:: %2 = DB wallet zip file
::-----------------------------
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
:: Export APEX application and schema to stage directory
(
echo set cloudconfig %CURRENT_DIR%\%2
echo connect %1
echo apex export -applicationid 100 -split -skipExportDate -expOriginalIds -expSupportingObjects Y -expType APPLICATION_SOURCE,READABLE_YAML
echo set ddl storage off
echo set ddl partitioning off
echo set ddl segment_attributes off
echo set ddl tablespace off
echo set ddl emit_schema off
echo lb generate-schema -split
) | sql /nolog
:: Copy APEX application export files in the ./fNNN subdirectory to the original working directory
robocopy %TEMP%\stage_f100\f100 "%TARGET_DIR%" * /mir /xd ".git"
:: Remove APEX export files, leaving only Liquibase DB export artifacts
rmdir /s /q %TEMP%\stage_f100\f100
:: Copy the Liquibase DB export artifacts to ./database subdir of the original working directory
if not exist "%TARGET_DIR%\database" mkdir "%TARGET_DIR%\database"
robocopy %TEMP%\stage_f100 "%TARGET_DIR%\database" * /mir /xd ".git"
:: Change directory back to the original working directory
cd "%TARGET_DIR%"
