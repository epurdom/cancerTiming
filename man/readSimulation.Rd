\name{readSimulation}
\alias{readSimulation}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Simulate reads based on an event matrix
}
\description{
Simulate reads based on an event matrix
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
readSimulation(B, alleleSet, q, totalCopy, mutRate = NULL, seqError = 0, 
	fixedN = FALSE, normCont = 0, aveReadCoverage = 30, countDistribution = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{B}{
the number of simulated data sets to make
%%     ~~Describe \code{B} here~~
}
  \item{alleleSet}{
a vector of expected allele frequencies, without contamination or sequencing error accounted for
%%     ~~Describe \code{alleleSet} here~~
}
  \item{q}{
integer. the number of expected allele frequencies???
%%     ~~Describe \code{q} here~~
}
  \item{totalCopy}{
integer. The total number of copies in the final stage, i.e. at the end of the event
%%     ~~Describe \code{totalCopy} here~~
}
  \item{mutRate}{
a number between 0 and 1. The mutation rate, defined as the number of mutations observed divided by number of nucleotides sequenced or examined
%%     ~~Describe \code{mutRate} here~~
}
  \item{seqError}{
a number between 0 and 1 representing the sequencing error. The default value is 0, i.e. no sequencing error.
%%     ~~Describe \code{seqError} here~~
}
  \item{fixedN}{
logical. Should the number of mutations be fixed? By default set to FALSE. If set to TRUE, the expected number of mutations is used, i.e. mutRate*B
%%     ~~Describe \code{fixedN} here~~
}
  \item{normCont}{
a number between 0 and 1 describing the amount of normal contamination present in the sample. The default value is 0, i.e. no normal contamination.
%%     ~~Describe \code{normCont} here~~
}
  \item{aveReadCoverage}{
average read coverage of an allele. The default value is 30 reads per allele.
%%     ~~Describe \code{aveReadCoverage} here~~
}
  \item{countDistribution}{
optional. Provide an empirical distribution for read coverage. If given, the argument aveReadCoverage is ignored, and the mean of the empirical distribution is used. By default, set to NULL. 
%%     ~~Describe \code{countDistribution} here~~
}
}
\value{
Returns a data frame with simulated read counts under the normal contamination, sequencing error, allele frequency distribution, and read count distributions provided.
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}

\author{
Elizabeth Purdom}
\examples{
	#simulate from CNLOH event with pi[0]=.1
	Amat<-makeEventHistory(totalCopy=2,type="LOH")[[1]]
	piVal<-c(.1,.9)
	qvec<-prop.table(Amat\%*\%piVal)

	sims<-readSimulation(10, alleleSet=allAF(totalCopy=2)[[1]], q=qvec, 
	totalCopy=2, mutRate = 100, seqError = 0.1, fixedN = TRUE, 
	normCont = 0.1, aveReadCoverage = 30)
}
