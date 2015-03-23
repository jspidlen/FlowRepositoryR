\name{setFlowRepositoryCredentials}
\alias{setFlowRepositoryCredentials}

\title{
    Set credentials (email and password) to login to FlowRepository.
}

\description{
    This function sets your credentials (email and password) to access
    FlowRepository. These credentials will than be used to access private 
    datasets that you have access to (i.e., that are either yours or that 
    have been shared with you). The email must correspond to the email 
    that you are using to login to FlowRepository, and the password must 
    correspond to the password that is set for FlowRepository API access 
    in your FlowRepository profile. Click on your name when logged-in
    to FlowRepository in your web browser in order to setup your API 
    password.\cr
    This function can set your credetials based on credentials stored in 
    a file (2 lines, email address in the first line, password in the
    second line), or you can provide email and/or password as arguments 
    of this function, or the function will ask for credentials if called
    without arguments in an interactive mode.
}

\usage{
    setFlowRepositoryCredentials(filename=NULL, email=NULL, password=NULL)
}

\arguments{

    \item{filename}{The file with credentials. 
        If specified, this argument will take precedence over the email 
        and password arguments (so do not use it together with the 
        email and password arguments). The file is expected to be 
        a text file with 2 lines. The first line is expected to 
        contain the email, the second line the password.}
        
    \item{email}{An email address as registered with FlowRepository. 
        Use only if you are not providing a filename. If neither 
        filename, nor email are provided, then the function
        will ask for email as long as it is executed in an interactive mode.}
        
    \item{password}{A password as registered for API access with 
        FlowRepository. Use only if you are not providing a filename. 
        If neither filename, nor password are provided, then 
        the function will ask for a password as long as it is executed 
        in an interactive mode.}
}

\details{
    The credentials are stored locally in an environment within the namespace
    in the FlowRepositoryR library. Your credentials will be forgotten when 
    you quit your R session, or when you call the 
    \code{\link{forgetFlowRepositoryCredentials}} function.
}

\value{
    The return value is not expected to be useful.
    An empty string (an object of class \code{character} with 0 characters).  
}

\references{
    Spidlen Josef. FlowRepository Resources for Developers.\cr
    http://flowrepository.org/developers
}

\author{Josef Spidlen}

\examples{
    ## Let's set credentials
    setFlowRepositoryCredentials(email="boo@gmail.com", password="foo123456")
    ## Now do some work with FlowRepository...
    ## ...
    ## And now let's forget those credentials
    forgetFlowRepositoryCredentials()
}

\seealso{\code{\link{forgetFlowRepositoryCredentials}}}

\keyword{methods}
