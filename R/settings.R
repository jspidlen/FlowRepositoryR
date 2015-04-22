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


.FlowRepository.env <- new.env()

## .FlowRepository.env$.FlowRepository.URL <- 'http://localhost/'
## .FlowRepository.env$.FlowRepository.URL <- 'http://flowrepository.org/'
.FlowRepository.env$.FlowRepository.URL <- 'https://flowrepository.org/'

## This clientID is specific for FlowRepositoryR. If you need a clientID
## for a different tool to work with FlowRepository API, please contact
## FlowRepository administrators at flowrepository-admin@isac-net.org
.FlowRepository.env$.FlowRepository.ClientID <- 'FlowRepositoryRyzJl74CNkUp1Kpb'

## Exported
getFlowRepositoryURL <- function() {
    .FlowRepository.env$.FlowRepository.URL
}

## Exported
setFlowRepositoryURL <- function(url) {
    if(substring(url, nchar(url)) != "/") url <- paste0(url, "/")
    .FlowRepository.env$.FlowRepository.URL <- url
}

## NOT Exported
getFlowRepositoryClientID <- function() {
    .FlowRepository.env$.FlowRepository.ClientID
}

.FlowRepository.env$.FlowRepository.User.Email <- ''
.FlowRepository.env$.FlowRepository.User.Password <- ''

## Exported
setFlowRepositoryCredentials <- function(filename=NULL, email=NULL, 
    password=NULL) 
{
    if(!is.null(filename)) {
        con=file(filename, open="r")
        line=readLines(con, 2) 
        if (length(line) >= 2) {
            email <- line[1]
            password <- line[2]
        }
        close(con)
    } else {
        if (is.null(email) && interactive()) 
            email <- readline("Please enter your email:    ")
        if (is.null(password) && interactive()) 
            password <- readline("Please enter your password: ")
    }

    if (!is.null(email) && !is.null(password) && nchar(password) > 0 && 
        nchar(email) > 0) 
    {
        .FlowRepository.env$.FlowRepository.User.Email <- email
        .FlowRepository.env$.FlowRepository.User.Password <- password
    } else {
        stop(paste("Please provide either a file with email and password,",
            "or your email and password directly as arguments."))
    }
}

# Exported
forgetFlowRepositoryCredentials <- function() {
    .FlowRepository.env$.FlowRepository.User.Email <- ''
    .FlowRepository.env$.FlowRepository.User.Password <- ''
}

# NOT Exported
getFlowRepositoryCredentials <- function() {
    c(.FlowRepository.env$.FlowRepository.User.Email, 
        .FlowRepository.env$.FlowRepository.User.Password)
}

# NOT Exported
haveFlowRepositoryCredentials <- function() {
    !is.null(.FlowRepository.env$.FlowRepository.User.Email) && 
        (nchar(.FlowRepository.env$.FlowRepository.User.Email) > 0) && 
        !is.null(.FlowRepository.env$.FlowRepository.User.Password) && 
        (nchar(.FlowRepository.env$.FlowRepository.User.Password) > 0)
}
