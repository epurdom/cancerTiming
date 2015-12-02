\name{mut2Seg}
\alias{mut2Seg}
\title{
Align mutations to segments
}
\description{
A function to match mutations into the segments that include them.
}
\usage{
mut2Seg(mutData, segData, verbose = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{mutData}{matrix or data.frame. Column names must include `chr' and `position'
%%     ~~Describe \code{mutData} here~~
}
  \item{segData}{matrix or data.frame. Column names must include `chr',`start',and `end' (in any order)
}
  \item{verbose}{logical. If TRUE gives information about the progress and possible problems (e.g. if different chromosome names in the two sets )
}
}
\details{
This function finds which segments in the segData file contain the mutations and returns a data.frame with the concatenation of the mutation information and the segments information. The function relies on findOverlaps in the GenomicRanges package in bioconductor. 

}
\value{Data frame with concatenated values.
}
\author{
Elizabeth Purdom
}

\seealso{
\code{\link[GenomicRanges:findOverlaps-methods]{findOverlaps}}
}
\examples{
if(require(GenomicRanges)){
	data(mutData)
	colnames(mutData)[1]<-c("chr")
	segs<-data.frame(chr=c(17,17),start=c(1,1.8e7+100),end=c(1.8e7,81195210),
		normCont=0.22,segId=c("CNLOH","Other"))
	##Trivial segmentation annotation for example
	mutId<-mut2Seg(mutData,segs)
	head(mutId)	
}

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
