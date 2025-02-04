#' Convert the text of an admonition to
#' a regular markdown table
#' @param text a character vector
#' @return a text with regular markdown
#' @export
convert_admonition_to_table <- function(text) {
  testthat::expect_true(length(text) >= 3)
  testthat::expect_true(is.character(text))

  # Heading
  heading <- text[1]


  admonition_visibility <- stringr::str_split(heading, pattern = " ")[[1]][1]
  testthat::expect_true(
    admonition_visibility %in% c("!!!", "???", "???-", "???+")
  )

  if (admonition_visibility == "???-") {
    return(rep("", length(text)))
  }

  admonition_type <- stringr::str_split(heading, pattern = " ")[[1]][2]
  adminition_title <- stringr::str_sub(
    stringr::str_flatten(
      stringr::str_split(heading, pattern = " ")[[1]][c(-1, -2)],
      collapse = " "
    ),
    start = 2,
    end = -2
  )

  # Empty line
  testthat::expect_equal(text[2], "")

  # Admonition text
  admonition_text <- stringr::str_sub(text[c(-1, -2)], start = 5)

  if (is_md_table_text(admonition_text)) {
    return(admonition_text)
  }

  emoji <- get_admonition_type_emoji(admonition_type)

  n_chars_longest_line <- max(
    stringr::str_length(admonition_text),
    stringr::str_length(adminition_title)
  )

  c(
    paste0(emoji, "|", adminition_title),
    paste0("---|", stringr::str_flatten(rep("-", n_chars_longest_line))),
    paste0(paste0(emoji, "|"), admonition_text)
  )
}
