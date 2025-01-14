NOTE: for more news about the package, see https://github.com/florianhartig/BayesianTools/releases

# BayesianTools 0.1.7

The release was neccessary because of a change to CRAN, see https://github.com/florianhartig/BayesianTools/issues/191

Bugfixes 

- fixed HTML validation problems due to the recent switch to HTML5 for documentation pages in R 4.2.0, see also https://github.com/florianhartig/BayesianTools/issues/240
- some other small bugfixes

# BayesianTools 0.1.6

New features

- calibrationTest + helper functions to test for  https://github.com/florianhartig/BayesianTools/pull/172

Major changes

- None

Minor changes

- Help improvements and clarifications

Bugfixes 

- Bugfix AR1 likelihood https://github.com/florianhartig/BayesianTools/issues/169
- Bugfix restart MCMC https://github.com/florianhartig/BayesianTools/issues/158
- bugfix for new behavior of class(matrix) in CRAN devel, see https://github.com/florianhartig/BayesianTools/issues/191

# BayesianTools 0.1.5

Changes / improvements

- marginalPlot changed / updated

Minor changes 

- getSample behavior https://github.com/florianhartig/BayesianTools/issues/133
- Create a check of start values / check matrix at the runMCMC level https://github.com/florianhartig/BayesianTools/issues/114

Bugfixes:

- Removed package dependency in unit tests https://github.com/florianhartig/BayesianTools/issues/136
- Bugfix in bridge sampling https://github.com/florianhartig/BayesianTools/issues/121
- Missing -Inf -> - Inf check in DEzs and DREAMzs with parallel = T https://github.com/florianhartig/BayesianTools/issues/113


# BayesianTools 0.1.4

Compatibility

- added NIMBLE support to getSample and plotting functions
- added coda support to plotTimeSeriesResults and plotMarginals

Changes

- IMPORTANT: added a warning when calling runMCMC with the "twalk" sampler. At the moment, using this sampler is discouraged
- marginalPlot can now plot prior and/or posterior, either as histogram or as violin plots
- added bridge sampling to marginalLikelihood
- added shortcuts for AM, DR and DRAM samplers

Bugfixes:

- when calling getSample on mcmcSamplerList, the chains are now merged instead of concatenated 
- formulas in the vignette are now rendered correctly
- fixed a bug in VSEM help

Minor Changes:

- changed the ordering of the summary metrics of summary.mcmcSampler, and summary.mcmcSamplerList
- renamed marginalLikelihood output to "ln.ML"
- added tests for plotTimeSeriesResults, marginalPlot and marginalLikelihood
- added an example with restart to DEzs


# BayesianTools 0.1.3

Compatibility

- created compatibility to new Rcpp standard

Changes

- getSample extended to coda objects, so that all plot functions can also be used on coda objects 
- plotTimeSeriesResults now includes the option to create residual plots from posterior predictive simulations, calling the DHARMa package
- added new utitility functions sampleEquallySpaced and correctThin

Bugfixes

- IMPORTANT: fixed a bug in createPriorDensity - results with createPriorDensity prior to this bugfix may be unrealiable
- getSample now corrects wrong inputs for thin and numSamples instead of throwing an error
- smaller bugfixes in plot functions

# BayesianTools 0.1.2 

Bugfixes

- various smaller improvement / bugfixes in getSample, plot functions / Help (0.1.2)
- warnings / bugfixes associated to burnin arguments (0.1.1.2)
- bugfix in marginal plots (0.1.1.1)

# BayesianTools 0.1.1 

Mostly a bugfix release

Minor changes

- implemented method for estimating posterior volume (0.1.0.1)
- implemented GOF (0.1.0.2)

Bugfixes

- removed erroneously created help files (0.1.0.1)
- dynload change to conform to R 3.4.x requirements (0.1.1)
- smaller bugxfixes and help updates (0.1.1)

# BayesianTools 0.1.0 

- initial release