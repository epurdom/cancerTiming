\name{bootstrapEventTiming}
\alias{bootstrapEventTiming}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Bootstrap the results of eventTiming
}
\description{
Create bootstrap estimates of pi base on the results of a call to eventTiming.
}
\usage{
 bootstrapEventTiming(eventOrdering, B, type = c("parametric",
                 "nonparametric"), pi, x, m ,call)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
	\item{eventOrdering}{output from eventTiming}
  \item{B}{ number of bootstrap samples to take
}
  \item{type}{type of bootstrap confidence interval to calculate, one of ``parametric", ``nonparametric"
}
  \item{pi}{
the estimate of $pi$ from which to create bootstrap samples (if type="parametric". If not given, will use output from eventOrdering)
}
  \item{x}{ vector. the number of reads/fragments containing the variant; not needed if output from eventOrdering given.
}
  \item{m}{ vector. the number of reads/fragments covering the location with the variant (the coverage); not needed if output from eventOrdering given.
}
	\item{call}{information about the call given to original eventTiming command. Only needed if eventOrdering object not given (mainly used for internal calls within eventTiming function)}
}
\value{
Matrix of dimension (B,length(pi)) with the estimate of pi for each of the bootstrap samples
}
\author{
Elizabeth Purdom}
\examples{
##can do this within eventTiming function, but here is an example doing it separately...
data(mutData)
ACNLOH<-matrix(c(1,3,1,0),ncol=2,nrow=2,byrow=TRUE)
onlyMuts<-subset(mutData,is.na(rsID) & position <= 1.8E7)
onlyMuts$t_depth<-onlyMuts$t_ref_count+onlyMuts$t_alt_count
x<-eventTiming(x=onlyMuts$t_alt_count,m=onlyMuts$t_depth,
    history=ACNLOH,totalCopy=2,type="CNLOH",normCont=0.22,returnAssignments=TRUE)
piBoot<-bootstrapEventTiming(x,B=100,type="parametric")
}
