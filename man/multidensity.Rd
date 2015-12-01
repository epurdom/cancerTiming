\name{multidensity}
\alias{multidensity}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
plot multiple density functions on top of each other
%%  ~~function to do ... ~~
}
\description{
plots multiple density functions on top of each other, calculating the correct xlim, ylim, etc.
}
\usage{
multidensity(x, col = palette(), lwd = 1, lty = 1, xlim, ylab = "Density", ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{ list of values to create density from (can be a data.frame which where columns are elements of the list)
%%     ~~Describe \code{x} here~~
}
  \item{col}{ colors for each density plot
%%     ~~Describe \code{col} here~~
}
  \item{lwd}{lwd for each density plot
%%     ~~Describe \code{lwd} here~~
}
  \item{lty}{lty for each density plot
%%     ~~Describe \code{lty} here~~
}
  \item{xlim}{user defined xlim
%%     ~~Describe \code{xlim} here~~
}
  \item{ylab}{user defined ylab
%%     ~~Describe \code{ylab} here~~
}
  \item{\dots}{plotting parameters passed to initial plot command.
%%     ~~Describe \code{\dots} here~~
}
}
\author{
Elizabeth Purdom
}

\examples{
x<-lapply(c(1,2,3),function(x){rnorm(100,mean=x)})
multidensity(x)
}

