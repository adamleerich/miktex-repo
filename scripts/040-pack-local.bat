@echo off
REM Author: Adam L. Rich
REM Date:   September 4, 2017
REM Description:
REM   Extract lzma files downloaded (using 7-zip)
REM   


7z a -ttar .\index-local\miktex-zzdb1-2.9.tar .\index-local\miktex-zzdb1-2.9\*
7z a -ttar .\index-local\miktex-zzdb2-2.9.tar .\index-local\miktex-zzdb2-2.9\*

7z a -t7z .\repo-local\miktex-zzdb2-2.9.tar.lzma .\index-local\miktex-zzdb2-2.9.tar
7z a -t7z .\repo-local\miktex-zzdb1-2.9.tar.lzma .\index-local\miktex-zzdb1-2.9.tar

rm .\index-local\miktex-zzdb1-2.9.tar 
rm .\index-local\miktex-zzdb2-2.9.tar 

REM Also copy README.txt...
copy .\index-full\README.TXT .\repo-local\
        


