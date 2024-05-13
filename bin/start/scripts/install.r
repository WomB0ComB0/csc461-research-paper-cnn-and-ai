options(repos = "https://cloud.r-project.org")

# Set the correct path to requirements file
path_to_requirements <- "./requiments.txt"


if (!file.exists(path_to_requirements)) {
  stop("Requirements file not found.")
}

if (!requireNamespace("requiRements", quietly = TRUE)) {
  install.packages("requiRements")
}
library(requiRements)

required_packages <- readLines(path_to_requirements)

for (pkg in required_packages) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    cat("Installing", pkg, "...\n")
    tryCatch({
      install.packages(pkg)
    }, error = function(e) {
      cat("Installation of", pkg, "failed:", e$message, "\n")
    })
  } else {
    cat("Package", pkg, "is already installed.\n")
  }
}