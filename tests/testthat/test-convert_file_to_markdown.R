test_that("minimal use", {
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

test_that("convert an example file", {
  mkdocs_filename <- system.file("extdata", "example_1.md", package = "mkdocs2md")
  md_filename <- tempfile()
  convert_file_to_markdown(mkdocs_filename, md_filename)
  expect_true(file.exists(md_filename))
})

test_that("clear error message", {
  mkdocs_filename <- system.file("extdata", "example_1_error.md", package = "mkdocs2md")
  md_filename <- tempfile()
  expect_error(
    convert_file_to_markdown(mkdocs_filename, md_filename),
    "example_1_error"
  )
})
