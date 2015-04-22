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

setClassUnion("characterOrNULL", c("character", "NULL"))
setClassUnion("logicalOrNULL", c("logical", "NULL"))
setClassUnion("numericOrNULL", c("numeric", "NULL"))

## Definition of the flowRepData class
setClass("flowRepData",
    representation=representation(
        id="characterOrNULL",
        public.url="characterOrNULL",
        name="characterOrNULL",
        public="logicalOrNULL",
        primary.researcher="characterOrNULL",
        primary.investigator="characterOrNULL",
        uploader="characterOrNULL",
        experiment.dates="characterOrNULL",
        purpose="characterOrNULL",
        conclusion="characterOrNULL",
        comments="characterOrNULL",
        funding="characterOrNULL",
        qc.measures="characterOrNULL",
        miflowcyt.score="numericOrNULL",
        keywords="list",
        publications="list",
        organizations="list",
        fcs.files="list", 
        attachments="list"
    ),
    prototype=list(
        id="defaultDatasetId",
        public.url=NULL,
        name=NULL,
        public=NULL,
        primary.researcher=NULL, 
        primary.investigator=NULL,
        uploader=NULL, 
        experiment.dates=NULL,
        purpose=NULL, 
        conclusion=NULL, 
        comments=NULL,
        funding=NULL,
        qc.measures=NULL,
        miflowcyt.score=NULL,
        keywords=list(),
        publications=list(),
        organizations=list(),
        fcs.files=list(),
        attachments=list()
    ),
    validity=function(object)
    {
        msg <- NULL
        if (is.null(object@id)) msg <- c(msg, 
            "Each flowRepData object needs to have an identifier.")
        msg
    }
)

## Constructor
flowRepData <- function(
    id, public.url=NULL, name=NULL, public=NULL,
    primary.researcher=NULL, primary.investigator=NULL,
    uploader=NULL, experiment.dates=NULL,
    purpose=NULL, conclusion=NULL, comments=NULL,
    funding=NULL, qc.measures=NULL, miflowcyt.score=NULL,
    keywords=list(), publications=list(), organizations=list(),
    fcs.files=list(), attachments=list())
    {
        new("flowRepData", 
        id=id, 
        public.url=public.url, 
        name=name, 
        public=public, 
        primary.researcher=primary.researcher, 
        primary.investigator=primary.investigator, 
        uploader=uploader, 
        experiment.dates=experiment.dates,
        purpose=purpose, 
        conclusion=conclusion, 
        comments=comments,
        funding=funding,
        qc.measures=qc.measures,
        miflowcyt.score=miflowcyt.score,
        keywords=keywords,
        publications=publications,
        organizations=organizations,
        fcs.files=fcs.files,
        attachments=attachments)
}

## Definition of the fileProxy class
## This is a parent for fcsProxy and attachmentProxy
setClass("fileProxy",
    representation=representation(
    name="characterOrNULL",
    url="characterOrNULL",           
    size="numeric",
    md5sum="characterOrNULL",
    localpath="characterOrNULL"),
    prototype=NULL,
    validity=function(object)
    {
        msg <- NULL
        if (is.null(object@name)) msg <- c(msg, 
            "Each fileProxy object needs to have a file name.")
        if (is.null(object@url)) msg <- c(msg, 
            "Each fileProxy object needs to have a URL.")
        msg
    }
)


## Definition of the fcsProxy class
setClass("fcsProxy",
    representation=representation(fcs.version="characterOrNULL"),
    contains="fileProxy",
    prototype=list(
        name="defaultFCSName.fcs",
        url=NULL,
        size=0,
        md5sum=NULL,
        fcs.version=NULL,
        localpath=NULL
    )
)

## Constructor
fcsProxy <- function(name, url, size=0, md5sum=NULL, fcs.version=NULL, 
    localpath=NULL)
{
    new("fcsProxy", name=name, url=url, size=size, md5sum=md5sum,
        fcs.version=fcs.version, localpath=localpath)
}

## Definition of the attachmentProxy class
setClass("attachmentProxy",
    representation=representation(description="characterOrNULL"),
    contains="fileProxy",
    prototype=list(
        name="defaultAttachmentName.ext",
        url=NULL,
        size=0,
        md5sum=NULL,
        description=NULL,
        localpath=NULL
    )
)

## Constructor
attachmentProxy <- function(name, url, size=0, md5sum=NULL, description=NULL, 
    localpath=NULL)
{
    new("attachmentProxy", name=name, url=url, size=size, md5sum=md5sum, 
        description=description, localpath=localpath)
}

## Definition of the flowRepOrganization class
setClass("flowRepOrganization",
    representation=representation(
        name="characterOrNULL",
        street="characterOrNULL",
        city="characterOrNULL",
        zip="characterOrNULL",
        state="characterOrNULL",
        country="characterOrNULL"
    ),
    prototype=list(
        name="defaultName",
        street=NULL,
        city=NULL,
        zip=NULL,
        state=NULL,
        country=NULL
    ),
    validity=function(object)
    {
        msg <- NULL
        if (is.null(object@name)) msg <- c(msg, 
            "Each flowRepOrganization object needs to have a name.")
        msg
    }
)

## Constructor
flowRepOrganization <- function(name, street=NULL, city=NULL, zip=NULL, 
    state=NULL, country=NULL)
{
    new("flowRepOrganization", name=name, street=street, city=city, zip=zip, 
        state=state, country=country)
}


## These are just dummy classes to help parse the XML "nicely"
setClass("FlowRepository")
setClass("api.version", representation=representation(), 
    validity=function(object) {})
setClass("public.experiments", representation=representation(), 
    validity=function(object) {})
setClass("experiment", representation=representation(), 
    validity=function(object) {})
setClass("response.with.details", representation=representation(), 
    validity=function(object) {})
setClass("error", representation=representation(), 
    validity=function(object) {})
setClass("public.datasets", representation=representation(), 
    validity=function(object) {})
setClass("result.datasets", representation=representation(), 
    validity=function(object) {})

