[![DOI](https://zenodo.org/badge/36322565.svg)](https://zenodo.org/badge/latestdoi/36322565)

# beeRpop
Rwrapper for beepop/varroapop pesticide manual, private github repository

## project
This is R code designed to wrap the C executable from Bob Curry/Crytal River Consulting. 
It consists of:
1. the compiled C executable (Windows only) in the exe subdirectory
2. R files that call the executable for a Monte Carlo analysis
  * 00run_neonic_varroapop.R - points to machine-specific local directories and source 01, 02, 03, 04, and 05 .R scripts
  * 01parameterize_simulation.R - modifies parameter inputs for model simulations and compiles input data into dataframe
  # 02write_input.R - creates and saves .txt files of input flags for simulations
  * 03simulation_w_exe.R - runs executable
  * 04read_output.R - saves output results as .Rdata and saves simulation timestamps as an array locally
  * 05load_io.R - loads input and output data from local repository
  * 06sensitivity_analysis.R - calculate partial correlation coefficients, standard regression coefficients
  * 07plotting_neonic_generic.R - creates time series and sensitivity analysis figures from results dataframe
  * 07plotting_neonic_convsexp.R - comparison time series and sensitivity analysis figures of control vs exposed
  * 08plotting_errors.R - bug chasing

## input
All possible customizable input flags for VarroaPop are listed in 01parameterize_simulation.R; user only needs to "release" the input flag and/or adjust 
distribution range by uncommenting line
  
## output
Each VarroaPop simulation will create a .txt file of a results table when run from the command line. The text files are 
compiled into a 3D array in 03read_output.R and saved as .Rdata files in the output folder.

## plots
* fig_1MCproportions.pdf - proportion of simulations with selected response variables values > 0
* fig_quantile_timeseries.pdf - timeseries plots of 1st, 2nd, and 3rd quantiles of selected response variables
* fig_tornado.pdf - tornado diagram of partial correlation coefficient and standard regression coefficient values of selected
response variables at specific timepoints


