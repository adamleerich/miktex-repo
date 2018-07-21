REM
REM CANNOT GET LOCAL INDEX FILE IDEA TO WORK 
REM
REM @echo off
REM REM Author: Adam L. Rich
REM REM Date:   September 4, 2017
REM REM Description:
REM REM   Extract lzma files downloaded (using 7-zip)
REM REM   
REM 
REM 
REM 7z a -ttar .\index-local\miktex-zzdb1-2.9.tar .\index-local\miktex-zzdb1-2.9\*
REM 7z a -ttar .\index-local\miktex-zzdb2-2.9.tar .\index-local\miktex-zzdb2-2.9\*
REM 
REM 7z a -t7z .\repo-local\miktex-zzdb2-2.9.tar.lzma .\index-local\miktex-zzdb2-2.9.tar
REM 7z a -t7z .\repo-local\miktex-zzdb1-2.9.tar.lzma .\index-local\miktex-zzdb1-2.9.tar
REM 
REM rm .\index-local\miktex-zzdb1-2.9.tar 
REM rm .\index-local\miktex-zzdb2-2.9.tar 
REM 
REM REM Also copy README.txt...
REM copy .\index-full\README.TXT .\repo-local\
        


