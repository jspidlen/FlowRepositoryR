\name{getFlowRepositoryURL}
\alias{getFlowRepositoryURL}

\title{
    Get FlowRepository URL addresss.
}

\description{
    This function returns the FlowRepository URL. Unless the URL has 
    been changed by the \code{\link{setFlowRepositoryURL}}, this 
    function will return "https://flowrepository.org/".
}

\usage{
    getFlowRepositoryURL()
}

\details{
    FlowRepository URL is being stored with other settings in a 
    global environment in the library namespace. The 
    \code{getFlowRepositoryURL} and \code{\link{setFlowRepositoryURL}} are
    being used to get and set the URL, respectively.
}

\value{
    An object of class \code{character} containing the FlowRepository URL.
}

\references{
    Spidlen Josef. FlowRepository Resources for Developers.\cr
    http://flowrepository.org/developers
}

\author{Josef Spidlen}

\seealso{
    \code{\link{setFlowRepositoryURL}}
}

\examples{
    getFlowRepositoryURL()
}

\keyword{methods}
