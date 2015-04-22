\name{download}
\alias{download}
\alias{download,fileProxy,download-method}
\alias{download,flowRepData,download-method}

\title{Download dataset files}

\description{
    This method can download whole datasets (all FCS files and attachments of 
    a \code{\linkS4class{flowRepData}} object) or individual files based on 
    file proxies (\code{\linkS4class{fileProxy}} objects).
}

\usage{
    download(object, \dots)
}

\arguments{
    \item{object}{Object of class \code{\linkS4class{fileProxy}} or 
        \code{\linkS4class{flowRepData}}.}
    \item{\dots}{Additional options, see the details section.}
}

\details{
    The full dataset or the file represented by the file proxy will be 
    downloaded to the local file system. If you are downloading the 
    whole dataset (passing a \code{\linkS4class{flowRepData}} object), 
    then you can specify the following additional options:

    \describe{
        \item{\code{dirpath=NULL}}{The path to the directory where to 
            download the files. By default, the files will be downloaded to a 
            folder named based on the dataset identifier (FR-FCM-xxxx) 
            that will be created in your working directory.}
        \item{\code{use.credentials=TRUE}}{Whether to use stored credentials 
            to login before downloading the dataset.
            Credentials will only be used if \code{use.credentials=TRUE} 
            and they are set (see \code{\link{setFlowRepositoryCredentials}}).
            If your credentials are set, but you are downloading a public 
            dataset that does not need credentials, then you can use
            \code{use.credentials=FALSE} to avoid logging in.}
        \item{\code{show.progress=TRUE}}{ Whether to show progress as 
            individual files are being downloaded.}
    }
    
    If you are downloading a single file by (passing a 
    \code{\linkS4class{fileProxy}} object), then you can specify the
    following additional options:
    
    \describe{
        \item{\code{dirpath=NULL}}{The path to the directory where to download
            the file. By default, the file will be downloaded to your working 
            directory. A \code{filepath} argument as specified below takes 
            precedence over the \code{dirpath} argument.}
        \item{\code{filepath=NULL}}{The path where to download the file. 
            If provided, this argument takes precedence over \code{dirpath}.}
        \item{\code{curlHandle=getCurlHandle(cookiefile="")}}{Used to pass 
            cookies to keep track of sessions. This is intended for internal 
            use, not to be used by regular users.}
        \item{\code{show.progress=TRUE}}{ Whether to show progress as the 
            file is being downloaded.}
    }
}

\value{
    A \code{\linkS4class{fileProxy}} object if \code{object} is a 
    \code{\linkS4class{fileProxy}} object or 
    a \code{\linkS4class{flowRepData}} object if \code{object} is a 
    \code{\linkS4class{flowRepData}} object.
    This is an updated file proxy or a dataset that includes local path 
    to the downloaded files.
}

\seealso{\code{\link{flowRep.get}}}

\author{Josef Spidlen}

\examples{
    ## We will get a small dataset
    myDataset <- flowRep.get("FR-FCM-ZZJ7")
    summary(myDataset)
    
    ## And download a single attachment file
    ## mainly just to demonstrate that one can do one file at a time.
    att1 <- download(attachments(myDataset)[[1]])
    localpath(att1)
    
    ## We can also find out about individual FCS file proxies
    summary(fcs.files(myDataset)[[1]])

    ## A single FCS file proxy can be downloaded
    fcs1 <- download(fcs.files(myDataset)[[1]])
    summary(fcs1)

    ## The file is downloaded to your home directory
    localpath(fcs1)

    ## The code above is just to demonstrate that it is
    ## possible to get individial files. However, typically, 
    ## we will want to download the whole dataset.
    myDataset <- download(myDataset)
    summary(myDataset)

    ## This downloaded all the files to your home directory
    ## This is where you find your data
    unlist(lapply(fcs.files(myDataset), function(x) paste(localpath(x))))

    ## And this is where you find the attachments of that dataset
    unlist(lapply(attachments(myDataset), function(x) paste(localpath(x))))
}

\keyword{methods}
