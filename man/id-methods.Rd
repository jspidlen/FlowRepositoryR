\name{id}
\alias{id}
\alias{id,flowRepData,id-method}

\title{Retrieve the identifier of flowRepData objects}

\description{
    This method retrieves the identifier of a \code{\linkS4class{flowRepData}}
    object. These identifiers are typically in the form of \code{FR-FCM-}xxxx 
    where xxxx represents 4 alphanumeric characters.
}

\usage{
    id(object)
}

\arguments{
    \item{object}{Object of class \code{\linkS4class{flowRepData}}.}
}

\section{Methods}{
    \describe{
        \item{object="flowRepData"}{Return identifier of a 
        \code{\linkS4class{flowRepData}} object.}
    }
}

\details{
    FlowRepository dataset (experiment) identifiers 12 character strings in 
    the form of \code{FR-FCM-}xxxx where xxxx represents 4 alphanumeric 
    characters. Bases on this identifier, a corresponding dataset can be
    obtained from \code{http://flowrepository.org/id/FR-FCM-}xxxx.
}

\value{
    Character vector representing the identifier to the FlowRepository dataset.
}

\author{Josef Spidlen}

\examples{
    ## Get dataset from FlowRepository
    mySmallDataset <- flowRep.get("FR-FCM-ZZ3X")
    id(mySmallDataset)
}

\keyword{methods}
