% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/convert_file_to_markdown.R
\name{convert_file_to_markdown}
\alias{convert_file_to_markdown}
\title{Convert a file with MkDocs extended markdown
to a markdown-only file}
\usage{
convert_file_to_markdown(mkdocs_filename, md_filename, keep_tags = TRUE)
}
\arguments{
\item{mkdocs_filename}{path to the file that has MkDocs}

\item{md_filename}{path to the file to be created}

\item{keep_tags}{\link{TRUE} if the tags need to be preserved,
\link{TRUE} if these need to be replaced by empty lines,}
}
\value{
Nothing
}
\description{
Convert a file with MkDocs extended markdown
to a markdown-only file
}
