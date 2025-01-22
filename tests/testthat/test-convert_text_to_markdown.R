test_that("minimal use", {
  expect_silent(convert_text_to_markdown("Hello"))
})


test_that("use of one-liner", {
  text <- c(
    "# Title",
    "",
    "!!! warning \"Admonition title\"",
    "",
    "    Admonition text",
    "",
    "Regular text"
  )

  created <- convert_text_to_markdown(text)

  expected <- c(
    "# Title",
    "",
    ":warning:|Admonition title",
          "---|----------------",
    ":warning:|Admonition text",
    "",
    "Regular text"
  )

  expect_equal(created, expected)

})

test_that("use of two-liner", {
  text <- c(
    "# Title",
    "",
    "!!! warning \"Admonition title\"",
    "",
    "    Admonition text line 1.",
    "    Admonition text line 2.",
    "",
    "Regular text.",
    "More regular text."
  )

  created <- convert_text_to_markdown(text)

  expected <- c(
    "# Title",
    "",
    ":warning:|Admonition title",
          "---|-----------------------",
    ":warning:|Admonition text line 1.",
    ":warning:|Admonition text line 2.",
    "",
    "Regular text.",
    "More regular text."
  )

  expect_equal(created, expected)
})

