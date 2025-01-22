#' Detects if a text is a markdown table
#' @param text a text, as character vector
is_md_table_text <- function(text) {
  if (length(text) < 3) return(FALSE)
  stringr::str_detect(text[2], "---[-|]*")
}
