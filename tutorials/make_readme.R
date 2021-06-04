TITLE = "C-MOOR CURE CCC FA21"
YAML_FILE = "index.yaml"
MD_FILE = "README.md"
BASE_URL = "./"

# read yaml
y <- yaml::yaml.load_file(YAML_FILE)


#### HELPER FUNCTIONS ####

# extract tutorial metadata
get_tutorial_metadata <- function(dir_name) {
  f <- file.path(dir_name, paste0(dir_name, ".Rmd"))
  title <- grep("^title", readLines(f), value=TRUE)[1]
  title <- strsplit(title, split="\"")[[1]][2]
}

# get url for tutorial
get_tuturial_url <- function(dir_name, base_url) {
  paste0(base_url, dir_name, "/")
}

# build tutorial link tag
make_tutorial_link_md <- function(dir_name, base_url) {
  paste0(
    "[", get_tutorial_metadata(dir_name), "]",
    "(", get_tuturial_url(dir_name, base_url), ")"
  )
}

# build html for a single day
make_day_md <- function(day_info, base_url) {

  # Day (h2)
  date <- format(as.Date(day_info$due_date, "%m-%d-%Y"), "%B %d, %Y")
  day <- paste0("## ", day_info$name, " -- Due ", date, "\n\n")
  
  # Message
  if (!is.null(day_info$message)) {
    if (!(day_info$message=="")) {
      m <- paste0(day_info$message, "\n\n")
      day <- paste0(day, m)
    }
  }

  # Tutorials
  if (!is.null(day_info$tutorial_dir)) {
    ol <- lapply(day_info$tutorial_dir, make_tutorial_link_md, base_url)
    ol <- paste0("- ", ol, "\n", collapse="")
    day <- paste0(day, ol, "\n")
  }
  day
}

#### BUILD MARKDOWN ####

# add title
title <- c("# ", TITLE, "\n\n")

# add assignments
tutorials <- lapply(y, make_day_md, BASE_URL)
tutorials <- paste0(tutorials)

# write to file
cat(title, tutorials, file=MD_FILE, sep="")
