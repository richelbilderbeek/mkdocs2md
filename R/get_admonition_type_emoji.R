#' Get the emoji corresponding to the admonition
#' @param admonition_type the type of admonition
#' @return an emoji, as text
#' @export
#' @examples
#' get_admonition_type_emoji("warning")
get_admonition_type_emoji <- function(admonition_type) {
  testthat::expect_equal(1, length(admonition_type))
  if (admonition_type == "info") {
    return(":information_source:")
  }
  return(paste0(":", admonition_type, ":"))
}
