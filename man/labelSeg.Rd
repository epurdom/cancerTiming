\name{labelSeg}
\alias{labelSeg}
\alias{numChromosome}
\alias{divideGenome}
\title{
Helper functions for plotting
}
\description{
Helper functions for plotting and working with chromosomes and segmentations
}
\usage{
labelSeg(chr, start, end, pctOv = 0.1)
numChromosome(chr)
divideGenome(size=10)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{chr}{chromosome
}
  \item{start}{
start position of segment
}
  \item{end}{
end position of segment
}
  \item{pctOv}{
required amount of percent overlap needed in order to report
}
\item{size}{Size, in MB, of the desired equally spaced divisions of the genome}
}
\details{
labelSeg creates labels `p', `q', and `pq' for segmentations based on the overlap of the segment with the p/q portions of the human chromosome (hg19). It uses the data stored in hg19chromosomes with the package (under the directory 'extdata', not as a dataset of the package). Uses the findOverlaps function of GenomicRanges.

numChromosome takes character valued chromosome labels (``1'',``2'',...,``X'',``Y'') and converts them into values 1:23. This is useful for sorting chromosome values, for example. 

divideGenome makes segments of the genome of size equal to 'size' times 1e6, i.e. size-MB length intervals, also based on the hg19chromosomes data described above.
}
\value{
vector of numerical values between 1:23
}
\author{
Elizabeth Purdom}
\seealso{
\code{\link{hg19chromosomes}},\code{\link[IRanges:IntervalTree-class]{findOverlaps}}
}
\examples{
data(mutData)
segData<-data.frame(chromosome="17",start=c(0,1.8e7+1),
    end=c(1.8e7,max(mutData$position)),totalCpy=c(2,NA),
    markRegion=c(FALSE,TRUE))
if(require(GenomicRanges)) labelSeg(chr=segData$chromosome,
    start=segData$start,end=segData$end)
chr<-c("1","4","10","23","X")
chr[order(chr)]
chr[order(numChromosome(chr))]
}
