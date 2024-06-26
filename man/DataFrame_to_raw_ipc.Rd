% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/io_ipc.R
\name{DataFrame_to_raw_ipc}
\alias{DataFrame_to_raw_ipc}
\title{Write Arrow IPC data to a raw vector}
\usage{
DataFrame_to_raw_ipc(
  compression = c("uncompressed", "zstd", "lz4"),
  ...,
  future = FALSE
)
}
\arguments{
\item{compression}{\code{NULL} or a character of the compression method,
\code{"uncompressed"} or "lz4" or "zstd". \code{NULL} is equivalent to \code{"uncompressed"}.
Choose "zstd" for good compression performance. Choose "lz4"
for fast compression/decompression.}

\item{...}{Ignored.}

\item{future}{Setting this to \code{TRUE} will write Polars' internal data structures that
might not be available by other Arrow implementations.
This functionality is considered \strong{unstable}.
It may be changed at any point without it being considered a breaking change.}
}
\value{
A raw vector
}
\description{
Write Arrow IPC data to a raw vector
}
\examples{
df = pl$DataFrame(
  foo = 1:5,
  bar = 6:10,
  ham = letters[1:5]
)

raw_ipc = df$to_raw_ipc()

pl$read_ipc(raw_ipc)

if (require("arrow", quietly = TRUE)) {
  arrow::read_ipc_file(raw_ipc, as_data_frame = FALSE)
}
}
\seealso{
\itemize{
\item \code{\link[=DataFrame_write_ipc]{<DataFrame>$write_ipc()}}
}
}
