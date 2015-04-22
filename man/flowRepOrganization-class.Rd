\name{flowRepOrganization-class}
\docType{class}
\alias{flowRepOrganization-class}
\alias{flowRepOrganization}
\alias{summary,flowRepOrganization-method}

\title{'flowRepOrganization': a class for storing details about 
    an organization associated with a FlowRepository dataset}

\description{This class represents the name and address of 
    an organization associated with a dataset stored in FlowRepository.}

\section{Creating Objects}{

    Objects can be created using\cr
    \code{  new("flowRepOrganization", }\cr
    \code{      name    = ....,  Object of class character}\cr
    \code{      street  = ....,  Object of class character or NULL}\cr
    \code{      city    = ....,  Object of class character or NULL}\cr
    \code{      zip     = ....,  Object of class character or NULL}\cr
    \code{      state   = ....,  Object of class character or NULL}\cr
    \code{      country = ....,  Object of class character or NULL}\cr
    \code{  )}\cr

    or the constructor \code{flowRepOrganization}, with mandatory argument
    \code{name} and optional arguments \code{street}, \code{city},
    \code{zip}, \code{state} and \code{country}.

    \code{flowRepOrganization(name, street=NULL, city=NULL, }\cr
    \code{    zip=NULL, state=NULL, country=NULL)}\cr
}

\section{Slots}{
    \describe{
    
        \item{\code{name}:}{Object of class \code{character} containing the
            name of the organization.
        }

        \item{\code{street}:}{Object of class \code{character} or NULL 
            containing the street of the address of the organization.
        }

        \item{\code{city}:}{Object of class \code{character} or NULL 
            containing the city of the address of the organization.
        }
    
        \item{\code{zip}:}{Object of class \code{character} or NULL 
            containing the zip (or postal code) of the address of the 
            organization.
        }
    
        \item{\code{state}:}{Object of class \code{character} or NULL 
            containing the state (or province) of the address of the 
            organization.
        }
    
        \item{\code{country}:}{Object of class \code{character} or NULL 
            containing the country of the address of the organization.
        }

    }
}

\section{Methods}{
    \describe{
        There are separate documentation pages for some of the methods
        listed here which may be consulted for more details.

        \item{summary}{Print the name and address of the organization.
            See \code{\link{summary}} for details.
            \emph{Usage:}
            \code{summary(flowRepOrganization)}
        }
    }
}

\details{
    Objects of class \code{flowRepOrganization} can be used to hold 
    information about an organization that is associated with a 
    FlowRepository dataset. A list of these objects will typically 
    be placed in the \code{organizations} slot of a
    \code{\linkS4class{flowRepData}} object when this is obtained using the 
    \code{\link{flowRep.get}} function (assuming there are any organizations 
    associated with that dataset).
}

\author{Josef Spidlen}

\seealso{
    \code{\link{flowRep.get}}
}

\examples{
    myDataset <- flowRep.get("FR-FCM-ZZ47")
    summary(organizations(myDataset)[[1]])
}

\keyword{classes}
