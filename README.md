# FlowRepositoryR
R library to access FlowRepository.org 

## Quick Start Guide

```R
> # Load the library
> # Requires you to have libraries XML, RCurl, and tools.
> library(FlowRepositoryR)
>
> # Next step is required only if you want access to private datasets
> # credentials file: 2 lines, your email on line 1, your password on line 2
> setFlowRepositoryCredentials("/path/to/flowrepository.credentials.txt")
> # This shall match your FlowRepository account and API password needs to
> # be set in your profile.
>
> # See what datasets are available
> flowRep.ls(include.private=TRUE)
  [1] "FR-FCM-ZZZ3" "FR-FCM-ZZZ4" "FR-FCM-ZZZA" "FR-FCM-ZZZE" "FR-FCM-ZZZF"
  [6] "FR-FCM-ZZZG" "FR-FCM-ZZZH" "FR-FCM-ZZZK" "FR-FCM-ZZZU" "FR-FCM-ZZZV"
... <snip> ...
[211] "FR-FCM-ZZWG" "FR-FCM-ZZZ9" "FR-FCM-ZZZC" "FR-FCM-ZZYG" "FR-FCM-ZZ6Y"
[216] "FR-FCM-ZZ7B" "FR-FCM-ZZ9Y" "FR-FCM-ZZAR" "FR-FCM-ZZAU" "FR-FCM-ZZD6"
>
> # Pick a dataset, this just gets the metadata but does not download the files
> x <- flowRep.get("FR-FCM-ZZ3M")
> summary(x)
A flowRepData object (FlowRepository dataset) EMBO Timecourse of IL-4 and IL-7 in PBMC B and T cells
14 FCS files, 1 attachments, NOT downloaded
>
> # Download the files, you can specify the destination, whether to show progress
> # and other options if needed.
> x <- download(x)
Downloading to /home/cytobank/sw/R-3.1.2/FR-FCM-ZZ3M 
File EMBO Group1 Signaling timecourse_1-01 IL-4 Unstimulated 0 min.fcs downloaded.
File EMBO Group1 Signaling timecourse_1-02 IL-4 1 min.fcs downloaded.
File EMBO Group1 Signaling timecourse_1-03 IL-4 2 min.fcs downloaded.
File EMBO Group1 Signaling timecourse_1-04 IL-4 4 min.fcs downloaded.
File EMBO Group1 Signaling timecourse_1-05 IL-4 8 min.fcs downloaded.
File EMBO Group1 Signaling timecourse_1-06 IL-4 12 min.fcs downloaded.
File EMBO Group1 Signaling timecourse_1-07 IL-4 16 min.fcs downloaded.
File EMBO Group1 Signaling timecourse_1-08 IL-7 Unstimulated 0 min.fcs downloaded.
File EMBO Group1 Signaling timecourse_1-09 IL-7 1 min.fcs downloaded.
File EMBO Group1 Signaling timecourse_1-10 IL-7 2 min.fcs downloaded.
File EMBO Group1 Signaling timecourse_1-11 IL-7 4 min.fcs downloaded.
File EMBO Group1 Signaling timecourse_1-12 IL-7 8 min.fcs downloaded.
File EMBO Group1 Signaling timecourse_1-13 IL-7 12 min.fcs downloaded.
File EMBO Group1 Signaling timecourse_1-14 IL-7 16 min.fcs downloaded.
File Full_Manual_-_PhosphoFlow_Course_-_Irish_3-2010.pdf downloaded.
Download finished.
>
> # Now your dataset is downloaded
> summary(x)
A flowRepData object (FlowRepository dataset) EMBO Timecourse of IL-4 and IL-7 in PBMC B and T cells
14 FCS files, 1 attachments, downloaded
> 
```



