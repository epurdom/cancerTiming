\name{plotCopies}
\alias{plotCopies}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ plot segmentation values against each other
%%  ~~function to do ... ~~
}
\description{
Plot different values per segment against each other (e.g. minor and major allele estimates).
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
plotCopies	(x, y, nX, nY, xleg, yleg, onlyPositive = TRUE,
	                 equalAxis = TRUE, integerLegend = TRUE, xlim, ylim, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
The values plotted for x coordinates (e.g. segmentation value for minor allele)
}
  \item{y}{
The values plotted for y coordinates (e.g. segmentation value for major allele)
}
  \item{nX}{
The grouping id for the x coordinate (e.g. assignment of number of copies)
}
  \item{nY}{
The grouping id for the y coordinate (e.g. assignment of number of copies)
}
  \item{xleg}{
title for the legend of the x values}
  \item{yleg}{
title for the legend of the y values}
\item{xlim}{limits for the x axis}
\item{ylim}{limits for the y axis}
\item{onlyPositive}{only plot values positive in x and y}
\item{equalAxis}{xlim and ylim are forced to be the same}
\item{integerLegend}{Only give integers}
  \item{\dots}{passed to the scatter plot command
%%     ~~Describe \code{\dots} here~~
}
}
\author{
Elizabeth Purdom}
\examples{
cp1<-c(0,0,0,1,1,1,1,2,2,2,3,3,3)
cp2<-c(0,1,2,1,2,2,3,2,2,4,3,6,8)
seg1<-jitter(c(0,0,0,1,1,1,1,2,2,2,3,3,3))
seg2<-jitter(c(0,1,2,1,2,2,3,2,2,4,3,6,8))
plotCopies(x=seg1,y=seg2,nX=cp1,nY=cp2)
}
