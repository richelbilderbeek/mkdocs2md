#' Convert the text of multiple MkDocs files into one
#' markdown file, adding pagebreaks in between
#' @param mkdocs_filenames path to one or more files that
#' contain MkDocs markdown
#' @param md_filename path to the file that will be created
#' and will have markdown
#' @return Nothing
#' @export
convert_files_to_markdown <- function(mkdocs_filenames, md_filename) {
  testthat::expect_true(length(mkdocs_filenames) > 0)
  if (length(mkdocs_filenames) == 1) {
    return(convert_file_to_markdown(mkdocs_filenames, md_filename))
  }
  texts <- list()
  for (i in seq(length(mkdocs_filenames))) {
    texts[[i]] <- convert_text_to_markdown(
      readr::read_lines(mkdocs_filenames[i])
    )
  }
  for (i in seq(2, length(mkdocs_filenames))) {
    texts[[i]] <- c("", "\\pagebreak", "", texts[[i]])
  }
  readr::write_lines(
    unlist(texts),
    file = md_filename
  )
}
