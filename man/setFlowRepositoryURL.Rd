\name{setFlowRepositoryURL}
\alias{setFlowRepositoryURL}

\title{
  Set FlowRepository URL addresss.
}

\description{
  This function sets the FlowRepository URL. Normally, the URL should be "https://flowrepository.org/".
  This function can be used if we want this library to communicate with a different instance
  of FlowRepository (e.g., some third party FlowRepository installation, or a testing installation used 
  by developers).
 }

\usage{
  setFlowRepositoryURL(url)
}

\arguments{
\item{url}{URL of the FlowRepository instance that the library should be communicating with.}
}

\details{
  FlowRepository URL is being stored with other settings in a global environment in the 
  library namespace. The \code{\link{getFlowRepositoryURL}} and setFlowRepositoryURL are
  being used to get and set the URL, respectively.
}

\references{
  Spidlen Josef. FlowRepository Resources for Developers.\cr
  http://flowrepository.org/developers
}

\author{Josef Spidlen}

\seealso{\code{\link{getFlowRepositoryURL}}}

\examples{
\dontrun{
  setFlowRepositoryURL("http://localhost")
}
}

\keyword{methods}
