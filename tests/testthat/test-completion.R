test_that("code completion: method names are found", {
  polars_code_completion_activate(mode = "native", verbose = FALSE)
  utils:::.assignToken("pl$all()$a")
  utils:::.completeToken()
  expect_true("pl$all()$abs()" %in% utils:::.retrieveCompletions())
  polars_code_completion_deactivate()
})

test_that("code completion: check mode name", {
  expect_grepl_error(
    polars_code_completion_activate(mode = "foobar"),
    "should be one of"
  )
})
