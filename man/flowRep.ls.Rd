\name{flowRep.ls}
\alias{flowRep.ls}

\title{
    List identifiers of datasets available in FlowRepository
}

\description{
    This function connects to FlowRepository (flowrepository.org) 
    via an XML-based API and retrieves a vector of identifiers of 
    available datasets.
}

\usage{
    flowRep.ls(include.private=FALSE)
}

\arguments{
    \item{include.private}{Whether to include private experiments 
        in the list. This only works if credentials to access 
        FlowRepository have been provided. By default, only 
        public experiments will be listed.
    }
}

\details{
    An HTTP GET request retrieves an XML from FlowRepository, and this XML 
    is parsed to extract the list of identifiers of public experiments.
}

\value{
    A vector of objects of class \code{character} containing strings 
    with FlowRepository dataset identifiers available.
}

\references{
    Spidlen Josef. FlowRepository Resources for Developers.\cr
    http://flowrepository.org/developers
}

\author{Josef Spidlen}

\seealso{
    \code{\link{flowRep.get}}, 
    \code{\link{setFlowRepositoryCredentials}}
}

\examples{
    flowRep.ls()
}

\keyword{methods}
