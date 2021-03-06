% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/match_evaluate.R
\name{match_evaluate}
\alias{match_evaluate}
\title{match_evaluate}
\usage{
match_evaluate(matches, data1, data2, unique_key_1, unique_key_2,
  suffixes = c(".x", ".y"), tier = NULL, tier_order = NULL,
  aggregate_by = "unique", quality_vars = NULL, dupe_ratio = FALSE)
}
\arguments{
\item{matches}{data.frame. Merged dataset.}

\item{data1}{data.frame. First to-merge dataset.}

\item{data2}{data.frame. Second to-merge dataset.}

\item{unique_key_1}{character vector. Primary key of data1 that uniquely identifies each row (can be multiple fields)}

\item{unique_key_2}{character vector. Primary key of data2 that uniquely identifies each row (can be multiple fields)}

\item{suffixes}{character vector. Mnemonics associated data1 and data2.}

\item{tier}{character vector. Default=NULL. The variable that defines a tier.}

\item{tier_order}{character vector. Default=NULL. Variable that defines the order of tiers, if needed.}

\item{aggregate_by}{character vector. Default='unique'. Variable aggregated to calculate statistics. If equal to 'unique', aggregation is count, if otherwise, sum.}

\item{quality_vars}{character vector. Variables you want to use to calculate the quality of each tier. Calculates mean.}
}
\value{
data.frame. Table describing each tier according to aggregate_by variables and quality_vars variables.
}
\description{
evaluate a matched dataset
}
\examples{
x = data.frame('id'=1:5,'name'=c('a','b','c','d','d'), 'amount' = 101:105)
y = data.frame('id'=6:10,'name'=c('b','c','d','e','f'), 'amount' = rep(102,5))
matches = merge_plus(x,y,by='name',unique_key_1='id','unique_key_2'='id', matchscore_settings = list('amount'=list('compare_type'='difference',weight=1)), evaluate=NULL)$'matches'
match_evaluate(matches, x, y, 'id.x', 'id.y')  


}
\seealso{
merge_plus
}
