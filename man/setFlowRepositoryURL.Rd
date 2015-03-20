\name{setFlowRepositoryURL}
\alias{setFlowRepositoryURL}

\title{
    Set FlowRepository URL addresss.
}

\description{
    This function sets the FlowRepository URL. Normally, the URL should be 
    \code{https://flowrepository.org/}. This function can be used if we 
    want this library to communicate with a different instance of 
    FlowRepository (e.g., some third party FlowRepository installation, 
    or a testing installation used by developers).
}

\usage{
    setFlowRepositoryURL(url)
}

\arguments{
    \item{url}{URL of the FlowRepository instance that the library 
        should be communicating with.}
}

\details{
    FlowRepository URL is being stored with other settings in a 
    global environment in the library namespace. 
    The \code{\link{getFlowRepositoryURL}} and setFlowRepositoryURL are
    being used to get and set the URL, respectively.
}

\value{
    The return value is not expected to be useful. It is just the the value 
    of evaluting the URL assignment expression, which is typically an object 
    of class \code{character} containing a copy of the URL that was set.
}

\references{
    Spidlen Josef. FlowRepository Resources for Developers.\cr
    http://flowrepository.org/developers
}

\author{Josef Spidlen}

\seealso{\code{\link{getFlowRepositoryURL}}}

\examples{
    ## Save current URL
    tmpURL <- getFlowRepositoryURL()
    
    ## Temporarily set the URL to localhost
    setFlowRepositoryURL("http://localhost")
    
    ## Check that it is set
    getFlowRepositoryURL()
    
    ## You would need to run your own local
    ## FlowRepository instance on that URL for this to make sense

    ## Communicate with your local FlowRepository instance
    
    ## Now set it back to the original URL
    setFlowRepositoryURL(tmpURL)
}

\keyword{methods}
