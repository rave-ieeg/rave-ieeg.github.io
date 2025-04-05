options(
  repos = c(
    raveieeg = "https://rave-ieeg.r-universe.dev",
    RSPM = "https://packagemanager.rstudio.com/all/latest",
    CRAN = "https://cran.rstudio.com/"
  ),
  renv.config.auto.snapshot = TRUE,
  renv.config.rspm.enabled = TRUE,
  renv.config.cache.enabled = TRUE
)
## For Linux and Windows users, we'll use RStudio Package Manager (RSPM).

if (Sys.info()[['sysname']] %in% c('Linux')) {
  options(repos = c(
    raveieeg = "https://rave-ieeg.r-universe.dev",
    CRAN = "https://packagemanager.rstudio.com/all/latest",
    CRAN_ORIG = "https://cran.rstudio.com/"
  ))
} else {
  ## RSPM does not yet support Mac binaries.
  options(repos = c(
    raveieeg = "https://rave-ieeg.r-universe.dev",
    CRAN = "https://cran.rstudio.com/"
  ))
}
options(renv.config.repos.override = getOption("repos"))

source("renv/activate.R")

local({
  wd <- normalizePath(getwd())
  Sys.setenv(
    "R_USER_DATA_DIR" = file.path(wd, "data", "library", "data"),
    "R_USER_CONFIG_DIR" = file.path(wd, "data", "library", "config")
  )
  if(system.file(package = "ravepipeline") != '') {
    try({
      ravepipeline <- asNamespace("ravepipeline")
      ravepipeline$raveio_setopt(key = "data_dir", file.path(wd, "data", "processed"))
      ravepipeline$raveio_setopt(key = "raw_data_dir", file.path(wd, "data", "raw"))
    })
  }
})


# utility functions
.help_text <- function(...) {
  file <- help(...)
  path <- dirname(file)
  dirpath <- dirname(path)
  pkgname <- basename(dirpath)
  RdDB <- file.path(path, pkgname)
  rd <- tools:::fetchRdDB(RdDB, basename(file))
  s <- character()
  conn <- textConnection(object = "s", open = "w", local = TRUE)
  on.exit({close(conn)})
  tools::Rd2HTML(rd, out = conn, fragment = TRUE)
  re <- textConnectionValue(conn)
  re_trim <- trimws(re)
  re <- re[!re_trim %in% c("<h3>NA</h3>")]
  cat(re, sep = "\n")
  invisible()
}
