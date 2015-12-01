\name{plotSeqCount}
\alias{plotSeqCount}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Basic function for plotting the ratio of tumor to normal coverage
}
\description{
Basic function for plotting the ratio of tumor to normal coverage, and calculating the average over segments. A simple tool for assessing copy number breaks.
}
\usage{
plotSeqCount(position, t_count, n_count, ylim=NULL, normFac=1, 
	segs, segColors = palette(), ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{position}{
vector of position of the base
}
  \item{t_count}{
vector of number of reads overlapping position in tumor
}
  \item{n_count}{
vector of number of reads overlapping position in normal}
\item{ylim}{
	set the limits of y axis. If NULL, default values found.
}
  \item{normFac}{
a normalizing factor to correct for
}
  \item{segs}{
factor as same length as position, identifying which segment a count is from
}
  \item{segColors}{
%%     ~~Describe \code{segColors} here~~
}
  \item{\dots}{
passed to plot
}
}
\author{
Elizabeth Purdom
}
% \examples{
% 
% }
