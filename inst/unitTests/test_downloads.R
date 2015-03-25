test_downloads <- function() {
    myDataset <- flowRep.get("FR-FCM-ZZJ7")
    
    ## First, the dataset is not downloaded
    checkTrue(!is.downloaded(myDataset))
    
    ## The first attachment is not downloaded, download it and check
    ## again. It should be downloaded, but the whole dataset still isn't.
    checkTrue(is.null(myDataset@attachments[[1]]@localpath))
    myDataset@attachments[[1]] <- download(myDataset@attachments[[1]])
    checkTrue(!is.null(myDataset@attachments[[1]]@localpath))
    checkTrue(is.downloaded(myDataset@attachments[[1]]))
    checkTrue(!is.downloaded(myDataset))

    ## The first fcs file is not downloaded, download it and check
    ## again. It should be downloaded, but the whole dataset still isn't.
    checkTrue(is.null(myDataset@fcs.files[[1]]@localpath))
    myDataset@fcs.files[[1]] <- download(myDataset@fcs.files[[1]])
    checkTrue(!is.null(myDataset@fcs.files[[1]]@localpath))
    checkTrue(is.downloaded(myDataset@fcs.files[[1]]))
    checkTrue(!is.downloaded(myDataset))
    
    ## Finally, let's just download the whole dataset (i.e., all remaining
    ## FCS files and attachments). The dataset should be all downloaded
    ## afterwards.
    myDataset <- download(myDataset)
    checkTrue(is.downloaded(myDataset))
}