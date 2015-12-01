\name{hg19chromosomes}
 \docType{data}
 \alias{hg19chromosomes}
 \title{Definitions of the p,q, and centromeres of chromosomes}
 \description{
Gives the coordinates of the p,q, and centromeres of human chromosomes, based on hg19 }
 \usage{hg19chromosomes}
 \format{A data.frame containing 72 rows and 5 columns.
 \describe{
   \item{\code{chr}}{chromosome}
   \item{\code{start}}{start position}
   \item{\code{end}}{end position}
   \item{\code{label}}{one of ``p",``q", and ``centromere"}
   \item{\code{width}}{width of region}
	}
}
 \source{UCSC genome browser}
 \keyword{datasets}