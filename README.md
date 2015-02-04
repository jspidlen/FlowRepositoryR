# FlowRepositoryR
R library to access FlowRepository.org 

## Quick Start Guide

Load the library
```R
> # Requires you to have libraries XML, RCurl, and tools.
> library(FlowRepositoryR)
```

Set FlowRepository credentials (optional)
```R
> # Next step is required only if you want access to private datasets
> # credentials file: 2 lines, your email on line 1, your password on line 2
> setFlowRepositoryCredentials("/path/to/flowrepository.credentials.txt")
> # This shall match your FlowRepository account and API password needs to
> # be set in your profile.
```

See what datasets are available
```R
> flowRep.ls(include.private=TRUE)
  [1] "FR-FCM-ZZZ3" "FR-FCM-ZZZ4" "FR-FCM-ZZZA" "FR-FCM-ZZZE" "FR-FCM-ZZZF"
  [6] "FR-FCM-ZZZG" "FR-FCM-ZZZH" "FR-FCM-ZZZK" "FR-FCM-ZZZU" "FR-FCM-ZZZV"
... <snip> ...
[211] "FR-FCM-ZZWG" "FR-FCM-ZZZ9" "FR-FCM-ZZZC" "FR-FCM-ZZYG" "FR-FCM-ZZ6Y"
[216] "FR-FCM-ZZ7B" "FR-FCM-ZZ9Y" "FR-FCM-ZZAR" "FR-FCM-ZZAU" "FR-FCM-ZZD6"
```

Pick a dataset
```R
> # This just gets the metadata but does not download the files
> x <- flowRep.get("FR-FCM-ZZ3M")
> summary(x)
A flowRepData object (FlowRepository dataset) 
EMBO Timecourse of IL-4 and IL-7 in PBMC B and T cells
14 FCS files, 1 attachments, NOT downloaded
```

Download the files
```R
> # You can specify the destination, whether to show progress and other options.
> x <- download(x)
Downloading to /home/jspidlen/FR-FCM-ZZ3M 
File EMBO Group1 Signaling timecourse_1_01 IL_4 Unstimulated_0_min.fcs downloaded.
File EMBO Group1 Signaling timecourse_1_02 IL_4 1_min.fcs downloaded.
File EMBO Group1 Signaling timecourse_1_03 IL-4 2 min.fcs downloaded.
File EMBO Group1 Signaling timecourse_1_04 IL-4 4 min.fcs downloaded.
File EMBO Group1 Signaling timecourse_1_05 IL-4 8 min.fcs downloaded.
... <snip> ...
File Full_Manual_PhosphoFlow_Course_Irish_3_2010.pdf downloaded.
Download finished.
>
> # Now your dataset is downloaded
> summary(x)
A flowRepData object (FlowRepository dataset) EMBO Timecourse of IL-4 and IL-7 in PBMC B and T cells
14 FCS files, 1 attachments, downloaded
> 
```

Locate your data
```R
> length(x@fcs.files)
[1] 14
> x@fcs.files[[4]]@localpath
[1] "/home/jspidlen/FR-FCM-ZZ3M/EMBO Group1 Signaling timecourse_1_04 IL-4 4 min.fcs"
```

Review details about a dataset
```R
> str(x)
```

Load files for further analysis
```R
> library(flowCore)
> # Assuming the files are consitent in the channels used, you can load
> # them in a single flowSet. See documentation for the flowCore library
> # for additional details
> ds <- read.flowSet(path="/home/jspidlen/FR-FCM-ZZ3M", pattern="*.fcs")
> ds
A flowSet with 14 experiments.

  column names:
  FSC-A SSC-A FITC-A PE-A APC-A PerCP-A Time
```
