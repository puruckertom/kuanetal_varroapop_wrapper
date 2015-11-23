# beeRpop
Rwrapper for beepop/varroapop pesticide manual, private github repository

## project
This is R code designed to wrap the C executable from Bob Curry/Crytal River Consulting. It consists of:
1. the compiled C executable (Windows only) in the exe subdirectory
2. R files that call the executable for a Monte Carlo analysis
  * 00setup_neonic.R - points to machine-specific local directories and create Monte Carlo parameter inputs
  * 01simulation_neonicR.R - runs executable and reads output into R dataframe
  * 02plotting_neonicR.R - automatically creates a number of time series and sensitivity analysis figures from the dataframe
  * 03_error_plotting.R - bug chasing
  
## output created



