:: Deploy schema changes and APEX application
::------------------------------
:: Parameters:
:: %1 = DB wallet zip file
:: %2 = DB connection string
::------------------------------

@echo off
:: Save the current working directory to a variable
set "CURRENT_DIR=%CD%"

:: Navigate to the source directory
pushd "%CURRENT_DIR%\src\database"

:: Apply pending changes to the database and install the APEX application
(
echo set cloudconfig %CURRENT_DIR%\wallets\%1
echo connect %2
echo set ddl storage off
echo set ddl partitioning off
echo set ddl segment_attributes off
echo set ddl tablespace off
echo set ddl emit_schema off
echo lb update -changelog-file controller.xml
echo @../install.sql
) | sql /nolog
popd
