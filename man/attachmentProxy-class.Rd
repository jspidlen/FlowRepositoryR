\name{attachmentProxy-class}
\docType{class}
\alias{attachmentProxy-class}
\alias{attachmentProxy}
\alias{summary,attachmentProxy-method}
\alias{is.downloaded,attachmentProxy-method}
\alias{download,attachmentProxy-method}

\title{'attachmentProxy': a class representing a proxy to an attachment file 
    in FlowRepository}

\description{This class represents basic metadata (i.e., information about) 
    a single attachment file in FlowRepository.}

\section{Creating Objects}{

    Objects of the \code{attachmentProxy} class are created automatically when
    you create a \code{flowRepData} object from FlowRepository by calling
    the \code{\link{flowRep.get}}. A list of \code{attachmentProxy} objects will
    be placed in the \code{attachments} slot of the \code{flowRepData} object.

    Unless you know what you are doing, creating objects using
    \code{new} or the constructor (as described below) is discouraged.

    Objects can be created using\cr
    \code{  new("attachmentProxy", }\cr
    \code{    name        = ....,  Object of class character}\cr
    \code{    url         = ....,  Object of class character}\cr  
    \code{    size        = ....,  Object of class numeric}\cr
    \code{    md5sum      = ....,  Object of class character or NULL}\cr
    \code{    description = ....,  Object of class character or NULL}\cr
    \code{    localpath   = ....,  Object of class character or NULL}\cr  
    \code{  )}\cr

    or the constructor \code{attachmentProxy}, with mandatory arguments
    \code{name} and \code{url} and optional arguments \code{size}, 
    \code{md5sum}, \code{description} and \code{localpath}.

    \code{attachmentProxy(name, url, size=0, md5sum=NULL,}\cr
    \code{  description=NULL, localpath=NULL)}\cr

}

\section{Slots}{
    \describe{
        \item{\code{name}:}{Object of class \code{character} containing the
            name of the FlowRepository attachment file.
        }
    
        \item{\code{url}:}{Object of class \code{character} containing the
            url of the FlowRepository attachment file.
        }

        \item{\code{size}:}{Object of class \code{numeric} containing the size
            of the FlowRepository attachment file in bytes.
        }
    
        \item{\code{md5sum}:}{Object of class \code{character} or NULL 
            containing the MD5 sum of the FlowRepository attachment file.
        }
    
        \item{\code{description}:}{Object of class \code{character} or NULL 
            containing the description of the FlowRepository attachment file.
        }

        \item{\code{localpath}:}{Object of class \code{character} or NULL 
            containing the path the FlowRepository attachment file as saved 
            on the local file system. This slot is used to determine whether 
            the file has been downloaded to the local file system. A value of 
            NULL indicates that the attachment file has not been downloaded.
            The \code{\link{download}} method can be used to download the file.
        }
    }
}

\section{Extends}{
    Class \code{\linkS4class{fileProxy}}, directly.
}


\section{Methods}{
    \describe{
        There are separate documentation pages for some of the methods
        listed here which may be consulted for more details.

        \item{summary}{Print a basic summary about an \code{attachmentProxy}. 
            See \code{\link{summary}} for details.
            \emph{Usage:}
            \code{summary(attachmentProxy)}
        }
    
        \item{download}{Download the referenced attachment file to the local 
            file system, fill out the \code{localpath} slot and return an 
            updated copy of the \code{attachmentProxy} object.
            See \code{\link{download}} for details.
            \emph{Usage:}
            \code{download(attachmentProxy, dirpath=NULL, }\cr
            \code{    filepath=NULL, }\cr
            \code{    curlHandle=getCurlHandle(cookiefile=""), }\cr            
            \code{    show.progress=TRUE, ...)}\cr            
        }
    
        \item{is.downloaded}{Return TRUE if the \code{localpath} slot
            is not NULL, which indicates that the file has been downloaded
            to the local file system. Return FALSE if the \code{localpath} 
            is NULL.
            See \code{\link{is.downloaded}} for details.
            \emph{Usage:}
            \code{is.downloaded(attachmentProxy)}
        }
    }
}

\details{
    Objects of class \code{attachmentProxy} are used to hold information about
    a FlowRepository attachment file. This information includes the file name,
    URL, size in bytes, MD5 sum, description and a path to the file
    on the local file system. A NULL value in the \code{localpath} slot
    indicates that the attachment file has not been downloaded, you can use the
    \code{\link{download}} method to download the file.
}

\author{Josef Spidlen}

\seealso{
    \code{\linkS4class{fileProxy}}, 
    \code{\linkS4class{fcsProxy}}, 
    \code{\linkS4class{flowRepData}},
    \code{\link{download}}
}

\examples{
    myDataset <- flowRep.get("FR-FCM-ZZ3X")
    summary(attachments(myDataset)[[1]])
    str(attachments(myDataset)[[1]])
}

\keyword{classes}
