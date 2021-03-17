TITLE = "C-MOOR CURE CCC FA21"
YAML_FILE = "index.yaml"
HTML_FILE = "index.html"
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
make_tutorial_link <- function(dir_name, base_url) {
  paste0("<a href=\"", get_tuturial_url(dir_name, base_url), "\" target=\"_blank\">",
         get_tutorial_metadata(dir_name), "</a>")
}

# build html for a single day
make_day <- function(day_info, base_url) {

  # Day (h2)
  date <- format(as.Date(day_info$due_date, "%m-%d-%Y"), "%B %d, %Y")
  day <- paste0("  <h2>", day_info$name, " -- Due ", date, "  </h2>\n")

  # Message
  if (!is.null(day_info$message)) {
    if (!(day_info$message=="")) {
      m <- paste0("    <p class=\"message\">", day_info$message, "</p>\n")
      day <- paste0(day, m)
    }
  }

  # Tutorials
  if (!is.null(day_info$tutorial_dir)) {
    ol <- lapply(day_info$tutorial_dir, make_tutorial_link, base_url)
    ol <- paste0("      <li>", ol, "</li>\n", collapse="")
    ol <- paste0("    <ol>\n", ol, "    </ol>\n\n")
    day <- paste0(day, ol)
  }
  day
}

#### BUILD HTML ####

# make header
  header <- c("<!DOCTYPE html>
<html>
<head>
  <title>",TITLE,"</title>
  <style type=\"text/css\">
  .message {
    padding-inline-start: 20px;
  }
  </style>
</head>\n\n")


#start body
body <- c("<body>\n\n")

# add title
title <- c("<h1>", TITLE, "</h1>\n\n")
body <- c(body, title)

# add assignments
tutorials <- lapply(y, make_day, BASE_URL)
tutorials <- paste0(tutorials)
body <- c(body, tutorials)


# make footer
footer <- "\n</body>

</html>"


# write to file
cat(header, body, footer, file=HTML_FILE, sep="")
