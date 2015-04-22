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


## Extracts a numeric value of an element, i.e., <value>500</value> --> 500
getElValAsNum <- function(element)
{
    res <- NULL
    try(res <- as.numeric(as.character(element[[1]]$value)), silent=TRUE)
    res
}

## Extracts a character value of an element, 
## i.e., <value>text</value> --> "text"
getElValAsChar <- function(element)
{
    res <- NULL
    try(res <- as.character(element[[1]]$value), silent=TRUE)
    res
}

## Extracts a logicle value of an element, i.e., <value>true</value> --> TRUE
getElValAsLogicle <- function(element)
{
    res <- NA
    try(res <- as.logical(as.character(element[[1]]$value)), silent=TRUE)
    if (is.na(res)) res <- NULL
    res
}

## Parsing the XML tree and using classes created from element names
smartTreeParse=function(file, ...) 
{
    handlers=list(
        comment=function(x, ...)
        {
            NULL
        },
        startElement=function(x, ...) 
        {
            class(x)=c(paste(make.names(c(xmlNamespace(x), xmlName(x))), 
                collapse="_"), make.names(xmlNamespace(x)), class(x))
            x
        }
    )
    xmlTreeParse(file, handlers=handlers, asTree=TRUE, 
        fullNamespaceInfo=TRUE, ...)
}

flowRep.login <- function(curlHandle)
{
    credentials=getFlowRepositoryCredentials()
    response=postForm(paste0(getFlowRepositoryURL(), "loginapi"), 
        email=credentials[1], pass=credentials[2], curl=curlHandle, 
        .opts=list(ssl.verifypeer=FALSE)) 
}

flowRep.logout <- function(curlHandle)
{
    response=getURLContent(paste0(getFlowRepositoryURL(), "logout"), 
        curl=curlHandle, .opts=list(ssl.verifypeer=FALSE))   
}
