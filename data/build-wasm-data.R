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


# find package dependence
s <- strsplit(
  "triebeard, rematch, cellranger, forcats, httpcode, urltools, bit, progress, bit64, corrplot, writexl, readxl, haven, foreign, crul, fontLiberation, fontBitstreamVera, BH, tzdb, vroom, hms, zoo, rstatix, polynom, gridExtra, ggsignif, ggsci, ggrepel, fontquiver, curl, gfonts, openxlsx, rio, lmtest, cpp11, datawizard, insight, readr, ggpubr, editData, devEMF, rvg, mnormt, sjmisc, nortest, RcppEigen, polyclip, tweenr, gdtools, officer, vcd, ggforce, ztable, psych, rrtable, flextable, sjlabelled, moonBook, here, RcppTOML, pbdZMQ, reticulate, hdf5r",
  ", "
)[[1]]

leaves <- NULL
deps <- strsplit(
  "curl, mnormt, here, RcppTOML, pbdZMQ, reticulate, hdf5r",
  ", "
)[[1]]

for(pkg in s) {
  if(!pkg %in% deps) {
    cat(pkg, "\n")
    tbl <- pak::pkg_deps(pkg)
    sel <- leaves %in% tbl$ref
    d2 <- tbl$ref[tbl$ref != pkg]
    deps <- unique(c(deps, leaves[sel], d2))
    leaves <- c(leaves[!sel], pkg)
  }
}

leaves <- leaves[!leaves %in% deps]
cat(paste0('"', leaves, '"', collapse = ", "))
install.packages(c("raveio", "ravebuiltins", "progress", "foreign", "BH", "gfonts", "cpp11", "RcppEigen", "vcd", "ggforce", "psych", "rrtable"))


raveio::pipeline("import_lfp_native")

install.packages(c("raveio", "ravebuiltins", "progress", "foreign", "BH", "gfonts", "cpp11", "RcppEigen", "vcd", "ggforce", "psych", "rrtable"))
webr::mount(
  "/home/web_user/rave-pipelines",
  "https://rave.wiki/data/wasm/rave-pipeline-package.data"
)
raveio::pipeline_install_local("/home/web_user/rave-pipelines")


pipeline <- raveio::pipeline("import_lfp_native")
pipeline$set_settings(
  skip_validation = TRUE, import_setup__subject_code = "DemoSubject",
  import_setup__project_name = "test", import_channels__unit = "NA",
  import_channels__sample_rate = 2000L, import_channels__electrodes = "14-15",
  import_channels__electrode_file = "auto", import_blocks__session_block = "008",
  import_blocks__format = ".mat/.h5 file per electrode per block",
  force_import = TRUE)
raveio::raveio_setopt("max_worker", 1)
pipeline$eval()

subject <- raveio::as_rave_subject("demo/DemoSubject")

data.frame(
  Electrode = subject$electrodes,

)
subject$get_electrode_table()
subject$reference_names

repo = raveio::prepare_subject_raw_voltage_with_epoch(subject, time_windows = c(-1, 2))
