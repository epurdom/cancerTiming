\name{makeEventHistory}
\alias{makeEventHistory}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Create the event history matrix
}
\description{
Create the event history matrix needed for the event timing algorithm
}
\usage{
makeEventHistory(type = c("gain", "LOH"), copies = NULL, 
	totalCopy = sum(copies), onlyIdentifiable = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{type}{
%%     ~~Describe \code{type} here~~
}
  \item{copies}{
a vector of length 2, giving the number of copies of the maternal and paternal chromosomes
%%     ~~Describe \code{copies} here~~
}
  \item{totalCopy}{
an integer between 2 and 5. totalCopy must be the sum of the numbers given for the argument copies
%%     ~~Describe \code{totalCopy} here~~
}
  \item{onlyIdentifiable}{
logical. Only return event matrices corresponding to event histories with identifiable \eqn{\pi_0}{pi[0]}?
%%     ~~Describe \code{onlyIdentifiable} here~~
}
}
% \details{
% %%  ~~ If necessary, more details than the description above ~~
% }
\value{The A matrix relates allele frequencies to the event history. The vector \eqn{A \pi}{A pi} gives the probabilities of each allele frequency possible for the specified event.
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
Purdom, E, et al. (submitted). ``Timing Chromosomal Abnormalities within Cancer Samples.''
}
\author{
Elizabeth Purdom
}
\examples{
makeEventHistory(type="gain",totalCopy=8)
makeEventHistory(type="gain",copies=c(1,4),totalCopy=5,onlyIdentifiable=FALSE)
}
