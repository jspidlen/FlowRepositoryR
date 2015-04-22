\name{flowRepData-class}
\docType{class}
\alias{flowRepData-class}
\alias{flowRepData}
\alias{summary,flowRepData-method}
\alias{is.downloaded,flowRepData-method}
\alias{download,flowRepData-method}
\alias{id,flowRepData-method}
\alias{fcs.files}
\alias{fcs.files,flowRepData-method}
\alias{fcs.files,flowRepData,fcs.files-method}
\alias{fcs.files<-}
\alias{fcs.files<-,flowRepData-method}
\alias{attachments}
\alias{attachments,flowRepData-method}
\alias{attachments,flowRepData,attachments-method}
\alias{attachments<-}
\alias{attachments<-,flowRepData-method}
\alias{organizations}
\alias{organizations,flowRepData-method}
\alias{organizations,flowRepData,organizations-method}

\title{'flowRepData': a class for storing metadata 
    about a FlowRepository dataset}

\description{This class represents the metadata (i.e., information about) 
    a dataset stored in FlowRepository.}

\section{Creating Objects}{
    To create a \code{flowRepData} directly from an FlowRepository, use
    function \code{\link{flowRep.get}}. This is the recommended and
    safest way of object creation, since \code{flowRep.get} will perform
    basic quality checks and populate all the slots accordingly. 
    Unless you know exactly what you are doing, creating objects using
    \code{new} or the constructor (as described below) is discouraged.

    Objects can be created using\cr
    \code{new("flowRepData", }\cr
    \code{  id                   = ....,  Object of class character}\cr
    \code{  public.url           = ....,  Object of class character or NULL}\cr
    \code{  name                 = ....,  Object of class character or NULL}\cr
    \code{  public               = ....,  Object of class logical or NULL}\cr
    \code{  primary.researcher   = ....,  Object of class character or NULL}\cr
    \code{  primary.investigator = ....,  Object of class character or NULL}\cr
    \code{  uploader             = ....,  Object of class character or NULL}\cr
    \code{  experiment.dates     = ....,  Object of class character or NULL}\cr
    \code{  purpose              = ....,  Object of class character or NULL}\cr
    \code{  conclusion           = ....,  Object of class character or NULL}\cr
    \code{  comments             = ....,  Object of class character or NULL}\cr
    \code{  funding              = ....,  Object of class character or NULL}\cr
    \code{  qc.measures          = ....,  Object of class character or NULL}\cr
    \code{  miflowcyt.score      = ....,  Object of class numeric or NULL}\cr
    \code{  keywords             = ....,  Object of class list}\cr
    \code{  publications         = ....,  Object of class list}\cr
    \code{  organizations        = ....,  Object of class list}\cr
    \code{  fcs.files            = ....,  Object of class list}\cr
    \code{  attachments          = ....,  Object of class list}\cr
    \code{)}\cr

    or the constructor \code{flowRepData}, with mandatory argument
    \code{id} and optional arguments \code{public.url}, \code{name},
    \code{public}, \code{primary.researcher}, \code{primary.investigator}, 
    \code{uploader}, \code{experiment.dates}, \code{purpose}, 
    \code{conclusion}, \code{comments}, \code{funding}, \code{qc.measures}, 
    \code{miflowcyt.score}, \code{keywords}, \code{publications}, 
    \code{organizations}, \code{fcs.files}, and \code{attachments}.

    \code{flowRepData(id, public.url=NULL, name=NULL, public=NULL,}\cr
    \code{  primary.researcher=NULL, primary.investigator=NULL,}\cr
    \code{  uploader=NULL, experiment.dates=NULL,}\cr
    \code{  purpose=NULL, conclusion=NULL, comments=NULL,}\cr
    \code{  funding=NULL, qc.measures=NULL, miflowcyt.score=NULL,}\cr
    \code{  keywords=list(), publications=list(), organizations=list(),}\cr
    \code{  fcs.files=list(), attachments=list())}\cr
}

\section{Slots}{
    \describe{
    
        \item{\code{id}:}{Object of class \code{character} containing the
            FlowRepository identified of the dataset. These identifiers are
            typically in the form of \code{FR-FCM-}xxxx where xxxx represents
            4 alphanumeric characters.
        }

        \item{\code{public.url}:}{Object of class \code{character} or 
            NULL containing the public URL of this dataset. This will 
            commonly be in the form of
            \code{https://flowrepository.org/id/}identifier, where 
            identifier is the FlowRepository identified of the dataset.
        }

        \item{\code{name}:}{Object of class \code{character} or 
            NULL containing the name of this dataset.
        }

        \item{\code{public}:}{Object of class \code{logical} or 
            NULL containing the information whether this dataset is public.
        }

        \item{\code{primary.researcher}:}{Object of class \code{character} or
            NULL containing the name of the primary researcher 
            associated with this dataset.
        }

        \item{\code{primary.investigator}:}{Object of class \code{character} or
            NULL containing the name of the primary investigator 
            associated with this dataset.
        }

        \item{\code{uploader}:}{Object of class \code{character} or 
            NULL containing the name of the uploader of this dataset.
        }

        \item{\code{experiment.dates}:}{Object of class \code{character} or 
            NULL containing the dates associated with this dataset. 
            Typically, there will be two dates associated with the dataset, 
            the first one for the start of the experiment, the second one 
            for the end of the experiment. A single date indicates the start
            of an experiment that may still be ongoing. The dates shall 
            be encoded as "YYYY-MM-DD".
        }

        \item{\code{purpose}:}{Object of class \code{character} or 
            NULL stating the purpose of this dataset (experiment).
        }

        \item{\code{conclusion}:}{Object of class \code{character} or 
            NULL stating the conclusion associated with this dataset 
            (typically conclusions reached by analyzing the data).
        }

        \item{\code{comments}:}{Object of class \code{character} or 
            NULL stating additional comments associated with this dataset.
        }

        \item{\code{funding}:}{Object of class \code{character} or NULL 
            stating the funding used to collect the data in this dataset.
        }

        \item{\code{qc.measures}:}{Object of class \code{character} or 
            NULL stating the quality control measures taken in order to 
            ensure the quality of data in this dataset.
        }
    
        \item{\code{miflowcyt.score}:}{Object of class \code{numeric} or 
            NULL stating the MIFlowCyt compliance score of this experiment. 
            MIFlowCyt is the Minimum Information about a Flow Cytometry 
            Experiment - an ISAC Recommendation listing the minimum 
            information that shall be provided as annotation of flow 
            cytometry datasets. The MIFlowCyt compliance score is a value 
            between 0 and 100 percent indicating the level of compliance 
            with MIFlowCyt. Details about how FlowRepository calculates 
            this score ara available here:
            http://flowrepository.org/quick_start_guide#MIFlowCytScoreReport
        }

        \item{\code{keywords}:}{Object of class \code{list} (of objects 
            of class \code{character}) enumerating keywords associated 
            with this dataset.
        }

        \item{\code{publications}:}{Object of class \code{list} (of objects 
            of class \code{character}) enumerating publications associated 
            with this dataset. Publications are typically listed as
            "PMID:12345678" or "PMCID:PMC1234567".
        }

        \item{\code{organizations}:}{Object of class \code{list} of objects
            of class \code{\linkS4class{flowRepOrganization}}
            enumerating organizations associated with this dataset.
        }

        \item{\code{fcs.files}:}{Object of class \code{list} of objects 
            of class \code{\linkS4class{fcsProxy}}
            enumerating FCS files associated with this dataset.
        }

        \item{\code{attachments}:}{Object of class \code{list} of objects 
            of class \code{\linkS4class{attachmentProxy}}
            enumerating attachments associated with this dataset.
        }

    }
}

\section{Methods}{
    \describe{
        There are separate documentation pages for some of the methods
        listed here which may be consulted for more details.

        \item{summary}{Print a basic summary about a \code{flowRepData}. 
            See \code{\link{summary}} for details.
            \emph{Usage:}
            \code{summary(flowRepData)}
        }
    
        \item{download}{Download all the referenced FCS files and attachments,
            fill out their \code{localpath} slots and return an updated copy
            of the \code{flowRepData} object.
            See \code{\link{download}} for details.
            \emph{Usage:}
            \code{download(flowRepData)}
        }
    
        \item{is.downloaded}{Return TRUE if all FCS files and attachments
            referenced from this \code{flowRepData} object are downloaded
            to your local file system. This is determined by the 
            \code{localpath} slot of the \code{\linkS4class{fileProxy}} 
            objects in the fcs.files list and attachments list. 
            No other checks are performed.
            See \code{\link{is.downloaded}} for details.
            \emph{Usage:}
            \code{is.downloaded(flowRepData)}
        }
    
        \item{id}{Return the character vector representing the identifier 
            to the FlowRepository dataset.
            See \code{\link{id}} for details.
            \emph{Usage:}
            \code{id(flowRepData)}
        }

        \item{fcs.files}{Return an object of class \code{list} of objects 
            of class \code{\linkS4class{fcsProxy}}
            enumerating FCS files associated with this dataset.
        }

        \item{attachments}{Return an object of class \code{list} of objects 
            of class \code{\linkS4class{attachmentProxy}}
            enumerating attachments associated with this dataset.
        }

        \item{organizations}{Return an object of class \code{list} of objects
            of class \code{\linkS4class{flowRepOrganization}}
            enumerating organizations associated with this dataset.
        }

    }
}

\details{
    Objects of class \code{flowRepData} can be used to hold information 
    about a FlowRepository dataset. This includes the FlowRepository 
    dataset identifier, name, primary researcher, investigator and 
    uploader, information about the purpose, conclusions, comments and 
    funding, experiment dates, QC measures, MIFlowCyt score, keywords, 
    organizations, publications, list of FCS file names and attachment 
    names, and whether or not it is a public dataset. Using this objects, 
    FCS files and attachments can be easily downloaded to your local file 
    system. See the \code{\link{download}} method.
}

\author{Josef Spidlen}

\seealso{
    \code{\link{flowRep.get}}, 
    \code{\link{download}}
}

\examples{
    ## Obtain dataset information from FlowRepository
    myDataset <- flowRep.get("FR-FCM-ZZZG")
    id(myDataset)
    is.downloaded(myDataset)
    summary(myDataset)
}

\keyword{classes}
