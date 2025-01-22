test_that("use", {

  text <- c(
    "!!! warning \"Admonition title\"",
    "",
    "    Admonition text"
  )

  created <- convert_admonition_to_table(text)

  expected <- c(
    ":warning:|Admonition title",
          "---|----------------",
    ":warning:|Admonition text"
  )

  expect_equal(created, expected)
})

test_that("use", {

  text <- c(
    "!!! warning \"Admonition title\"",
    "",
    "    Admonition text line 1",
    "    Admonition text line 2"
  )

  created <- convert_admonition_to_table(text)

  expected <- c(
    ":warning:|Admonition title",
          "---|----------------------",
    ":warning:|Admonition text line 1",
    ":warning:|Admonition text line 2"
  )

  expect_equal(created, expected)
})
