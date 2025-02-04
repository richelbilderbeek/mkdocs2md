test_that("use on three exclamation marks", {

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

test_that("use on three question marks and a plus", {

  text <- c(
    "???+ warning \"Admonition title\"",
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

test_that("use on three question marks and a minus", {

  text <- c(
    "???- warning \"Admonition title\"",
    "",
    "    Admonition text"
  )

  created <- convert_admonition_to_table(text)

  expected <- c(
    "",
    "",
    ""
  )

  expect_equal(created, expected)
})

test_that("use two-liner", {

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

test_that("use table", {

  text <- c(
    "!!! warning \"Admonition title\"",
    "",
    "    Column1|Column2",
    "    -------|-------",
    "    Value1 |Value2"
  )

  created <- convert_admonition_to_table(text)

  expected <- c(
    "Column1|Column2",
    "-------|-------",
    "Value1 |Value2"
  )
  expect_equal(created, expected)
})
