\name{plotAlleleDensity}
\alias{plotAlleleDensity}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Plot density/histogram of allele frequencies
}
\description{
Plot of densities/histograms of allele frequencies, useful for evaluating normal contamination estimate, total Copy number estimates, etc.
}
\usage{
plotAlleleDensity(af, depth, groupingId, totalCopy, groupCol=palette(),
	normCont = 0, type="mutation", minDepth = 40, 
	lineCols = c("grey", "tan4"), minMut = 40, 
	histogram = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{af}{
vector of allele frequencies
}
  \item{depth}{
coverage of the location
}
  \item{groupingId}{
grouping variable for allele frequencies (single density curve/histogram for each id)
%%     ~~Describe \code{ids} here~~
}
  \item{totalCopy}{
the total copy number for the allele frequencies plotted (must be the same)
%%     ~~Describe \code{totalCopy} here~~
}
  \item{groupCol}{
colors for the different groups (if histogram=FALSE)
%%     ~~Describe \code{totalCopy} here~~
}

  \item{type}{
type of allele frequency (mutation, SNPHet, SNPHomo), passed to allAF%%     ~~Describe \code{normCont} here~~
}  
\item{normCont}{
percentage of normal contamination. Can be vector of different values. 
%%     ~~Describe \code{normCont} here~~
}
  \item{minDepth}{
min required depth in order to include it in the density/histogram
%%     ~~Describe \code{minDepth} here~~
}
  \item{lineCols}{
colors of the vertical lines (each color is for different normal contamination)
%%     ~~Describe \code{lineCols} here~~
}
  \item{minMut}{
minimum number of mutations per group in order to plot the group
%%     ~~Describe \code{minMut} here~~
}
  \item{histogram}{ logical. should the plot be superimposed density curves (FALSE), or a single histogram per group (TRUE)?
%%     ~~Describe \code{histogram} here~~
}
}

\value{
Returns invisibly the data used (i.e. passed minimum cutoff criteria), separated by the groupingId given by the user
}
\author{
Elizabeth Purdom}

\examples{
data(mutData)
#only mutations in the CNLOH region
onlyMuts<-subset(mutData,is.na(rsID) & position <= 1.8E7) 
plotAlleleDensity(onlyMuts$allelefreq,onlyMuts$t_ref_count+onlyMuts$t_alt_count,
	totalCopy=2,normCont=c(0,0.22),minMut=0,minDepth=0,hist=TRUE)

gpId<-factor(is.na(mutData$rsID),levels=c("TRUE","FALSE"),labels=c("Mutations","SNPs"))
plotAlleleDensity(mutData$allelefreq,mutData$t_ref_count+mutData$t_alt_count,
	groupCol=c("black","red"),totalCopy=2,groupingId=gpId,minMut=0,minDepth=30,hist=FALSE)
legend("topleft",levels(gpId),fill=c("red","black"))
}
