test_flowRep.ls <- function() {
    ## Not much useful testing as we don't know what 
    ## FlowRepository datasets are (will be) available.
    ## So we will just check that there are at least 50 different datasets
    checkTrue(length(flowRep.ls()) > 50)
}