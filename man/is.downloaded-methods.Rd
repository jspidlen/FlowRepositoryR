\name{is.downloaded}
\alias{is.downloaded}
\alias{is.downloaded,fileProxy,is.downloaded-method}
\alias{is.downloaded,flowRepData,is.downloaded-method}

\title{Check if a dataset or a file proxy is downloaded}

\description{
    Return TRUE if the argument is (fully) downloaded to the local 
    file system, FALSE otherwise.
}

\usage{
    is.downloaded(object, \dots)
}

\arguments{
    \item{object}{Object of class \code{\linkS4class{fileProxy}} or 
        \code{\linkS4class{flowRepData}}.}
    \item{\dots}{Just a placeholder for now, no additional 
        attributes are used at this point.}
}

\details{
    This method checks whether the argument (either a 
    \code{\linkS4class{flowRepData}} object or 
    a \code{\linkS4class{fileProxy}} object) is downloaded. 
    If a dataset (\code{\linkS4class{flowRepData}} object)
    is passed as an argument, then all the files in that dataset 
    need to be downloaded in order for this method to return TRUE. 
    The method is based on the localpath attribute of the 
    \code{\linkS4class{fileProxy}} of the argument, or of all the 
    file proxies associated with a dataset 
    (if \code{\linkS4class{flowRepData}} object is used).
}

\value{
    TRUE if \code{object} is (fully) downloaded to a local file system, 
    FALSE otherwise. 'Fully' is only applicable to 
    \code{\linkS4class{flowRepData}} objects and it means that all 
    FCS data files and all attachments of the
    \code{\linkS4class{flowRepData}} object are downloaded.
}

\seealso{
    \code{\link{download}}
}

\author{Josef Spidlen}

\examples{
    myDataset <- flowRep.get("FR-FCM-ZZ3X")
    is.downloaded(myDataset)
    is.downloaded(fcs.files(myDataset)[[1]])
}

\keyword{methods}
