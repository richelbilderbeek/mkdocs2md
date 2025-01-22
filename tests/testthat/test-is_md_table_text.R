test_that("minimal", {
  expect_false(is_md_table_text("nonsense"))
})

test_that("detect table", {

  text <- c(
    "Column1|Column2",
    "-------|-------",
    "Value1 |Value2"
  )
  expect_true(is_md_table_text(text))
})
