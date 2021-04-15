# RFA RMM Tools
Abstraction for vendor-specific modules and other RMM tooling, for use in global deployment scenarios: future-proof.
This module is a wrapper for other modules which have vendor-specific names. 

### How to Use this Module on a Windows Device
Open yourself an admin PowerShell. 
#### Install the Agent
Run this line after changing the number on the end to a known value, or 1 for generic.
```
[Net.ServicePointManager]::SecurityProtocol=[enum]::GetNames([Net.SecurityProtocolType]) | Foreach-Object {[Net.SecurityProtocolType]::$_};Invoke-Expression (( new-object Net.WebClient ).DownloadString( 'https://raw.githubusercontent.com/RFAInc/RfaRmmTools/master/RfaRmmTools.psm1' )); Install-RfaRmmAgent 1; 
```
Results displayed in-console will give detailed messages for status, including 1 final message at the end of the process that says either PASSED or FAILED to help you determine if the result was successful or not. 

#### Uninstall the Agent
Run this line.
```
[Net.ServicePointManager]::SecurityProtocol=[enum]::GetNames([Net.SecurityProtocolType]) | Foreach-Object {[Net.SecurityProtocolType]::$_};Invoke-Expression (( new-object Net.WebClient ).DownloadString( 'https://raw.githubusercontent.com/RFAInc/RfaRmmTools/master/RfaRmmTools.psm1' )); Uninstall-RfaRmmAgent;
```

#### Reset Registration
You need to do this after cloneing a server with an agent installed. 
```
[Net.ServicePointManager]::SecurityProtocol=[enum]::GetNames([Net.SecurityProtocolType]) | Foreach-Object {[Net.SecurityProtocolType]::$_};Invoke-Expression (( new-object Net.WebClient ).DownloadString( 'https://raw.githubusercontent.com/RFAInc/RfaRmmTools/master/RfaRmmTools.psm1' )); Reset-LtService;
```
If this doesn't work, try uninstall and install (above). 

### InTune
This script is compatible with InTune because it will throw an error if it fails to install the agent or if the installed agent does not check in shortly after installation has completed. InTune recognizes the error as the script failing to complete, so it will eventually try running the script on the given device again. 

## Troubleshooting
Please see the wiki (RFA Staff Only):
https://rfatech.atlassian.net/wiki/spaces/AUTO

## Use Cases
We will create GPOs and other global configurations that may require name changes over time. 
For these global configs, we will use a generic name, defined in the PSM1 file. 

## Handling
We will point all generic names to their equivalent vendor-name conterparts. 
Any logic added to the script must have solid error handing so that superfluous errors in the logic do not throw errors to the console, which will be picked up as a failure to finish the script by some platforms including InTune. 

## Generic Functions, not Just Modules
Function names can be aliased, modules can be wrapped as is done in the PSM1 file using Invoke-Expression (iex). 

