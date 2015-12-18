# beeRpop
Rwrapper for beepop/varroapop pesticide manual, private github repository

## project
This is R code designed to wrap the C executable from Bob Curry/Crytal River Consulting. It consists of:
1. the compiled C executable (Windows only) in the exe subdirectory
2. R files that call the executable for a Monte Carlo analysis
  * 00run_neonic_varroapop.R - points to machine-specific local directories and source 01, 02, 03, 04, and 05 .R scripts
  * 01parameterize_simulation.R - modifies parameter inputs for model simulations and saves input values as .csv locally
  * 02simulation_w_exe.R - runs executable
  * 03read_output.R - saves output results as .Rdata and saves simulation timestamps as an array locally
  * 04load_io.R - loads input and output data from local repository
  * 05sensitivity_analysis.R - calculate partial correlation coefficients, standard regression coefficients
  * 06plotting_neonic_generic.R - creates time series and sensitivity analysis figures from results dataframe
  * 07plotting_errors.R - bug chasing
  
## output created
Each VarroaPop simulation will create a .txt file of a results table when run from the command line. The text files are 
compiled into a 3D array in 03read_output.R and saved as .Rdata files in the output folder.

## plots created
* fig_1MCproportions.pdf - proportion of simulations with selected response variables values > 0
* fig_quantile_timeseries.pdf - timeseries plots of 1st, 2nd, and 3rd quantiles of selected response variables
* fig_tornado.pdf - tornado diagram of partial correlation coefficient and standard regression coefficient values of selected
response variables at specific timepoints


