#Creating a Tableau Server Cluster on Azure

## Overview of the process
- **Step 1.** Deploy Azure Resource Manager Template to create VMs and Networking.
- **Step 2.** Login into Primary Server, download and install Tableau Primary Networked Server.
- **Step 3.** Login into each Worker Server, download and install Tableau Worker Networked Server.
- **Step 4.** Use Tableau Server Configuration on Primary Networked Server to setup and configure Worker Networked Servers.

###Pre-Requisites
- If you don't have an Azure account, you can create one [here] (https://azure.microsoft.com/en-us/free/)
- Edit the Azure Resource Manager (ARM) Template (azuredeploy.json) and/or ARM Template Parameters (azuredeploy.parameters.json) to customize any values you would like to change.  
- **Note:** minimum recommended VM Size is DS13.
- For more on deploying ARM Templates, see [here] (https://azure.microsoft.com/en-us/documentation/articles/resource-group-template-deploy/)

## Step 1
### Deploy Azure Resource Manager Template to create VMs and Networking

    Azure login

    azure account list

    azure group create -n azrtableaug -l "East US"

    azure group template validate -f azuredeploy.json -e "azuredeploy.parameters.json" azrtableaug

    azure group deployment create -f azuredeploy.json -e "azuredeploy.parameters.json" -g azrtableaug


##  Asset List   
    data:    DeploymentName     : azuredeploy
    data:    ResourceGroupName  : azrtableaug
    data:    ProvisioningState  : Succeeded
    data:    Timestamp          : Mon Oct 24 2016 11:59:33 GMT-0400 (Eastern Daylight Time)
    data:    Mode               : Incremental
    data:    CorrelationId      : 37eaa21f-f84c-45bb-890e-f5ccd2489510
    data:    DeploymentParameters :
    data:    Name                   Type          Value
    data:    ---------------------  ------------  ------------------------------------------------------------------
    data:    vmPrefix               String        azrtableau
    data:    vmSize                 String        Standard_DS13
    data:    dataDiskSize           String        128
    data:    adminUsername          String        VMAdmin
    data:    adminPassword          SecureString  undefined
    data:    location               String        East US
    data:    newStorageAccountName  String        azrtabstg
    data:    imagePublisher         String        MicrosoftWindowsServer
    data:    imageOffer             String        WindowsServer
    data:    imageSKU               String        2012-R2-Datacenter
    data:    initScriptUrl          String        https://isaacsgi.blob.core.windows.net/extensions/stripedrives.ps1
    data:    initScript             String        stripedrives.ps1
    info:    group deployment create command OK


License Key

##Install on Primary Networked Server
1.  Connect to Primary Server 
2.  Server Manager
3.  Turn off IE Enhanced Security Configuration
4.  Turn off Firewall (Private and Public)
5.  Open IE
Use recommended security, privacy, and compatibility settings
6.  Go to http://www.tableau.com/support/esdalt
7.  Download latest release of version 10.0 (TableauServer-64bit-10-0-2.exe)
8.  Locate on drive, double-click to initial install, select 'Run', 'Next'
9.  Change install location to striped drive [TableauData (F:)], 'ok', then 'Next'
10. System Verification
11. Accept License Agreement
12. Default Start Menu Group, 'Next'
13. Configuration and Initialization, 'Next'
14. Activate with license key
15. Tableau Server Configuration, 'ok', 'ok', IE launches
16. Create Server Administrator account, Tableau Administrator page opens
17. Close IE, 'Finish'
18. Add Server Directory to System Environmental Path
    a.  Right-click on 'This PC'
    b.  Properties
    c.  'Advanced system settings'
    d.  'Environment Variables...'
    e.  'System variable', select 'Path', 'Edit...'
    f.  at end of Variable value field, add ;f:\Tableau Server\bin    
    g.  'ok', 'ok', 'ok'
19. Windows Key + 'x'
20. Command Prompt (Admin)
21. Tabadmin stop
22. Windows Key, Down Arrow to 'Apps', Configure Tableau Server
23.  






Install

Primary Networked Server

Worker Networked Server