test_that("use", {
  mkdocs_filename <- tempfile()
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
  readr::write_lines(text, mkdocs_filename)

  expect_false(file.exists(md_filename))
  convert_file_to_markdown(mkdocs_filename, md_filename)
  expect_true(file.exists(md_filename))

  expect_equal(
    readr::read_lines(md_filename),
    convert_text_to_markdown(text)
  )
})
