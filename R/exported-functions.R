###############################################################################
## Copyright (©) 2015 Josef Spidlen, Ph.D.
## 
## License
## The software is distributed under the terms of the 
## GNU Lesser General Public License (LGPL)
## 
## Disclaimer
## This software and documentation come with no warranties of any kind.
## This software is provided "as is" and any and any express or implied 
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


flowRep.ls <- function(include.private=FALSE) {
    if (!haveFlowRepositoryCredentials()) include.private <- FALSE
    destfile <- tempfile(pattern="FlowRepository.DatasetList", 
        tmpdir=tempdir(), fileext=".xml")
    h <- getCurlHandle(cookiefile="")

    if (include.private) flowRep.login(h)
    f <- CFILE(destfile, mode="wb")
    response <- curlPerform(url=paste0(getFlowRepositoryURL(), 
        'list?client=', getFlowRepositoryClientID()), writedata=f@ref, 
        curl=h, .opts=list(ssl.verifypeer=FALSE))
    close(f)
    if (include.private) flowRep.logout(h)
  
    myEnv <- new.env()
    myEnv[['datasetIDs']] <- list()
    parseFlowRepositoryXML(xmlRoot(smartTreeParse(destfile)), myEnv)
    try(file.remove(destfile), silent=TRUE)
    unlist(myEnv[['datasetIDs']])
}


flowRep.get <- function(id, use.credentials=TRUE) {
    if (!is.character(id)) 
        stop('Please specify a dataset identifier as a character string.')
    if (!haveFlowRepositoryCredentials()) use.credentials <- FALSE
    destfile <- tempfile(pattern="FlowRepository.Dataset", tmpdir=tempdir(), 
        fileext=".xml")
    h <- getCurlHandle(cookiefile="")
  
    if (use.credentials) flowRep.login(h)
    f <- CFILE(destfile, mode="wb")
    response <- curlPerform(url=paste0(getFlowRepositoryURL(), 
        'list/', as.character(id), '?client=', getFlowRepositoryClientID()), 
        writedata=f@ref, curl=h, .opts=list(ssl.verifypeer=FALSE))
    close(f)
    if (use.credentials) flowRep.logout(h)
  
    myEnv <- new.env()
    myEnv[[id]] <- list()
    parseFlowRepositoryXML(xmlRoot(smartTreeParse(destfile)), myEnv)
    try(file.remove(destfile), silent=TRUE)
    unlist(myEnv[[id]])
}

