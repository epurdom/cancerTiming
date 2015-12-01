\name{alleleFrequency}
\alias{allAF}
\alias{contAF}
\alias{decontAF}
\alias{errorAF}

%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Get allele frequencies for tumor data
}
\description{
Calculate allele frequencies that would be possible for a variant found in a region with a given number of total copies of the tumor, adjusted for the given percentage of normal contamination. 
}
\usage{
allAF(totalCopy,normCont=0,totalCopyNormal=2,
	type=c("mutation","SNPHet","SNPHomo"))
contAF(trueAF, totalCopy, normCont = 0, totalCopyNormal = 2, 
	type = c("mutation", "SNPHet", "SNPHomo"))
decontAF(contAF, totalCopy, normCont = 0, totalCopyNormal = 2, 
	type = c("mutation", "SNPHet", "SNPHomo"))
errorAF(trueAF,seqError=0)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{totalCopy}{ total number of copies of DNA of the tumor, integer 
%%     ~~Describe \code{totalCopy} here~~
}
  \item{normCont}{ proportion of normal contamination (see Details)
%%     ~~Describe \code{normCont} here~~
}
  \item{totalCopyNormal}{ total number of copies of DNA in the normal sample
%%     ~~Describe \code{totalCopyNormal} here~~
}
  \item{type}{ type of allele frequency (see Details)
%%     ~~Describe \code{type} here~~
}
  \item{trueAF}{ vector of true AF values in tumor
%%     ~~Describe \code{type} here~~
}
  \item{contAF}{ vector of observed (contaminated by normal) allele frequency values
%%     ~~Describe \code{type} here~~
}
  \item{seqError}{
The probability of sequencing error per base
}
}
\details{
contAF takes as input a true allele frequency and then adjusted its based on the given normal contamination, to give the allele frequencies actually expected from the mixture of tumor and normal cells present. decontAF does the reverse, taking contaminated AF and calculating the true AF that is implied for the given normal contamination. 

errorAF gives the adjusted allele frequencies to account for sequencing error.

allAF returns all the possible allele frequencies for a variant, namely (0:totalCopy)/totalCopy. For type="mutation", only alleles from (1:totalCopy)/totalCopy are calculated, since the assumption is that mutated (relative to germline) regions by definition are not expected to be present at 0 copies in the tumor. For `allAF', `normCont' can be a vector, in which case all the allele frequencies are calculated for all the values of `normCont'; for the remaining functions, it must be a single value.

Only integer values of `totalCopy' are allowed. 


`type' refers to the type of variant, relative to the normal. Namely, how many copies of the variant are in the normal. Therefore `mutation' implies 0 copies in the normal, `SNPHet' implies 1 copy in the normal, and `SNPHomo' implies variant is in every copy of the normal (which could be not equal to 2 if totalCopyNormal is not 2).

For the functions seqError, contAF, and decontAF, `totalCopy', `normCont',`totalCopyNormal', and `seqError' can be vectors of the same length as the input.
}
\value{
For `allAF', a list of the same length of `normCont'. Each element of the list is a vector of the entire set of possible allele frequencies for the corresponding level of normal contamination. 

For `contAF', `decontAF', and `seqError' a vector the same length as the inputted allele frequencies that were to be converted.
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\author{
Elizabeth Purdom
}
\examples{
contAF(1/3,totalCopy=3,normCont=.1,type="mutation")
contAF(c(.5,.5,.5),totalCopy=c(2,4,6),normCont=.2)

#allele frequencies possible for a location that is same 
#as reference in the normal, for three different values of normal contamination
allAF(totalCopy=3,normCont=c(0,.1,.5),type="mutation") 
#same, but for those that are heterozygous in the normal
allAF(totalCopy=3,normCont=c(0,.1,.5),type="SNPHet") 
}
