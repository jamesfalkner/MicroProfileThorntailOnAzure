# Eclipse MicroProfile (WildFly Swarm) on Azure

**NOTE: Use Chrome or Firefox for the instructions below. They will not work with Safari**

Congratulations! You have just received your free Azure trial pass to try Eclipse MicroProfile on Azure.

These instructions are grouped in three main sections:

A. Redeeming your Azure Pass

B. Instantiating an all-in-one OpenShift Origin cluster on Azure

C. Using the Red Hat OpenShift Application Runtimes Launcher to generate the WildFly Swarm sample project 

# A. Redeeming your Azure Pass

1. Open a browser and navigate to: www.microsoftazurepass.com and click on the "Start" button

<img src="https://github.com/cealsair/MicroProfileThorntailOnAzure/blob/master/images/1_RedeemFreeAzureCreditsStart.png" width="500">

2. On the following screen, enter your Microsoft account credential, e.g. hotmail email or Skype email or LinkedIn email:

<img src="https://github.com/cealsair/MicroProfileThorntailOnAzure/blob/master/images/2_RedeemMSLogin.png" width="300">

3. Then enter your corresponding password. If this is your personal computer, I strongly recommend you click on "Keep me signed in":

<img src="https://github.com/cealsair/MicroProfileThorntailOnAzure/blob/master/images/3_RedeemEnterPass.png" width="300">

4. If the next "Updating Terms" screen is displayed, just click on the "Next" button:

<img src="https://github.com/cealsair/MicroProfileThorntailOnAzure/blob/master/images/4_RedeemUpdatingTerms.png" width="300">

5. Then click on the "Yes" button in the "Stay signed in?" dialog:

<img src="https://github.com/cealsair/MicroProfileThorntailOnAzure/blob/master/images/5_RedeemStaySignedIn.png" width="300">

6. On this screen, click on the "Confirm Microsoft account" button

<img src="https://github.com/cealsair/MicroProfileThorntailOnAzure/blob/master/images/6_RedeemConfirmMSacct.png" width="500">

7. Enter your Promo Code from your Azure trial pass and click on "Claim your Promo Code" button:

<img src="https://github.com/cealsair/MicroProfileThorntailOnAzure/blob/master/images/7_RedeemEnterPromoCode.png" width="500">

8. Once your Azure trial pass Promo Code is accepted, click on the "Activate" button:

<img src="https://github.com/cealsair/MicroProfileThorntailOnAzure/blob/master/images/8_RedeemThankYouAndActivate.png" width="500">

9. The activation process will display the following screen:

<img src="https://github.com/cealsair/MicroProfileThorntailOnAzure/blob/master/images/9_RedeemProcessingYourReq.png" width="500">

10. When the activation process completes, you will see the Azure Pass Agreement screen. Check the "I Agree" checkbox and click on "Sign Up" button

<img src="https://github.com/cealsair/MicroProfileThorntailOnAzure/blob/master/images/10_RedeemAzurePassAgree.png" width="500">

11. Once your sign-up is processed, you will be re-directed to your Azure Portal:

<img src="https://github.com/cealsair/MicroProfileThorntailOnAzure/blob/master/images/11_ReedeemAzurePortal.png" width="700">

# B. Instantiating an all-in-one OpenShift Origin cluster on Azure

1. Create a Single VM OpenShift Origin deployment using the Azure Portal

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fcealsair%2FMicroProfileOnAzure%2Fmaster%2Fallinone.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

------

This template deploys OpenShift Origin on Azure.

![Console](images/parameters.png)


#### Subscription
Accept the default subscription ID value. Note: this field is not shown in the picture above.

#### Resource Group
Select "Create new" resource group if one does not currently exist. Enter "origin" or a name of your choosing in the input field.

#### Location
The geographic location in which to deploy OpenShift Origin.

#### Admin User
Supply a username which will be used for both SSH access and for the OpenShift Origin web console.

#### Admin Password
Supply a password which will be used for the Origin web console.

#### Ssh Key Data
You will need a SSH RSA public key for access if one currently does not exist on your system. Please supply your Public SSH key only. 
For example, in Linux the key can be located at ~/.ssh/id_rsa.pub. Make sure to copy and paste the **ENTIRE** contents of the file ~/.ssh/id_rsa.pub into this input field.

##### SSH Key Generation (Optional)

1. [Windows](ssh_windows.md)
2. [Linux](ssh_linux.md)
3. [Mac](ssh_mac.md)

#### Vm Size
Specify a VM size. A default value is provided. If another size or type of vm is required ensure that the Location contains that instance type.

Once all of these values are set, then check the box to "Agree to the terms and conditions" and then click the Purchase button.

**Acknowledgements: Thanks to the following individuals for the base template: Daniel Falkner, Glenn West, Harold Wong, and Ivan McKinley**

2. Deploy OpenShift Origin template to Azure
A notification will pop up in the top right notifying you of the deployment:

<img src="https://github.com/cealsair/MicroProfileThorntailOnAzure/blob/master/images/12_OriginDeployInProgress.png" width="500">

The deployment will take 15-20 minutes. Once completed, the notification will display:

<img src="https://github.com/cealsair/MicroProfileThorntailOnAzure/blob/master/images/13_DeploySucceeded.png" width="500">

Click on "Go to resource group" button in the notification above to open up the window for the origin resource group (or you can also click on the "Resource groups" under "Favorites" on the leftmost vertical Azure portal menu, and then click on "origin" to open the origin resource group). You will see the following:

<img src="https://github.com/cealsair/MicroProfileThorntailOnAzure/blob/master/images/14_OriginResourceGroup.png" width="500">

On the top right of the origin resource group window, you will see a heading "Deployments".  Click on "1 Succeeded" under this heading to see the deployments:

<img src="https://github.com/cealsair/MicroProfileThorntailOnAzure/blob/master/images/15_OriginDeployments.png" width="500">

Now, click on the "Microsoft.Template" link to display the contents of the template.  Then click on the "Outputs" to see the URL of the OpenShift Origin console:

<img src="https://github.com/cealsair/MicroProfileThorntailOnAzure/blob/master/images/16_OriginOutputs.png" width="500">

At this point, copy the string from the "ORIGINCONSOLE" field, open a browser window and paste the string in the Address field. If your browser warns you about the site being insecure, go ahead and continue to the insecure site.  At this point, you should see the login prompt to log in to the all-in-one OpenShift Origin cluster:

<img src="https://github.com/cealsair/MicroProfileThorntailOnAzure/blob/master/images/17_OpenShiftConsoleLogin" width="500">

For Username and Password, the "Admin User" and "Admin Password" you supplied in the template above. Click on "Log In" and you should see:

<img src="https://github.com/cealsair/MicroProfileThorntailOnAzure/blob/master/images/18_OpenShiftConsole" width="500">

# C. Using the Red Hat OpenShift Application Runtimes Launcher to generate the WildFly Swarm sample project 
