\name{forgetFlowRepositoryCredentials}
\alias{forgetFlowRepositoryCredentials}

\title{
    Forgets credentials (email and password) to login to FlowRepository.
}

\description{
    This function removes (forgets) your credentials (email and password) 
    to access FlowRepository if they were set using the 
    \code{\link{setFlowRepositoryCredentials}} function. If you set your 
    credentials based on an external credentials file, this file will 
    not be affected, only credentials stored internally in your R 
    session will be removed.
}

\usage{
    forgetFlowRepositoryCredentials()
}

\details{
    The credentials are stored locally in an environment within the namespace
    in the FlowRepositoryR library. Your credentials will be forgotten when 
    you quit your R session.
}

\value{
    The return value is not expected to be useful. It is just the the 
    value of evaluting the credentials assignment expression, which is 
    typically an object of class \code{character} containing a copy of 
    the password that was just set.
}

\references{
    Spidlen Josef. FlowRepository Resources for Developers.\cr
    http://flowrepository.org/developers
}

\author{Josef Spidlen}

\examples{
    ## Let's set credentials
    setFlowRepositoryCredentials(
        email="boo@gmail.com", password="foo123456")
    ## Now do some work with FlowRepository...
    ## ...
    ## And now let's forget those credentials
    forgetFlowRepositoryCredentials()
}

\seealso{
    \code{\link{setFlowRepositoryCredentials}}
}

\keyword{methods}
