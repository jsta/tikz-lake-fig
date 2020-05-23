# https://ctan.org/help/submit?lang=en

library(httr)

# ---- create zip ----
setwd("../")
unlink("beamer-lake-fig/beamer-lake-fig.zip"); unlink("beamer-lake-fig.zip")
zip("beamer-lake-fig.zip", paste0("beamer-lake-fig/",
    c("README.md", "beamer-lake-fig.sty", 
                  "beamer-lake-fig-doc.tex", "beamer-lake-fig-doc.pdf")))
file.rename("beamer-lake-fig.zip", "beamer-lake-fig/beamer-lake-fig.zip")
setwd("beamer-lake-fig")

# ---- validate payload ----
fields_validate <- list(
  author = "Joseph Stachelek",
  pkg = "beamer-lake-fig",
  version = "1.0.0",
  email = "stachel2@msu.edu",
  uploader = "Joseph Stachelek",
  license = "lppl1.3c",
  summary = "A variety of customizable lake diagrams",
  repository = "https://github.com/jsta/beamer-lake-fig", 
  bugtracker = "https://github.com/jsta/beamer-lake-fig/issues",
  support = "https://github.com/jsta/beamer-lake-fig/issues",
  file = upload_file("beamer-lake-fig.zip"))
validate <- httr::POST("https://www.ctan.org/submit/validate", 
                       body = fields_validate)
str(content(validate, "parsed"))

# ---- submit ----
fields_submit <- fields_validate
submit <- httr::POST("https://www.ctan.org/submit/upload", 
                       body = fields_submit)
str(content(submit, "parsed"))
