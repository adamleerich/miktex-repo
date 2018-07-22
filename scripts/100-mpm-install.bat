@echo off
REM Author: Adam L. Rich
REM Date:   September 4, 2017
REM Description:
REM   Run Rscript to download files from MiKTeX repo
REM   

for /F "tokens=1 delims=." %%F in (DOWNLOAD) do (
	@echo.%%F
	mpm --admin --install %%F
)
