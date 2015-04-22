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


setMethod(
    "summary",
    signature=signature(object="flowRepData"),
    definition=function(object, ...)
    {
        cat(paste0("A flowRepData object (FlowRepository dataset) ", 
            object@name, "\n",
        length(object@fcs.files), " FCS files, ",
        length(object@attachments), " attachments, ",
        ifelse(is.downloaded(object), "", "NOT "), "downloaded\n"))
    }
)

setMethod(
    "summary",
    signature=signature(object="fileProxy"),
    definition=function(object, ...)
    {
        if (is.downloaded(object)) downloaded <- ' ('
        else downloaded <- ' (NOT '
        cat(paste0("A fileProxy object (proxy for a file) ", object@name, 
            downloaded, "downloaded)\n"))
    }
)

setMethod(
    "summary",
    signature=signature(object="flowRepOrganization"),
    definition=function(object, ...)
    {
        cat(paste(object@name, object@street, object@city, object@zip, 
            object@state, object@country, sep="\n"))
    }
)
