# setup.R - Installs all required R packages for the analysis
required_packages <- c(
  "tidyverse", "data.table", "lubridate", "janitor", "skimr",
  "tidymodels", "caret", "xgboost", "lightgbm", "e1071",
  "forecast", "prophet", "vars",
  "text2vec", "tidytext", "topicmodels",
  "cluster", "factoextra", "fmsb"
)

install_if_missing <- function(p) {
  if (!require(p, character.only = TRUE)) {
    install.packages(p, dependencies = TRUE)
  }
}

invisible(sapply(required_packages, install_if_missing))
message("✅ R Environment Setup Complete!")