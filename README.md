# RFA RMM Tools
Abstraction for vendor-specific modules and other RMM tooling, for use in global deployment scenarios: future-proof.
This module is a wrapper for other modules which have vendor-specific names. 

### How to Use this Module on a Windows Device
Open yourself an admin PowerShell and run this line after changing the number on the end to a known value, or 1 for generic.
```
Invoke-Expression (( new-object Net.WebClient ).DownloadString( 'https://raw.githubusercontent.com/RFAInc/RfaRmmTools/master/RfaRmmTools.psm1' )); Install-RfaRmmAgent 1; 
```

## Use Cases
We will create GPOs and other global configurations that may require name changes over time. 
For these global configs, we will use a generic name, defined in the PSM1 file. 

## Handling
We will point all generic names to their equivalent vendor-name conterparts. 

## Generic Functions, not Just Modules
Function names can be aliased, modules can be wrapped as is done in the PSM1 file using Invoke-Expression (iex). 

