\name{plotSegmentation}
\alias{plotSegmentation}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{plot segmentation(s) against positions
%%  ~~function to do ... ~~
}
\description{
Plot the values of a segmentation against chromosome position. 
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
plotSegmentation(segs, valId, col = palette(),lty=1, lwd = 2, xlim, ylim,
	xlab="Position", ylab = valId,...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{segs}{
list of segmentation data.frames. Each data.frame must have `start' and `end' as the column names of the limits of the segmentations.
}
  \item{valId}{
name of the column with the segmentation value to be plotted (must be the same in all data.frames)
%%     ~~Describe \code{valId} here~~
}
  \item{col}{
colors for the segmentation (1 per element of the list of segmentations)
%%     ~~Describe \code{col} here~~
}
\item{lty}{lty for the lines}
  \item{lwd}{
lwd for the lines
%%     ~~Describe \code{lwd} here~~
}
  \item{xlim}{x limits
%%     ~~Describe \code{xlim} here~~
}
  \item{ylim}{y limits
%%     ~~Describe \code{ylim} here~~
}
\item{xlab}{The label for the x-axis}
\item{ylab}{The label for the y-axis}
  \item{\dots}{ passed to initial plotting command}
}
\value{
returns invisibly the col and lty after any processing done, useful for legends.
}
\author{
Elizabeth Purdom}
\examples{
data(mutData)
segData<-data.frame(chromosome="17",start=c(0,1.8e7+1),
	end=c(1.8e7,max(mutData$position)),val=c(2,3))
cp1<-data.frame(chromosome="17",start=c(0,1.8e7+1),
	end=c(1.8e7,max(mutData$position)),val=c(1,1))
cp2<-data.frame(chromosome="17",start=c(0,1.8e7+1),
	end=c(1.8e7,max(mutData$position)),val=c(.9,2))
out<-plotSegmentation(list(total=segData,cp1=cp1,cp2=cp2),
	valId="val",lwd=2,ylab="Segmentation Value")
legend("topright",names(out),fill=out)
}
