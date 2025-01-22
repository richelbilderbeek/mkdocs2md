test_that("use", {
  mkdocs_filename_1 <- tempfile()
  mkdocs_filename_2 <- tempfile()
  mkdocs_filenames <- c(mkdocs_filename_1, mkdocs_filename_2)
  md_filename <- tempfile()

  text <- c(
    "# Title",
    "",
    "!!! warning \"Admonition title\"",
    "",
    "    Admonition text",
    "",
    "Regular text"
  )
  readr::write_lines(text, mkdocs_filename_1)
  readr::write_lines(text, mkdocs_filename_2)

  expect_false(file.exists(md_filename))
  convert_files_to_markdown(mkdocs_filenames, md_filename)
  expect_true(file.exists(md_filename))

  expect_equal(
    readr::read_lines(md_filename),
    c(
      convert_text_to_markdown(text),
      "",
      "\\pagebreak",
      "",
      convert_text_to_markdown(text)
    )
  )
})


