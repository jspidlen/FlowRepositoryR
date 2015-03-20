\name{flowRep.get}
\alias{flowRep.get}

\title{
    Retrieve information about a specified FlowRepository dataset.
}

\description{
    This function connects to FlowRepository (flowrepository.org) via 
    an XML-based API and retrieves metadata about a specified dataset 
    in the form of a \code{\linkS4class{flowRepData}} object.
}

\usage{
    flowRep.get(id, use.credentials=TRUE)
}

\arguments{

    \item{id}{An identifier of a FlowRepository dataset. List of available 
        datasets can be obtained by calling the 
        \code{\link{flowRep.ls}} function.}
    \item{use.credentials}{Whether to use your credentials 
        (email and password) to access FlowRepository. 
        Your credentials can only be used if previously set by 
        calling the \code{\link{setFlowRepositoryCredentials}},
        function. Otherwise, this parameter will be ignored. 
        Using credentials will allow you to access private
        datasets that are either yours or that have been shared 
        with you. Without credentials, you will have access
        to public datasets only. If you are accessing a public 
        dataset and you have stored your credentials, then
        setting \code{use.credentials=FALSE} will skip 
        authentication (login/logout) and therefore perform a
        little bit faster.}
}

\details{
    An HTTP GET request retrieves an XML from FlowRepository, 
    and this XML is parsed to extract metadata about the 
    specified experiment (i.e., dataset).
}

\value{
    A \code{\linkS4class{flowRepData}} object as long as referenced 
    dataset is found in FlowRepository and the user has access to it. 
    An error is thrown otherwise.
}


\references{
    Spidlen Josef. FlowRepository Resources for Developers.\cr
    http://flowrepository.org/developers
}

\author{Josef Spidlen}

\seealso{
    \code{\link{flowRep.ls}}, 
    \code{\link{setFlowRepositoryCredentials}},
    \code{\link{download}}
}

\examples{
    myDataset <- flowRep.get("FR-FCM-ZZ46")
}

\keyword{methods}
