test_flowRep.get <- function() {
    ## Let's get a dataset
    ds <- flowRep.get("FR-FCM-ZZJ7")
    
    ## And let's check that we got what we would expect to
    checkTrue(class(ds) == "flowRepData")
    checkTrue(class(ds@id) == "character")
    checkTrue(class(ds@public.url) == "character")
    checkTrue(class(ds@name) == "character")
    checkTrue(class(ds@public) == "logical")
    checkTrue(class(ds@primary.researcher) == "character")
    checkTrue(class(ds@primary.investigator) == "character")
    checkTrue(class(ds@uploader) == "character")
    checkTrue(class(ds@experiment.dates) == "character")
    checkTrue(length(ds@experiment.dates) == 2)
    checkTrue(class(ds@purpose) == "character")
    checkTrue(class(ds@conclusion) == "character")
    checkTrue(class(ds@comments) == "character")
    checkTrue(class(ds@funding) == "character")
    checkTrue(class(ds@qc.measures) == "character")
    checkTrue(class(ds@miflowcyt.score) == "numeric")
    checkTrue(class(ds@keywords) == "list")
    checkTrue(class(ds@publications) == "list")
    checkTrue(class(ds@organizations) == "list")
    checkTrue(class(ds@fcs.files) == "list")
    checkTrue(class(ds@attachments) == "list")
    checkTrue(length(ds@fcs.files) == 2)
    checkTrue(length(ds@attachments) == 2)
}