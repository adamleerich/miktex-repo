# Author: Adam L. Rich
# Date:   September 4, 2017
# Description:
#   Download files from MiKTeX repo
#   that are required in local repo


url <- 'http://mirror.unl.edu/ctan/systems/win32/miktex/tm/packages/'

f <- c(
  'README.TXT', 
  'miktex-zzdb1-2.9.tar.lzma', 
  'miktex-zzdb2-2.9.tar.lzma'
)


file <- 'README.TXT'
download.file(
  url = paste0(url, file), 
  destfile = paste0('./index-full/', file)
)


file <- 'miktex-zzdb1-2.9.tar.lzma'
download.file(
  url = paste0(url, file), 
  destfile = paste0('./index-full/', file)
)


file <- 'miktex-zzdb2-2.9.tar.lzma'
download.file(
  url = paste0(url, file), 
  destfile = paste0('./index-full/', file)
)


