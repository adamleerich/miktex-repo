#
# CANNOT GET LOCAL INDEX FILE IDEA TO WORK 
#


# # Author: Adam L. Rich
# # Date:   September 4, 2017
# # Description:
# #   Parse tine INI file
# #   create a local, shorter file
# 
# 
# # setwd('c:/home/git/Other/miktex-repo/')
# require(dplyr)
# require(tidyr)
# 
# 
# full_path <- './index-full/miktex-zzdb1-2.9/mpm.ini'
# local_path <- './index-local/miktex-zzdb1-2.9/mpm.ini'
# full_text <- readLines(full_path)
# 
# start <- grepl(pattern = '^\\[', x = full_text)
# start_1 <- ifelse(start, 1, 0)
# index <- cumsum(start_1)
# 
# keys <- gsub(pattern = '^(.*)={1}(.*)$', replacement = '\\1', x = full_text)
# values <- gsub(pattern = '^(.*)={1}(.*)$', replacement = '\\2', x = full_text)
# 
# 
# full_df <- data.frame(
#   index = index,
#   start = start,
#   keys = keys,
#   values = values,
#   stringsAsFactors = FALSE
# )
# full_df$keys[start] <- 'Pkg'
# full_df <- full_df[!(full_df$keys == '' | full_df$index == 0), ]
# full_df$start <- NULL
# 
# 
# 
# 
# # Order in INI file, if present
# #   Pkg (not in INI file, here for convenience only)
# #   CabMD5
# #   CabSize
# #   Level
# #   MD5
# #   TargetSystem
# #   TimePackaged
# #   Type
# #   Version
# full_spread <- spread(full_df, key = keys, value = values)
# 
# 
# 
# 
# # Inspect values
# table(full_spread$Level, useNA = 'always')
# table(full_spread$TargetSystem, useNA = 'always')
# table(full_spread$Type, useNA = 'always')
# table(is.na(full_spread$CabMD5))
# table(is.na(full_spread$CabSize))
# table(is.na(full_spread$MD5))
# table(is.na(full_spread$Pkg))
# table(is.na(full_spread$TimePackaged))
# table(is.na(full_spread$Version))
# 
# 
# 
# # Abort if Type is not expected or NA
# stopifnot(sum(is.na(full_spread$Type)) == 0)
# stopifnot(sum(!full_spread$Type %in% c('MSCab', 'TarBzip2', 'TarLzma')) == 0)
#           
# 
# 
# 
# # Load list of packages we want in local INI file
# local <- readLines('LOCAL')
# local <- local[local != '']
# 
# 
# local_spread <- full_spread[full_spread$Pkg %in% paste0('[', local, ']'), ]
# 
# 
# 
# # Create local INI file
# local_text <- rep('', length(local) * 10)
# j <- 0
# for(i in 1:nrow(local_spread)) {
#   local_text[j +  1] <- local_spread$Pkg[i]
#   local_text[j +  2] <- paste0('CabMD5=', local_spread$CabMD5[i])
#   local_text[j +  3] <- paste0('CabSize=', local_spread$CabSize[i])
#   local_text[j +  4] <- paste0('Level=', local_spread$Level[i])
#   local_text[j +  5] <- paste0('MD5=', local_spread$MD5[i])
#   local_text[j +  6] <- paste0('TargetSystem=', local_spread$TargetSystem[i])
#   local_text[j +  7] <- paste0('TimePackaged=', local_spread$TimePackaged[i])
#   local_text[j +  8] <- paste0('Type=', local_spread$Type[i])
#   local_text[j +  9] <- paste0('Version=', local_spread$Version[i])
#   local_text[j + 10] <- ''
#   j <- j + 10
# }
# 
# local_text <- local_text[
#   !substring(local_text, first = nchar(local_text) - 2, last = nchar(local_text)) == '=NA']
# 
# 
# writeLines(local_text, local_path)
# 
# 
# 
# # Create a file listing pkgs to download with extensions
# #   MSCab     -> .cab
# #   TarLzma   -> .tar.lzma
# #   TarBzip2  -> .tar.bz2
# local_spread$name <- gsub(pattern = '^\\[(.*)\\]$', replacement = '\\1', local_spread$Pkg)
# local_spread$ext <- ifelse(
#   local_spread$Type == 'MSCab', 
#   '.cab',
#   ifelse(local_spread$Type == 'TarLzma', '.tar.lzma', '.tar.bz2')
# )
# 
# local_spread$download <- paste0(local_spread$name, local_spread$ext)
# 
# writeLines(local_spread$download, 'DOWNLOAD')
# 
# 
# 
# 
# # Copy over TPM files
# for(l in local) {
#   file.copy(
#     from = paste0('./index-full/miktex-zzdb2-2.9/texmf/tpm/packages/', l, '.tpm'),
#     to = paste0('./index-local/miktex-zzdb2-2.9/texmf/tpm/packages/', l, '.tpm'),
#     overwrite = TRUE
#   )
# }
# 
# 
# 