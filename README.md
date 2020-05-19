# RFA RMM Tools
Abstraction for vendor-specific modules and other RMM tooling, for use in global deployment scenarios: future-proof.
This module is a wrapper for other modules which have vendor-specific names. 

## Use Cases
We will create GPOs and other global configurations that may require name changes over time. 
For these global configs, we will use a generic name, defined HERE in this file. 

## Handling
We will point all generic names to their equivalent vendor-name conterparts. 

## Generic Functions, not Just Modules
Function names can be aliased, modules can be wrapped as is done in the PSM1 file using Invoke-Expression (iex). 


