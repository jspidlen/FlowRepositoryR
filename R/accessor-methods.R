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


if (!isGeneric("id")) {
    if (is.function("id")) fun <- id
    else fun <- function(object) standardGeneric("id")
    setGeneric("id", fun)
}
setMethod("id", "flowRepData", function(object) object@id)


if (!isGeneric("fcs.files")) {
    if (is.function("fcs.files")) fun <- fcs.files
    else fun <- function(object) standardGeneric("fcs.files")
    setGeneric("fcs.files", fun)
}
setMethod("fcs.files", "flowRepData", function(object) object@fcs.files)
if (!isGeneric("fcs.files<-")) {
    setGeneric("fcs.files<-", 
        function(x, value) standardGeneric("fcs.files<-"))
}
setReplaceMethod("fcs.files",
    signature=signature(x="flowRepData", value="ANY"),
    definition=function(x, value) {
        if(!is(value, "list"))
            stop("fcs.files shall be a list", call.=FALSE)
        x@fcs.files <- value
        return(x)
    }
)

if (!isGeneric("attachments")) {
    if (is.function("attachments")) fun <- attachments
    else fun <- function(object) standardGeneric("attachments")
    setGeneric("attachments", fun)
}
setMethod("attachments", "flowRepData", function(object) object@attachments)
if (!isGeneric("attachments<-")) {
    setGeneric("attachments<-", 
        function(x, value) standardGeneric("attachments<-"))
}
setReplaceMethod("attachments",
    signature=signature(x="flowRepData", value="ANY"),
    definition=function(x, value) {
        if(!is(value, "list"))
            stop("attachments shall be a list", call.=FALSE)
        x@attachments <- value
        return(x)
    }
)

if (!isGeneric("localpath")) {
    if (is.function("localpath")) fun <- localpath
    else fun <- function(object) standardGeneric("localpath")
    setGeneric("localpath", fun)
}
setMethod("localpath", "fileProxy", function(object) object@localpath)

if (!isGeneric("organizations")) {
    if (is.function("organizations")) fun <- organizations
    else fun <- function(object) standardGeneric("organizations")
    setGeneric("organizations", fun)
}
setMethod("organizations", "flowRepData", function(object) object@organizations)
