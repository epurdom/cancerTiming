\name{plotPi0}
\alias{plotPi0}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Confidence intervals for \eqn{\pi_0}{pi[0]}
}
\description{
A plotting function to plot the confidence intervals of the estimated \eqn{\pi_0}{pi[0]} values returned from eventTiming
}
\usage{
plotPi0(est, ui, li, samples, labels = NULL, xlab = "Segment", 
	ylab = expression(pi[0]), 
	pchFac = rep(1, length(est)), whHighlight = NULL, 
	nMut = NULL, xorder = NULL, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{est}{vector of the estimates of \eqn{\pi_0}{pi[0]}
}
  \item{ui}{
vector of the upper values for the confidence interval of the \eqn{\pi_0}{pi[0]}
}
  \item{li}{
vector of the lower values for the confidence interval of the \eqn{\pi_0}{pi[0]}
}
  \item{samples}{
vector indicating which sample each \eqn{\pi_0}{pi[0]} corresponds to (will be converted to factor with factor command)
}
  \item{labels}{
character vector of the labels of each estimate (optional)
}
  \item{xlab}{
label for the xaxis, defaults to ``Segment''
}
  \item{ylab}{
label for the yaxis, defaults to ``\eqn{\pi_0}{pi[0]}''
}
  \item{pchFac}{
vector of pch values for the center of the confidence interval
}
  \item{whHighlight}{
a vector of indices of the estimates that should be `highlighted' by coloring their confidence intervals red (optional)
}
  \item{nMut}{
a vector of values of the number of mutations from each confidence interval to be printed at the top of the plot
}
  \item{xorder}{
a vector giving an ordering of the estimates for the confidence intervals; if NULL, an order within each sample is created automatically. 
}
  \item{\dots}{
arguments passed to plotCI function
}
}
% \details{
% %%  ~~ If necessary, more details than the description above ~~
% }
\value{
The order of the estimates found internally by the program (or given by the user) are returned invisibly.
}
\author{
Elizabeth Purdom
}
\seealso{
plotCI, eventTiming
}
%%\examples{}
% % Add one or more standard keywords, see file 'KEYWORDS' in the
% % R documentation directory.
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
