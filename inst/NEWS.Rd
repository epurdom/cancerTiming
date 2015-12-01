%%\newcommand{\PR}{\Sexpr[results=rd]{tools:::Rd_expr_PR(#1)}}
%%\newcommand{\Rlogo}{\if{html}{\figure{../../html/logo.jpg}}\if{latex}{\figure{logo.jpg}{options: width=0.5in}}}
\newcommand{\CRANpkg}{\href{http://CRAN.R-project.org/package=#1}{\pkg{#1}}}
\newcommand{\ct}{\CRANpkg{cancerTiming}}
\name{cancerTiming}
\title{News for package 'cancerTiming'}
\encoding{UTF-8}
% template vim:5Y
%
%\section{CHANGES IN \ct{} VERSION X.Y-Z (XXXX-YY-ZZ)}{
% \itemize{ \item \code{} }
%}
%
\section{CHANGES IN \ct{} VERSION 2.1.2 (2014-09-16)}{
	\itemize{
		\item Fixed E-step of EM algorithm (in internal function \code{.estimateQ}) to provide numerical stability for calculating probability of true allele frequency given the observed counts. Previously the function could give NaN probabilities due to the dividing of the sum of probabilities which might be small, and therefore cause the timing to crash.
		\item Added \code{plotPi0} to create plots of confidence intervals of estimates of pi0
	}
}
\section{CHANGES IN \ct{} VERSION 2.1.1 (2014-05-14)}{
	\itemize{
		\item Added functions \code{eventTimingOverList} and \code{getPi0Summary} to aid in applying \code{eventTiming} over many segmented regions at one time.
		\item In the EM algorithm, the common event histories of (0,2) and (1,2) are given an algebraic solution in the M-Step to avoid calling the optim function, which should speed calculations. Identification is by matching of the history matrix.
	}
}
\section{CHANGES IN \ct{} VERSION 2.1.0 (2014-05-14)}{
	\itemize{
		\item Added argument \code{mutationId} for individual mutations in \code{eventTiming}, which allows for tracking of assignments of mutations
		\item Made argument \code{returnAssignments} and \code{returnData} for function \code{eventTiming} a single option of  \code{returnAssignments} and the assignments are returned in one data.frame object that has the original data (\code{x} and \code{m}) in addition to the probabilities assigned to them. 
		\item \code{GenomicRanges} is no longer a package listed as 'Depends' but merely 'Suggests'. It is only used for a tiny helper function (\code{labelSeg}) useful for labeling segments as to the arm of the chromosome, e.g. '3q' or '17p'. Requiring GenomicRanges was a large installation overhead for such a minor function since the package is part of bioconductor.
	}
}
%
%
