#' Convert a file with MkDocs extended markdown
#' to a markdown-only file
#' @param mkdocs_filename path to the file that has MkDocs
#' @param md_filename path to the file to be created
#' @param keep_tags \link{TRUE} if the tags need to be preserved,
#'   \link{TRUE} if these need to be replaced by empty lines,
#' @return Nothing
#' @examples
#' # Get an example MkDocs file
#' mkdocs_filename <- system.file("extdata", "example_1.md", package = "mkdocs2md")
#'
#' # Save it to a temporary file
#' md_filename <- tempfile()
#'
#' # Do the conversion
#' convert_file_to_markdown(mkdocs_filename, md_filename)
#' @export
convert_file_to_markdown <- function(
  mkdocs_filename,
  md_filename,
  keep_tags = TRUE
) {
  tryCatch(
    {
      text <- convert_text_to_markdown(
        readr::read_lines(mkdocs_filename),
        keep_tags = keep_tags
      )
    },
    error = function(msg) {
      stop(
        "Error: \nUnexpected MkDocs text in file '", mkdocs_filename, "'",
        ", with error message: \n", msg
      )
    }
  )
  readr::write_lines(
    text,
    md_filename
  )
}
