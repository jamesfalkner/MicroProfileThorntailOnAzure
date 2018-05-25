# Eclipse MicroProfile on Azure

Congratulations! You have just received your free Azure trial pass to try Eclipse MicroProfile on Azure.

Follow these instructions to set up and run MicroProfile (Thorntail) on OpenShift on Azure:

1. Open a browser and navigate to: www.microsoftazurepass.com

#### Create a Single VM Origin deployment using the Azure Portal
Please ensure that an account has already been configured before clicking the button below.


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fcealsair%2FMicroProfileOnAzure%2Fmaster%2Fallinone.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

------

This template deploys Origin on Azure.

![Console](images/parameters.png)


#### Subscription
Accept the default subscription ID value.

#### Resource Group
Select create a new resource group if one does not currently exist.

#### Location
The geographic location in which to deploy Origin.

#### Admin User
Supply a username which will be used for both SSH access and for the Origin web console.

#### Admin Password
Supply a password which will be used for the Origin web console.


#### Ssh Key Data
You will need a SSH RSA public key for access if one currently does not exist on your system. Please supply your Public SSH key only. 
For example, in linux the key can be located at ~/.ssh/id_rsa.pub

##### SSH Key Generation (Optiona)

1. [Windows](ssh_windows.md)
2. [Linux](ssh_linux.md)
3. [Mac](ssh_mac.md)


#### Vm Size
Specify a VM size. A default value is provided. If another size or type of vm is required ensure that the Location contains that instance type.

Once all of these values are set, then check the box to Agree to the teams and conditions and then click the Purchase button.

#### Deployment
A notification will pop up in the top right notifying you of the deployment. Click the notifications icon and then click "Deployment in progress...". The deployment will take 15-20 minutes. Once completed select outputs to recieve the URL of the Origin console and SSH information.


#### Thanks to the following individuals for the base template:
Daniel Falkner
Glenn West
Harold Wong
Ivan McKinley
