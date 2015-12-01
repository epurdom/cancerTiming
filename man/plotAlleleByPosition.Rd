\name{plotAlleleByPosition}
\alias{plotAlleleByPosition}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Plot allele frequencies by position
}
\description{
Plot observed allele frequencies from sequencing data against their location on the chromosome.
}
\usage{
plotAlleleByPosition(mutData, segmentData = NULL, 
	whChr = 1:22, chromosomeId = "chr", 
	sampleName = NULL, sample = FALSE, tumorAFId, positionId, type = "mutation", 
	startId = "start", endId = "end", segFactorId, tCNId, MarkId, segColors, 
	normCont = NULL,  addData = NULL, addColor="red",col="black",pch=1,lwd=2,
	xlim,ylab="Allele Frequency",...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{mutData}{ data.frame with mutation data set to be plotted
%%     ~~Describe \code{mutData} here~~
}
  \item{segmentData}{ (optional) segmentation data
%%     ~~Describe \code{segmentData} here~~
}
  \item{whChr}{ which chromosome to plot
%%     ~~Describe \code{whChr} here~~
}
  \item{chromosomeId}{ column name for chromosome (must be same in all data.frames)
%%     ~~Describe \code{chromosomeId} here~~
}
  \item{sampleName}{id printed on the plot to identify the sample
%%     ~~Describe \code{sampleName} here~~
}
  \item{sample}{logical. If true, take only a random sample of 10,000 locations for the chromosome. Can speed up for plotting SNPs.
%%     ~~Describe \code{sample} here~~
}
  \item{tumorAFId}{ column name for the allele frequency in mutData
%%     ~~Describe \code{tumorAFId} here~~
}
  \item{positionId}{column name for the allele location in mutData
%%     ~~Describe \code{positionId} here~~
}
  \item{type}{type of allele frequency plotted (passed to `allAF' in order to create the lines for the expected AF)
%%     ~~Describe \code{type} here~~
}
  \item{startId}{column name for the start of the segmentation (in segData)
%%     ~~Describe \code{startId} here~~
}
  \item{endId}{column name for the end of the segmentation (in segData)
%%     ~~Describe \code{endId} here~~
}
  \item{segFactorId}{column name for the factor for segmentations (in segData). 
%%     ~~Describe \code{segFactorId} here~~
}
  \item{tCNId}{column name that gives the total copy number for the segmentation (in segData); needed if give normCont to calculated expected AF
%%     ~~Describe \code{tCNId} here~~
}
  \item{MarkId}{column name of a column with logical values that identifies segments that should be marked up with hash marks.
%%     ~~Describe \code{LOHId} here~~
}
  \item{segColors}{vector of colors for the segmentations. Should be as long as the number of levels of segFactorId
%%     ~~Describe \code{segColors} here~~
}
  \item{normCont}{percent normal contamination. If missing, then lines for the expected AF will not be calculated.
%%     ~~Describe \code{normCont} here~~
}
  \item{addData}{ data.frame with another set (example germline SNPs) to be plotted in red
%%     ~~Describe \code{germlineSNP} here~~
}
  \item{addColor}{ color for the additional data
%%     ~~Describe \code{germlineSNP} here~~
}
  \item{lwd}{line width of the lines for the expected AF
%%     ~~Describe \code{lwd} here~~
}
  \item{ylab}{label for y-axis
%%     ~~Describe \code{lwd} here~~
}
  \item{xlim}{xlim boundaries. If missing, will be calculated. 
%%     ~~Describe \code{xlim} here~~
}
  \item{col}{col for the mutData points
%%     ~~Describe \code{xlim} here~~
}
  \item{pch}{pch for the mutData points
%%     ~~Describe \code{xlim} here~~
}

  \item{\dots}{arguments passed to initial plotting command.
%%     ~~Describe \code{\dots} here~~
}
}
\value{
returns invisibly the vector of colors for the segmentations, useful for making legends (see the example)
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\author{
Elizabeth Purdom}

\examples{
data(mutData)
 #only mutations in the CNLOH region
onlyMuts<-subset(mutData,is.na(rsID) & position <= 1.8E7)
	snps<-subset(mutData,!is.na(rsID) )
segData<-data.frame(chromosome="17",start=c(0,1.8e7+1),
	end=c(1.8e7,max(mutData$position)),
	totalCpy=c(2,NA),markRegion=c(FALSE,TRUE))
out<-plotAlleleByPosition(onlyMuts,whChr=17, segmentData=segData,
	tCNId="totalCpy",normCont=0.22, addData=snps,pch=19,
	addColor="grey",MarkId="markRegion",
	segColors="pink",xaxt="n",xlab="Position", segFactorId="totalCpy",
	chromosomeId = "chromosome",tumorAFId="allelefreq", 
	positionId="position",type="mutation") 
axis(1,line=1,tick=FALSE)
legend("topright",legend=c(names(out),"unknown"),fill=c(out,NA),
	title="Total Copy Number")

}
