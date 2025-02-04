test_that("minimal use", {
  expect_equal(get_admonition_type_emoji("warning"), ":warning:")
  expect_equal(get_admonition_type_emoji("info"), ":information_source:")
  expect_equal(get_admonition_type_emoji("question"), ":question:")
})
