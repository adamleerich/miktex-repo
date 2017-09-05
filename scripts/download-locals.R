# Author: Adam L. Rich
# Date:   September 4, 2017
# Description:
#   Download files from MiKTeX repo
#   that are required in local repo


# setwd('c:/home/git/Other/miktex-repo/')
url <- 'http://mirror.unl.edu/ctan/systems/win32/miktex/tm/packages/'
        


locals <- readLines('DOWNLOAD')

for (l in locals) {
  # print(paste0(url, l))
  download.file(
    url = paste0(url, l), 
    destfile = paste0('./repo-local/', l)
  )
}

