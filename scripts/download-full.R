# Author: Adam L. Rich
# Date:   September 4, 2017
# Description:
#   Download files from MiKTeX repo
#   that are required in local repo


# setwd('c:/home/git/Other/miktex-repo/')
# url <- 'http://mirror.unl.edu/ctan/systems/win32/miktex/tm/packages/'
# url <- 'http://mirrors.rit.edu/CTAN/systems/win32/miktex/tm/packages/'
url <- 'http://dante.ctan.org/tex-archive/systems/win32/miktex/tm/packages/'


f <- c(
  'README.TXT', 
  'miktex-zzdb1-2.9.tar.lzma', 
  'miktex-zzdb2-2.9.tar.lzma'
)


file <- 'README.TXT'
download.file(
  url = paste0(url, file), 
  destfile = paste0('./repo-local/', file),
  mode = 'wb'
)


file <- 'miktex-zzdb1-2.9.tar.lzma'
download.file(
  url = paste0(url, file), 
  destfile = paste0('./repo-local/', file),
  mode = 'wb'
)


file <- 'miktex-zzdb2-2.9.tar.lzma'
download.file(
  url = paste0(url, file), 
  destfile = paste0('./repo-local/', file),
  mode = 'wb'
)


