args <- commandArgs(trailingOnly = TRUE)
# https://ctan.org/help/submit?lang=en

library(httr)

# ---- payload ----
fields_validate <- list(
  author = "Joseph Stachelek",
  pkg = "tikz-lake-fig",
  version = "1.0.0",
  email = "stachel2@msu.edu",
  uploader = "Joseph Stachelek",
  license = "lppl1.3c",
  summary = "A collection of schematic diagrams of lakes for use in LaTeX documents.",
  description = "Commands to produce a variety of schematic lake diagrams for use in LaTeX documents. Diagrams include representations of material budgets, fluxes, and connectivity arrangements.",
  announcement = "Initial package release",
  repository = "https://github.com/jsta/tikz-lake-fig", 
  bugtracker = "https://github.com/jsta/tikz-lake-fig/issues",
  support = "https://github.com/jsta/tikz-lake-fig/issues",
  file = upload_file("tikz-lake-fig.zip"))

# ---- build ----
if ("--build" %in% args) {
  setwd("../")
  file.copy("tikz-lake-fig/README.md", "gh_README.md")
  file.copy("tikz-lake-fig/README_ctan.md", "tikz-lake-fig/README.md")
    unlink("tikz-lake-fig/tikz-lake-fig.zip"); unlink("tikz-lake-fig.zip")
  zip("tikz-lake-fig.zip", 
        paste0("tikz-lake-fig/",
               c("README.md", "tikz-lake-fig.sty", "tikz-lake-fig-doc.tex", 
                 "tikz-lake-fig-doc.pdf")))
  file.copy("gh_README.md", "tikz-lake-fig/README.md")
  unlink("gh_README.md")
  file.rename("tikz-lake-fig.zip", "tikz-lake-fig/tikz-lake-fig.zip")
  setwd("tikz-lake-fig")
}

# ---- validate ----
if ("--validate" %in% args) {
  validate <- httr::POST("https://www.ctan.org/submit/validate", 
                         body = fields_validate)
  if (length(content(validate, "parsed")) > 0) {
    stop(paste0("Validation errors found:\n", 
                content(validate, "parsed")))
  }else{
    print(paste0("No validation errors found."))
  }
}

# ---- submit ----
if ("--submit" %in% args) {
  print("hooray")
  fields_submit <- fields_validate
  submit <- httr::POST("https://www.ctan.org/submit/upload",
                         body = fields_submit)
  str(content(submit, "parsed"))
}
