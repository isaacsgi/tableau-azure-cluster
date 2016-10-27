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
**From the Azure CLI, execute the following commands:**

    /* Login to your Azure account
    Azure login

    /* List the accounts you have access to
    azure account list

    /* If your preferred subscription isn't set to default, use this command to set the right one
    azure account set <YourSubscriptionNameOrId>

    /* You can name your Resource Group however you prefer
    /* Choose the region of your preference
    azure group create -n azrtableaug -l "East US"

    /* Validate your customization of the template and parameters
    azure group template validate -f azuredeploy.json -e "azuredeploy.parameters.json" azrtableaug

    /* Deploy the template
    azure group deployment create -f azuredeploy.json -e "azuredeploy.parameters.json" -g azrtableaug


###  Once succesful,  your deployment will report an asset list similar to the following:   
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

## Step 2
### Login into Primary Server, download and install Tableau Primary Networked Server

1. Sign in to the [Azure  portal](https://portal.azure.com).
2. Navigate to the Resource Group you created
 ![Resource Group for the Tableau Server cluster](./images/picture1.png "Resource Group for the Tableau Server cluster")

3.  Connect to Primary Server via Remote Desktop
 ![Connecting / Logging into Primary](./images/picture2.png "Connecting / Logging into Primary")

4.  Select 'Local Server' on Server Manager
    (Say 'yes' to finding PCs, devices and content on this network)
 ![Accessing Server Manager](./images/picture3.png "Accessing Server Manager")

3.  Turn off IE Enhanced Security Configuration
 ![IE Enhanced Security Configuration](./images/picture4.png "IE Enhanced Security Configuration")

4.  Turn off Windows Firewall (Private and Public)
![Local Server - Firewall](./images/picture27.png "Local Server - Firewall")
![Firewall Settings](./images/picture28.png "Firewall Settings")

5.  Open Internet Explorer - Use recommended security, privacy, and compatibility settings
![Launch Internet Explorer](./images/picture5.png "Launch Internet Explorer")

6.  Navigate to [Tableau Alternate Downloads Site](http://www.tableau.com/support/esdalt)
![Tableau alternate downloads site](./images/picture7.png "Tableau alternate downloads site")

7.  Download Primary Networked Server: latest release of Tableau Server version 10.0 (TableauServer-64bit-10-0-2.exe)
![Tableau Primary Networked Server download](./images/picture8.png "Tableau Primary Networked Server download")

8.  Locate 'TableauServer-64bit-10-0-2.exe' on drive, double-click to initiate install, select 'Run', 'Next'
![Download location](./images/picture9.png "Download location")
![Run Install](./images/picture10.png "Run Install")

9.  Change install location to striped drive [TableauData (F:)], 'ok', then 'Next'
![Change install location](./images/picture10.png "Change install location")


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