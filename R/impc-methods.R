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

.impc.par.dict <- list(
    impc_imm_001_001 = "Spleen weight in grams",
    impc_imm_026_001 = "Total number of acquired events in Panel A",
    impc_imm_002_001 = "Percentage of live gated events in Panel A",
    impc_imm_003_001 = "T cells (panel A)",
    impc_imm_004_001 = "NKT cells (panel A)",
    impc_imm_005_001 = "NK cells (panel A)",
    impc_imm_006_001 = "Others",
    impc_imm_007_001 = "CD4 T cells",
    impc_imm_008_001 = "CD8 T cells",
    impc_imm_009_001 = "DN T cells",
    impc_imm_010_001 = "DP T cells",
    impc_imm_011_001 = "CD4 NKT cells",
    impc_imm_012_001 = "CD8 NKT cells",
    impc_imm_013_001 = "DN NKT cells",
    impc_imm_014_001 = "CD4 CD25+ T cells",
    impc_imm_015_001 = "CD4 CD25- T cells",
    impc_imm_016_001 = "CD8 CD25+ T cells",
    impc_imm_017_001 = "CD8 CD25- T cells",
    impc_imm_018_001 = "DN CD25+ T cells",
    impc_imm_019_001 = "DN CD25- T cells",
    impc_imm_020_001 = "CD4 CD25+ NKT cells",
    impc_imm_021_001 = "CD4 CD25- NKT cells",
    impc_imm_022_001 = "CD8 CD25+ NKT cells",
    impc_imm_023_001 = "CD8 CD25- NKT cells",
    impc_imm_024_001 = "DN CD25+ NKT cells",
    impc_imm_025_001 = "DN CD25- NKT cells",
    impc_imm_028_001 = "CD4 CD44+CD62L- T cells",
    impc_imm_029_001 = "CD4 CD44+CD62L+ T cells",
    impc_imm_030_001 = "CD4 CD44-CD62L+ T cells",
    impc_imm_031_001 = "CD4 CD44-CD62L- T cells",
    impc_imm_032_001 = "CD8 CD44+CD62L- T cells",
    impc_imm_033_001 = "CD8 CD44+CD62L+ T cells",
    impc_imm_034_001 = "CD8 CD44-CD62L+ T cells",
    impc_imm_035_001 = "CD8 CD44-CD62L- T cells",
    impc_imm_036_001 = "DN CD44+CD62L- T cells",
    impc_imm_037_001 = "DN CD44+CD62L+ T cells",
    impc_imm_038_001 = "DN CD44-CD62L+ T cells",
    impc_imm_039_001 = "DN CD44-CD62L- T cells",
    impc_imm_040_001 = "CD4 CD44+CD62L- NKT cells",
    impc_imm_041_001 = "CD4 CD44+CD62L+ NKT cells",
    impc_imm_042_001 = "CD4 CD44-CD62L+ NKT cells",
    impc_imm_043_001 = "CD8 CD44+CD62L- NKT cells",
    impc_imm_044_001 = "CD8 CD44+CD62L+ NKT cells",
    impc_imm_045_001 = "CD8 CD44-CD62L+ NKT cells",
    impc_imm_046_001 = "DN CD44+CD62L- NKT cells",
    impc_imm_047_001 = "DN CD44+CD62L+ NKT cells",
    impc_imm_048_001 = "DN CD44-CD62L+ NKT cells",
    impc_imm_027_001 = "Total number of acquired events in Panel B",
    impc_imm_049_001 = "Percentage of live gated events in Panel B",
    impc_imm_050_001 = "Neutrophils",
    impc_imm_051_001 = "Monocytes",
    impc_imm_052_001 = "Eosinophils",
    impc_imm_053_001 = "NK Cells (panel B)",
    impc_imm_054_001 = "NK Subsets (Q1)",
    impc_imm_055_001 = "NK Subsets (Q2)",
    impc_imm_056_001 = "NK Subsets (Q3)",
    impc_imm_057_001 = "NK Subsets (Q4)",
    impc_imm_058_001 = "NKT Cells (panel B)",
    impc_imm_059_001 = "NKT Subsets (Q1)",
    impc_imm_060_001 = "NKT Subsets (Q3)",
    impc_imm_061_001 = "T Cells (panel B)",
    impc_imm_062_001 = "T Subset",
    impc_imm_063_001 = "B Cells",
    impc_imm_064_001 = "B1B Cells",
    impc_imm_065_001 = "B2B Cells",
    impc_imm_066_001 = "Follicular B Cells",
    impc_imm_067_001 = "Follicular B Cells (CD21/35+)",
    impc_imm_068_001 = "pre-B Cells",
    impc_imm_069_001 = "pre-B Cells (CD21/35 low)",
    impc_imm_070_001 = "MZB",
    impc_imm_071_001 = "MZB (CD21/35 high)",
    impc_imm_072_001 = "cDCs",
    impc_imm_073_001 = "cDCs CD11b Type",
    impc_imm_074_001 = "pDCs",
    impc_imm_075_001 = "RP Macrophage (F4/80+)",
    impc_imm_076_001 = "RP Macrophage (CD19- CD11c-)"
)

setGeneric(
    "add.result",
    def=function(object, ...) standardGeneric("add.result"),
    useAsDefault=function(object, ...)
    {
        stop(paste("The add.result method is not supported on object type:", 
            class(object)))
    }
)


setMethod(
    "add.result",
    signature=signature(object="IMPCAnalysis"),
    definition=function(object, id, value, ...)
    {
        if(id %in% names(.impc.par.dict)) object@impc.parameters[[id]] <- value
        else
            stop(paste("Key", id, "not among supported IMPC parameters.",
                "See impc.parameter.dictionary"))
            
    }
)

setMethod(
    "[",
    signature=signature(x="IMPCAnalysis", i="character"),
    definition=function(x, i, j, drop=FALSE)
    {
        if(drop) warning("Argument 'drop' ignored for subsetting of ",
            "IMPCAnalysis", call.=FALSE)
        x@impc.parameters[[i]]        
    }
)

setReplaceMethod(
    "[",
    signature=signature(x="IMPCAnalysis", i="character"),
    definition=function(x, i, j, value) {
        add.result(x, i, value)
        return(x)
    }
)

