\name{mutData}
\alias{mutData}
\docType{data}
\title{
Example Mutation Data
}
\description{
Example mutation data}
\usage{data(mutData)}
\format{
  A data frame with 1007 observations on the following 10 variables.
  \describe{
    \item{\code{chromosome}}{chromosome}
    \item{\code{position}}{position}
    \item{\code{refbase}}{reference base at this location}
    \item{\code{mutbase}}{variant base at this location}
    \item{\code{rsID}}{dbSNP database number, NA if not in database.}
    \item{\code{t_ref_count}}{number of fragments in tumor with the reference base}
    \item{\code{t_alt_count}}{number of fragments in tumor with the variant base}
    \item{\code{allelefreq}}{observed allele frequency}
    \item{\code{n_ref_count}}{number of fragments in normal with the ref base}
    \item{\code{n_alt_count}}{number of fragments in normal with the variant base}
  }
}
\details{
Mutation data from chr17. The CNLOH region is from positions 0 to 1.8E7. The normal contamination estimate in the paper was given as 0.22.
}
\source{
Durinck, S, et al. (2011). ``Temporal Dissection of Tumorigenesis in Primary Cancers." Cancer Discovery, 1(2), 137-143.
}
\examples{
data(mutData)
head(mutData)
#only mutations in the CNLOH region
onlyMuts<-subset(mutData,is.na(rsID) & position <= 1.8E7) 
}
\keyword{datasets}
