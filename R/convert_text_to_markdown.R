#' Convert a text with MkDocs markdown extensions
#' to regular markdown
#' @param text a character vector
#' @return a text with regular markdown
#' @export
convert_text_to_markdown <- function(text) {

  admonition_starts <- stringr::str_which(text, pattern = "\\!\\!\\!")
  admonition_ends <- stringr::str_which(text, pattern = "^[^ ]")
  for (admonition_start in admonition_starts) {
    admonition_end <- admonition_ends[admonition_ends > admonition_start + 1][1] - 2
    admonition_text <- text[admonition_start:admonition_end]
    table_text <- convert_admonition_to_table(admonition_text)
    if (length(table_text) < length(admonition_text)) {
      # The admonition contained a table: converting this removes
      # the title
      table_text <- c("", "", table_text)
    }
    testthat::expect_equal(length(admonition_text), length(table_text))
    text[admonition_start:admonition_end] <- table_text
  }
  text
}
