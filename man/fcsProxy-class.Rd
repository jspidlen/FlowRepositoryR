\name{fcsProxy-class}
\docType{class}
\alias{fcsProxy-class}
\alias{fcsProxy}
\alias{summary,fcsProxy-method}
\alias{is.downloaded,fcsProxy-method}
\alias{download,fcsProxy-method}

\title{'fcsProxy': a class representing a proxy to an FCS file in 
    FlowRepository}

\description{This class represents basic metadata (i.e., information about) 
    a single FCS file in FlowRepository.}

\section{Creating Objects}{

    Objects of the \code{fcsProxy} class are created automatically when
    you create a \code{flowRepData} object from FlowRepository by calling
    the \code{\link{flowRep.get}}. A list of \code{fcsProxy} objects will be 
    placed in the \code{fcs.files} slot of the \code{flowRepData} object.

    Unless you know what you are doing, creating objects using
    \code{new} or the constructor (as described below) is discouraged.
    
    Objects can be created using\cr
    \code{  new("fcsProxy", }\cr
    \code{    name        = ....,  Object of class character}\cr
    \code{    url         = ....,  Object of class character}\cr  
    \code{    size        = ....,  Object of class numeric}\cr
    \code{    md5sum      = ....,  Object of class character or NULL}\cr
    \code{    fcs.version = ....,  Object of class character or NULL}\cr
    \code{    localpath   = ....,  Object of class character or NULL}\cr  
    \code{  )}\cr

    or the constructor \code{fcsProxy}, with mandatory arguments
    \code{name} and \code{url} and optional arguments \code{size}, 
    \code{md5sum}, \code{fcs.version} and \code{localpath}.

    \code{fcsProxy(name, url, size=0, md5sum=NULL,}\cr
    \code{  fcs.version=NULL, localpath=NULL)}\cr

}

\section{Slots}{
    \describe{

        \item{\code{name}:}{Object of class \code{character} containing the
            name of the FlowRepository FCS file.
        }
    
        \item{\code{url}:}{Object of class \code{character} containing the
            url of the FlowRepository FCS file.
        }

        \item{\code{size}:}{Object of class \code{numeric} containing the size
            of the FlowRepository FCS file in bytes.
        }
    
        \item{\code{md5sum}:}{Object of class \code{character} or NULL 
            containing the MD5 sum of the FlowRepository FCS file.
        }
    
        \item{\code{fcs.version}:}{Object of class \code{character} or NULL 
            containing the FCS version identifier of the FlowRepository 
            FCS file. This version identifier corresponds to the first 
            6 bytes of the FCS file and typically contains one of the
            following strings: \code{FCS1.0}, \code{FCS2.0}, 
            \code{FCS3.0}, or \code{FCS3.1}.
        }

        \item{\code{localpath}:}{Object of class \code{character} or NULL 
            containing the path the FlowRepository FCS file as saved on 
            the local file system. This slot is used to determine whether 
            the file has been downloaded to the local file system. 
            A value of NULL indicates that the FCS file has not been 
            downloaded. The \code{\link{download}} method can be used 
            to download the file.
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

        \item{summary}{Print a basic summary about an \code{fcsProxy}. 
            See \code{\link{summary}} for details.
            \emph{Usage:}
            \code{summary(fcsProxy)}
        }
    
        \item{download}{Download the referenced FCS file to the local 
            file system, fill out the \code{localpath} slot and return an 
            updated copy of the \code{fcsProxy} object.
            See \code{\link{download}} for details.
            \emph{Usage:}
            \code{download(fcsProxy, dirpath=NULL, filepath=NULL, }\cr
            \code{    curlHandle=getCurlHandle(cookiefile=""), }\cr
            \code{    show.progress=TRUE, ...)}\cr
        }
    
        \item{is.downloaded}{Return TRUE if the \code{localpath} slot
            is not NULL, which indicates that the file has been downloaded
            to the local file system. Return FALSE if the \code{localpath} 
            is NULL.
            See \code{\link{is.downloaded}} for details.
            \emph{Usage:}
            \code{is.downloaded(fcsProxy)}
        }

    }
}

\details{
    Objects of class \code{fcsProxy} are used to hold information about
    a FlowRepository FCS file. This information includes the file name,
    URL, size in bytes, MD5 sum, FCS version and a path to the file
    on the local file system. A NULL value in the \code{localpath} slot
    indicates that the FCS file has not been downloaded, you can use the
    \code{\link{download}} method to download the file.
}

\references{
    Josef Spidlen, Wayne Moore, David Parks, Michael Goldberg, Chris Bray, 
    Pierre Bierre, Peter Gorombey, Bill Hyun, Mark Hubbard, Simon Lange, 
    Ray Lefebvre, Robert Leif, David Novo, Leo Ostruszka, Adam Treister, 
    James Wood, Robert F. Murphy, Mario Roederer, Damir Sudar, Robert Zigon, 
    and Ryan R. Brinkman.\cr
    Data File Standard for Flow Cytometry, Version FCS 3.1\cr
    Cytometry A. 2010 Jan; 77(1): 97100. doi: 10.1002/cyto.a.20825\cr
    \url{http://tinyurl.com/fcs3-1-pdf}
}

\author{Josef Spidlen}

\seealso{
    \code{\linkS4class{fileProxy}}, 
    \code{\linkS4class{attachmentProxy}}, 
    \code{\linkS4class{flowRepData}},
    \code{\link{download}}
}

\examples{
    myDataset <- flowRep.get("FR-FCM-ZZZG")
    summary(fcs.files(myDataset)[[1]])
    str(fcs.files(myDataset)[[1]])
}

\keyword{classes}
