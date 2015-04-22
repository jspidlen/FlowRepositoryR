\name{flowRep.search}
\alias{flowRep.search}

\title{
    Search FlowRepository for datasets matching the query and retrieve a
    vector of identifiers of matching datasets.
}

\description{
    This function connects to FlowRepository (flowrepository.org) 
    via an XML-based API and searches for datasets matching the query term.
    The search covers experiment names, repository identifiers, keywords,
    researcher first and last names, reagents and reagent manufactures,
    instruments and instrument manufactures, sample annotations and
    manuscript identifiers. A vector of identifiers of matching
    datasets is retrieved. NULL is returned if no matching datasets are found.
}

\usage{
    flowRep.search(query.string)
}

\arguments{
    \item{query.string}{The query term used to search FlowRepository
        datasets for.
    }
}

\details{
    An HTTP GET request is sent to FlowRepository to perform the search, 
    this retrieves an XML from FlowRepository, and this XML 
    is parsed to extract the list of identifiers of matching experiments.
}

\value{
    A vector of objects of class \code{character} containing strings 
    with FlowRepository dataset identifiers available. NULL if no matching
    datasets were found. 
}

\references{
    Spidlen Josef. FlowRepository Resources for Developers.\cr
    http://flowrepository.org/developers
}

\author{Josef Spidlen}

\seealso{
    \code{\link{flowRep.ls}}, 
    \code{\link{flowRep.get}}
}

\examples{
    flowRep.search("K562 BCR")
}

\keyword{methods}
