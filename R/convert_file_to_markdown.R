#' Convert a file with MkDocs extended markdown
#' to a markdown-only file
#' @param mkdocs_filename path to the file that has MkDocs
#' @param md_filename path to the file to be created
#' @return Nothing
#' @export
convert_file_to_markdown <- function(mkdocs_filename, md_filename) {
  readr::write_lines(
    convert_text_to_markdown(readr::read_lines(mkdocs_filename)),
    md_filename
  )
}
