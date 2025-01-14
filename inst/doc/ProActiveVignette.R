## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  out.width = "100%",
  collapse = TRUE,
  comment = "#>"
)

## ----setup, echo=FALSE, warning=FALSE, include=FALSE--------------------------
library(ProActive)
library(kableExtra)
library(ggplot2)
library(stringr)
library(dplyr)

## ----eval=FALSE---------------------------------------------------------------
# install.packages("ProActive")
# library(ProActive)

## ----eval=FALSE---------------------------------------------------------------
# if (!require("devtools", quietly = TRUE)) {
#   install.packages("devtools")
# }
# 
# devtools::install_github("jlmaier12/ProActive")
# library(ProActive)

## ----echo=FALSE---------------------------------------------------------------
kable(head(sampleMetagenomePileup), row.names = FALSE) %>%
  kable_styling(latex_options = "HOLD_position")

## ----echo=FALSE---------------------------------------------------------------
kable(head(sampleMetagenomegffTSV), row.names = FALSE) %>%
  kable_styling(latex_options = "HOLD_position")

## ----echo=FALSE, out.width = "50%"--------------------------------------------
dataframe <- cbind.data.frame(c(1:100), c(rep(0, 20), rep(100, 60), rep(0, 20)))
colnames(dataframe) <- c("mockpos", "mockcov")
plot1 <- ggplot(dataframe, aes(x = mockpos, y = mockcov)) +
  geom_line(linewidth = 1) +
  labs(x = NULL, y = NULL) +
  theme_classic() +
  ggplot2::theme(
    axis.text.x = element_blank(),
    axis.ticks.x = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks.y = element_blank(),
    plot.title = element_text(size = 10),
    panel.border = element_rect(colour = "black", fill = NA, linewidth = 2)
  )

plot1

## ----echo=FALSE, out.width = "50%"--------------------------------------------
dataframe <- cbind.data.frame(c(1:100), c(rep(100, 20), rep(5, 60), rep(100, 20)))
colnames(dataframe) <- c("mockpos", "mockcov")
plot1 <- ggplot(dataframe, aes(x = mockpos, y = mockcov)) +
  geom_line(linewidth = 1) +
  labs(x = NULL, y = NULL) +
  theme_classic() +
  ggplot2::theme(
    axis.text.x = element_blank(),
    axis.ticks.x = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks.y = element_blank(),
    plot.title = element_text(size = 10),
    panel.border = element_rect(colour = "black", fill = NA, linewidth = 2)
  )

plot1

## ----echo=FALSE, out.width = "50%"--------------------------------------------
dataframe <- cbind.data.frame(c(1:100), c(rep(100, 50), rep(5, 50)))
colnames(dataframe) <- c("mockpos", "mockcov")
plot1 <- ggplot(dataframe, aes(x = mockpos, y = mockcov)) +
  geom_line(linewidth = 1) +
  labs(x = NULL, y = NULL) +
  theme_classic() +
  ggplot2::theme(
    axis.text.x = element_blank(),
    axis.ticks.x = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks.y = element_blank(),
    plot.title = element_text(size = 10),
    panel.border = element_rect(colour = "black", fill = NA, linewidth = 2)
  )

plot1

## ----echo=FALSE, out.width = "50%"--------------------------------------------
dataframe <- cbind.data.frame(c(1:100), rep(10, 100))
colnames(dataframe) <- c("mockpos", "mockcov")
plot1 <- ggplot(dataframe, aes(x = mockpos, y = mockcov)) +
  geom_line(linewidth = 1) +
  ylim(0, 100) +
  labs(x = NULL, y = NULL) +
  theme_classic() +
  ggplot2::theme(
    axis.text.x = element_blank(),
    axis.ticks.x = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks.y = element_blank(),
    plot.title = element_text(size = 10),
    panel.border = element_rect(colour = "black", fill = NA, linewidth = 2)
  )
plot1

## -----------------------------------------------------------------------------
ProActiveOutputMetagenome <- ProActive(
  pileup = sampleMetagenomePileup,
  mode = "metagenome",
  gffTSV = sampleMetagenomegffTSV
)

## -----------------------------------------------------------------------------
ProActiveOutputGenome <- ProActive(
  pileup = sampleGenomePileup,
  mode = "genome",
  gffTSV = sampleGenomegffTSV
)

## ----eval=FALSE---------------------------------------------------------------
# ProActive(pileup,
#   mode,
#   gffTSV,
#   windowSize = 1000,
#   minSize = 10000,
#   maxSize = Inf,
#   minContigLength = 30000,
#   chunkSize = 50000,
#   chunkContigs = FALSE,
#   IncludeNoPatterns = FALSE,
#   verbose = TRUE,
#   saveFilesTo
# )

## -----------------------------------------------------------------------------
MetagenomeCleanSummaryTable <- ProActiveOutputMetagenome$CleanSummaryTable

## ----echo=FALSE---------------------------------------------------------------
kable(MetagenomeCleanSummaryTable) %>%
  kable_styling(latex_options = "HOLD_position")

## -----------------------------------------------------------------------------
GenomeCleanSummaryTable <- head(ProActiveOutputGenome$CleanSummaryTable)

## ----echo=FALSE---------------------------------------------------------------
kable(GenomeCleanSummaryTable) %>%
  kable_styling(latex_options = "HOLD_position")

## -----------------------------------------------------------------------------
MetagenomeResultsGenePredictTable <- head(ProActiveOutputMetagenome$GeneAnnotTable)

## ----echo=FALSE---------------------------------------------------------------
kable(MetagenomeResultsGenePredictTable) %>%
  kable_styling(latex_options = "HOLD_position")

## -----------------------------------------------------------------------------
GenomeResultsGenePredictTable <- head(ProActiveOutputGenome$GeneAnnotTable)

## ----echo=FALSE---------------------------------------------------------------
kable(head(GenomeResultsGenePredictTable)) %>%
  kable_styling(latex_options = "HOLD_position")

## -----------------------------------------------------------------------------
MetagenomeResultsPlots <- plotProActiveResults(
  pileup = sampleMetagenomePileup,
  ProActiveResults = ProActiveOutputMetagenome
)

GenomeResultsPlots <- plotProActiveResults(
  pileup = sampleGenomePileup,
  ProActiveResults = ProActiveOutputGenome
)

## ----eval=FALSE---------------------------------------------------------------
# plotProActiveResults(pileup,
#   ProActiveResults,
#   elevFilter,
#   saveFilesTo
# )

## ----eval=FALSE---------------------------------------------------------------
# MetagenomeResultsPlots

## ----echo=FALSE, fig.width=6--------------------------------------------------
MetagenomeResultsPlots$NODE_1884
MetagenomeResultsPlots$NODE_368
MetagenomeResultsPlots$NODE_617

## ----fig.width=6--------------------------------------------------------------
GenomeResultsPlots$NC_003197.2_chunk_36
GenomeResultsPlots$NC_003197.2_chunk_8

## -----------------------------------------------------------------------------
sessionInfo()

