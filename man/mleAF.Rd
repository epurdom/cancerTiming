\name{mleAF}
\alias{mleAF}
\title{
Estimate the most likely allele frequency 
}
\description{
Estimate the number of copies a mutation is found in, based on which allele value maximizes the binomial likelihood after correcting for normal contamination and seqError.
}
\usage{
mleAF(x, m, totalCopy, maxCopy=totalCopy, seqError = 0, normCont = 0)
}
\arguments{
  \item{x}{ vector. the number of reads/fragments containing the variant
}
  \item{m}{ vector. the number of reads/fragments covering the location with the variant (the coverage)
}

  \item{totalCopy}{
The total number of copies (maternal and paternal combined), can be vector with length equal to length(x)
}
  \item{maxCopy}{
The maximum number of copies of either maternal or paternal alleles, can be vector with length equal to length(x)
}
  \item{seqError}{
The probability of sequencing error per base, can be vector with length equal to length(x)
}
  \item{normCont}{
Percentage of normal contamination, can be vector with length equal to length(x)
}

}
\details{
maxCopy and totalCopy are used to determine the possible allele frequencies in a pure tumor cell, given by 1:maxCopy/totalCopy. The default of maxCopy=totalCopy ensures that all theoretically possible alleles are considered given the lack of further information, but in general will not be correct. For example, if the region has allelic copy 2/3, then there are only three possible allele frequencies rather than five.
}
\value{
List with following values:
\item{perLocationProb}{matrix of dimension (number of locations) x (number of possible allele frequencies), with each row corresponding to a given location and each column giving the probability of observing the data for that location for each of the possible allele frequencies}
\item{assignments}{data.frame of dimension (number of locations) x 3, with columns ncopies=estimate of number of copies mutation is found in, based on which maximizes the likelihood, totalCopy=totalCopy given by user, AF=estimate of true allele frequency given by ncopies/totalCopy }
\item{alleleSet }{Only returned if the parameters totalCopy, maxCopy, seqError, and normCont are of length=1. A data.frame with rows equal to number of possible alleles and three columns, tumorAF=the allele frequency in the pure tumor, AF= the corresponding allele frequency after adjusting for normal contamination and sequencing error, frequency = number of locations with that allele frequency.}

%% ...
}
\references{
Greenman, C D et al. 2012. ``Estimation of rearrangement phylogeny for cancer genomes." Genome Research 22(2):346-361.
}
\author{
Elizabeth Purdom}

\examples{
	#example of CNLOH
	m<-c(24,41,40,15)
	x<-c(13,21,17,12)
	nc<-c(0.27,0.39,0.49,0.22)
	mleAF(x=x,m=m,totalCopy=2,maxCopy=2,normCont=nc)
	mleAF(x=x,m=m,totalCopy=c(2,3,2,3),maxCopy=2,normCont=nc)
	#note the difference in output if instead all data is from 
	#same sample (shares normal Contamination estimate)
	mleAF(x=x,m=m,totalCopy=2,maxCopy=2,normCont=nc[1])
}
