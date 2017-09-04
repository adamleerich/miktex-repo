@echo off
REM Author: Adam L. Rich
REM Date:   September 4, 2017
REM Description:
REM   Extract lzma files downloaded (using 7-zip)
REM   

7z x .\index-full\miktex-zzdb1-2.9.tar.lzma -o".\index-full\"
7z x .\index-full\miktex-zzdb2-2.9.tar.lzma -o".\index-full\"

7z x .\index-full\miktex-zzdb1-2.9.tar -o".\index-full\miktex-zzdb1\"
7z x .\index-full\miktex-zzdb2-2.9.tar -o".\index-full\miktex-zzdb2\"

rm .\index-full\miktex-zzdb1-2.9.tar 
rm .\index-full\miktex-zzdb2-2.9.tar 




