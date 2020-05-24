args <- commandArgs(trailingOnly = TRUE)
# https://ctan.org/help/submit?lang=en

library(httr)

if ("--validate" %in% args) {
  # ---- validate payload ----
  fields_validate <- list(
    author = "Joseph Stachelek",
    pkg = "tikz-lake-fig",
    # version = "1.0.0",
    email = "stachel2@msu.edu",
    uploader = "Joseph Stachelek",
    license = "lppl1.3c",
    summary = "A variety of customizable lake diagrams",
    repository = "https://github.com/jsta/tikz-lake-fig", 
    bugtracker = "https://github.com/jsta/tikz-lake-fig/issues",
    support = "https://github.com/jsta/tikz-lake-fig/issues",
    file = upload_file("tikz-lake-fig.zip"))
  validate <- httr::POST("https://www.ctan.org/submit/validate", 
                         body = fields_validate)
  if (length(content(validate, "parsed")) > 0) {
    print(paste0("Validation errors found:"))
    print(str(content(validate, "parsed")))
  }else{
    print(paste0("No validation errors found."))
  }
}

# ---- build ----
if ("--build" %in% args) {
  setwd("../")
  unlink("tikz-lake-fig/tikz-lake-fig.zip"); unlink("tikz-lake-fig.zip")
  zip("tikz-lake-fig.zip", paste0("tikz-lake-fig/",
                                  c("README.md", "tikz-lake-fig.sty", 
                                    "tikz-lake-fig-doc.tex", "tikz-lake-fig-doc.pdf")))
  file.rename("tikz-lake-fig.zip", "tikz-lake-fig/tikz-lake-fig.zip")
  setwd("tikz-lake-fig")
}

# ---- submit ----
if ("--submit" %in% args) {
  print("hooray")
  # fields_submit <- fields_validate
  # submit <- httr::POST("https://www.ctan.org/submit/upload", 
  #                        body = fields_submit)
  # str(content(submit, "parsed"))
}
