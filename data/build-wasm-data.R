# Download webr repo to home folder
# brew install emscripten
Sys.setenv(
  "WEBR_ROOT" = normalizePath("~/webr", mustWork = TRUE),
  "EMSCRIPTEN_ROOT" = "/opt/homebrew/Cellar/emscripten/3.1.67/libexec"
)

# or save to `~/.webr-vars.mk`
# WEBR_ROOT=~/webr
# EMSCRIPTEN_ROOT=/opt/homebrew/Cellar/emscripten/3.1.67/libexec

library(rwasm)

setwd(rstudioapi::getActiveProject())

# remove all the .DS_Store
fs <- list.files(
  "./data/library/data/R/raveio/rave-pipelines/",
  pattern = "^\\.",
  all.files = TRUE,
  full.names = TRUE,
  recursive = TRUE,
  include.dirs = FALSE
)
sum(unlist(lapply(fs, unlink)), 0)

raveio_pipeline_src <- normalizePath("./data/library/data/R/raveio/rave-pipelines/", winslash = "/")
raveio_pipeline_dst <- normalizePath("./data/wasm/", winslash = "/")

rwasm::file_packager(
  in_dir = raveio_pipeline_src,
  out_dir = raveio_pipeline_dst,
  out_name = "rave-pipeline-package",
  compress = FALSE
)
