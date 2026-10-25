## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##
## Script name:
##
## Purpose of script:
##
## Date Created: 2026-10-25
##
## Copyright (c) PSUX TM, 2026
## Email: psuxmusic@gmail.com
##
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##
## Notes:
##
##
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## rm(list=ls())



library(tidyverse)
library(reactable)
library(reactablefmtr)

# Load the local copy of the PeteSux data
load("data/trax.rda")

# Songs catalogue
df <- trax %>%
  select(
    sort,
    cdseq:year,
    secs:time,
    `album name` = full_name_text,
    `psux year` = psx_album_year
  )

# Unique albums
df2 <- df %>%
  select(cdseq, `psux year`, `album name`) %>%
  distinct()

# Artists ranked by number of tracks
df3 <- df %>%
  count(artist) %>%
  arrange(desc(n))
