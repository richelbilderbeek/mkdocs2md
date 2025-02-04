#' Convert a text with MkDocs markdown extensions
#' to regular markdown
#' @param text a character vector
#' @param keep_tags \link{TRUE} if the tags need to be preserved,
#'   \link{TRUE} if these need to be replaced by empty lines,
#' @return a text with regular markdown
#' @export
convert_text_to_markdown <- function(
  text,
  keep_tags = TRUE
) {
  testthat::expect_equal(1, length(keep_tags))
  testthat::expect_true(keep_tags %in% c(TRUE, FALSE))

  if (!keep_tags) {
    text <- convert_text_tags_to_markdown(text)
  }

  admonition_starts <- stringr::str_which(
    text,
    pattern = "(\\!\\!\\!)|(\\?\\?\\?)"
  )
  admonition_ends <- stringr::str_which(text, pattern = "^[^ ]")
  for (admonition_start in admonition_starts) {
    admonition_end <- admonition_ends[admonition_ends > admonition_start + 1][1] - 2
    if (is.na(admonition_end)) {
      admonition_end <- length(text)
    }
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

#' Convert a text with MkDocs markdown extensions
#' to regular markdown
#' @param text a character vector
#' @return a text with regular markdown
#' @export
convert_text_tags_to_markdown <- function(
  text
) {
  tags_indices <- stringr::str_which(
    text,
    pattern = "^---$"
  )
  testthat::expect_equal(0, length(tags_indices) %% 2)
  from_indices <- tags_indices[seq(1, length(tags_indices) - 1, 2)]
  to_indices   <- tags_indices[seq(2, length(tags_indices) - 0, 2)]
  testthat::expect_equal(length(from_indices), length(to_indices))
  for (i in seq_len(length(from_indices))) {
    from <- from_indices[i]
    to <- to_indices[i]
    text[from:to] <- ""
  }
  text
}
