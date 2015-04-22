###############################################################################
## Copyright (c) 2015 Josef Spidlen, Ph.D.
##
## License
## The software is distributed under the terms of the 
## Artistic License 2.0
## http://www.r-project.org/Licenses/Artistic-2.0
## 
## Disclaimer
## This software and documentation come with no warranties of any kind.
## This software is provided "as is" and any express or implied 
## warranties, including, but not limited to, the implied warranties of
## merchantability and fitness for a particular purpose are disclaimed.
## In no event shall the  copyright holder be liable for any direct, 
## indirect, incidental, special, exemplary, or consequential damages
## (including but not limited to, procurement of substitute goods or 
## services; loss of use, data or profits; or business interruption)
## however caused and on any theory of liability, whether in contract,
## strict liability, or tort arising in any way out of the use of this 
## software.    
###############################################################################


setGeneric(
    "is.downloaded",
    def=function(object, ...) standardGeneric("is.downloaded"),
    useAsDefault=function(object, ...)
    {
        stop(paste("The is.downloaded method is not supported on object type:", 
            class(object)))
    }
)

setMethod(
    "is.downloaded",
    signature=signature(object="fileProxy"),
    definition=function(object, ...)
    {
        !is.null(object@localpath)
    }
)

setMethod(
    "is.downloaded",
    signature=signature(object="flowRepData"),
    definition=function(object, ...)
    {
        ## Return FALSE if at least one of the FCS files or attachments 
        ## is not downloaded. Otherwise return TRUE
        !is.element(FALSE, unlist(lapply(
            append(object@fcs.files,object@attachments), is.downloaded)))
    }
)

setGeneric(
    "download",
    def=function(object, ...) standardGeneric("download"),
    useAsDefault=function(object, ...)
    {
        stop(paste("The download method is not supported on object type:", 
            class(object)))
    }
)

setMethod(
    "download",
    signature=signature(object="fileProxy"),
    definition=function(object, dirpath=NULL, filepath=NULL, 
        curlHandle=getCurlHandle(cookiefile=""), show.progress=TRUE, ...)
    {
        if (is.downloaded(object))
        {
            if (show.progress) 
                cat(paste("File", object@name, "is downloaded already.\n"))
            return(object)
        }
    
        if (is.null(filepath)) 
        {
            if (is.null(dirpath)) 
                path <- paste0(getwd(), .Platform$file.sep, object@name)
            else 
                path <- paste0(dirpath, .Platform$file.sep, object@name)
        }
        else path <- filepath
        
        dir.create(dirname(path), showWarnings=FALSE, recursive=TRUE)

        f <- CFILE(path, mode="wb")
        response <- curlPerform(url=object@url, writedata=f@ref, 
            curl=curlHandle, .opts=list(ssl.verifypeer=FALSE))
        close(f)
        object@localpath <- path
    
        if (!verify.integrity(object)) 
        {
            try(file.remove(object@localpath ), silent=TRUE)
            object@localpath <- NULL
            stop(paste("Verification of file", path, "failed."))
        }

        if (show.progress) cat(paste("File", object@name, "downloaded.\n"))
        return(object)
    }
)

setMethod(
    "download",
    signature=signature(object="flowRepData"),
    definition=function(object, dirpath=NULL, use.credentials=TRUE, 
        show.progress=TRUE, ...)
    {
        if (is.downloaded(object))
        {
            if (show.progress) 
                cat(paste("Dataset", object@id, "is downloaded already.\n"))
            return(object)
        }
        
        if (!haveFlowRepositoryCredentials()) use.credentials <- FALSE
        if (is.null(dirpath)) 
            dirpath <- paste0(getwd(), .Platform$file.sep, object@id)
        dirpathAtt <- paste0(dirpath, .Platform$file.sep, "attachments")
    
        h <- getCurlHandle(cookiefile="")
        if (use.credentials) flowRep.login(h)
        if (show.progress) cat(paste("Downloading to", dirpath, "\n"))
        object@fcs.files <- lapply(object@fcs.files, download, 
            dirpath=dirpath, curlHandle=h, show.progress=show.progress, ...)
        object@attachments <- lapply(object@attachments, download, 
            dirpath=dirpathAtt, curlHandle=h, show.progress=show.progress, ...)
        if (use.credentials) flowRep.logout(h)
        if (show.progress) cat("Download finished.\n")
        return(object)
    }
)

setGeneric(
    "verify.integrity",
    def=function(object, ...) standardGeneric("verify.integrity"),
    useAsDefault=function(object, ...)
    {
        stop(paste("The verify.integrity method is not supported on", 
            class(object)))
    }
)

setMethod(
    "verify.integrity",
    signature=signature(object="fileProxy"),
    definition=function(object, ...)
    {
        if (!is.downloaded(object)) return(TRUE)
        if ((file.info(object@localpath)[['size']] != object@size) || 
            (as.character(md5sum(object@localpath)) != object@md5sum)) {
            if (file.info(object@localpath)[['size']] <= 1500) {
                con<-file(object@localpath, open="r")
                lines<-readLines(con) 
                for (i in 1:length(lines)) {
                    if (grepl("Access to the file is forbidden", lines[i], 
                        fixed=TRUE)) {
                        warning(paste("It appears that access to", 
                            object@url, "is forbidden."))
                        break
                    }
                }
                close(con)
            }
            return(FALSE)
        }
        TRUE
    }
)
