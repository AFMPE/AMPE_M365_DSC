# M365 Desired State Configuration 

## This repository is used to manage Desired State Configuration for the AMPE M365 Tenant.

It is composed of composite resources required to build a production ready environment. On a push to this branch, GitHub Actions builds the required MOF and deploys the configurations.

**Powershell Modules**

This solution manages separate M365 DSC Resources in a modular fashion. See the list below for the module listing.
* AzureAD
* Exchange
* Intune
* OneDrive
* PowerPlatform
* Security & Compliance
* Sharepoint
* Teams
