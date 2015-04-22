\name{fileProxy-class}
\docType{class}
\alias{fileProxy-class}
\alias{fileProxy}
\alias{summary,fileProxy-method}
\alias{is.downloaded,fileProxy-method}
\alias{download,fileProxy-method}
\alias{localpath}
\alias{localpath,fileProxy-method}
\alias{localpath,fileProxy,localpath-method}

\title{'fileProxy': a class representing a proxy to a file in FlowRepository}

\description{This class represents basic metadata (i.e., information about) 
    a single file in FlowRepository.}

\section{Creating Objects}{
    The \code{fileProxy} class is used as a common parent for 
    \code{\linkS4class{fcsProxy}} and \code{\linkS4class{attachmentProxy}} 
    classes. Objects of the \code{fileProxy} class shall not be created 
    directly, unless you know exactly what you are doing.

    There is no constructor defined, but objects can be created using\cr
    \code{  new("fileProxy", }\cr
    \code{    name      = ....,  Object of class character}\cr
    \code{    url       = ....,  Object of class character}\cr  
    \code{    size      = ....,  Object of class numeric}\cr
    \code{    md5sum    = ....,  Object of class character or NULL}\cr
    \code{    localpath = ....,  Object of class character or NULL}\cr  
    \code{  )}\cr
}

\section{Slots}{
    \describe{

        \item{\code{name}:}{Object of class \code{character} containing the
            name of the FlowRepository file.
        }

        \item{\code{url}:}{Object of class \code{character} containing the
            url of the FlowRepository file.
        }

        \item{\code{size}:}{Object of class \code{numeric} containing the size
            of the FlowRepository file in bytes.
        }
    
        \item{\code{md5sum}:}{Object of class \code{character} or NULL 
            containing the MD5 sum of the FlowRepository file.
        }

        \item{\code{localpath}:}{Object of class \code{character} or NULL 
            containing the path the FlowRepository file as saved on the local 
            file system. This slot is used to determine whether the file has 
            been downloaded to the local file system. A value of NULL 
            indicates that the file has not been downloaded.
        }

    }
}

\section{Methods}{
    \describe{
        There are separate documentation pages for some of the methods
        listed here which may be consulted for more details.

        \item{summary}{Print a basic summary about a \code{fileProxy}. 
            See \code{\link{summary}} for details.
            \emph{Usage:}
            \code{summary(fileProxy)}
        }
    
        \item{download}{Download the referenced file to the local 
            file system, fill out the \code{localpath} slot and return an 
            updated copy of the \code{fileProxy} object.
            See \code{\link{download}} for details.
            \emph{Usage:}
            \code{download(fileProxy, dirpath=NULL, filepath=NULL, }\cr
            \code{    curlHandle=getCurlHandle(cookiefile=""), )}\cr
            \code{    show.progress=TRUE, ...)}\cr            
        }
    
        \item{is.downloaded}{Return TRUE if the \code{localpath} slot
            is not NULL, which indicates that the file has been downloaded
            to the local file system. Return FALSE if the \code{localpath} 
            is NULL.
            See \code{\link{is.downloaded}} for details.
            \emph{Usage:}
            \code{is.downloaded(fileProxy)}
        }
        
        \item{localpath}{Return and object of class \code{character} or NULL 
            containing the path the FlowRepository file as saved on the local 
            file system. This slot is used to determine whether the file has 
            been downloaded to the local file system. A value of NULL 
            indicates that the file has not been downloaded.
        }

    }
}

\details{
    Objects of class \code{fileProxy} are used to hold information about
    a FlowRepository file. This is a common parent class for 
    \code{\linkS4class{fcsProxy}} and \code{\linkS4class{attachmentProxy}} 
    classes, which hold information about an FCS file and about an 
    attachment, respectively.
    Direct instances of the \code{fileProxy} are not expected.
}

\author{Josef Spidlen}

\seealso{
    \code{\linkS4class{fcsProxy}}, \code{\linkS4class{attachmentProxy}}
}

\examples{
    ## Obtain dataset information from FlowRepository
    myDataset <- flowRep.get("FR-FCM-ZZZG")
    is(fcs.files(myDataset)[[1]], "fileProxy")
    ## It should be as fcsProxy is a fileProxy
    is(attachments(myDataset)[[1]], "fileProxy")
    ## It should be as attachmentProxy is a fileProxy
}

\keyword{classes}
