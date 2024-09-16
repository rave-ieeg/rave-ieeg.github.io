source("renv/activate.R")

local({
  wd <- normalizePath(getwd())
  Sys.setenv(
    "R_USER_DATA_DIR" = file.path(wd, "data", "library", "data"),
    "R_USER_CONFIG_DIR" = file.path(wd, "data", "library", "config")
  )
  if(system.file(package = "raveio") != '') {
    try({
      raveio <- asNamespace("raveio")
      raveio$raveio_setopt(key = "data_dir", file.path(wd, "data", "processed"))
      raveio$raveio_setopt(key = "raw_data_dir", file.path(wd, "data", "raw"))
    })
  }
})
