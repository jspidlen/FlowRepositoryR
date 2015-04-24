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
    "add.result",
    def=function(object, ...) standardGeneric("add.result"),
    useAsDefault=function(object, ...)
    {
        stop(paste("The add.result method is not supported on object type:", 
                   class(object)))
    }
)


setMethod(
    "add.result",
    signature=signature(object="IMPCAnalysis"),
    definition=function(object, id, value, ...)
    {
        object@impc.parameters[[id]] <- value
    }
)
