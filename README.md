# Eclipse MicroProfile (WildFly Swarm) on Azure

**NOTE: Use Chrome or Firefox for the instructions below. They will not work with Safari**

Congratulations! You have just received your free Azure trial pass to try Eclipse MicroProfile on Azure.

Follow these instructions to set up and run MicroProfile (Thorntail) on OpenShift on Azure:

1. Open a browser and navigate to: www.microsoftazurepass.com and click on the "Start" button

![redeem-1](images/1_RedeemFreeAzureCreditsStart.png)

2. On the following screen, enter your Microsoft account credential, e.g. hotmail email or Skype email or LinkedIn email:

![redeem-2](images/2_RedeemMSLogin.png)

3. Then enter your corresponding password:

![redeem-3](images/3_RedeemEnterPass.png)

4. If the next "Updating Terms" screen is displayed, just click on the "Next" button:

![redeem-4](images/4_RedeemUpdatingTerms.png)

5. Then click on the button for your preference to stay signed in or not:

![redeem-5](images/5_RedeemStaySignedIn.png)

6. On this screen, click on the "Confirm Microsoft account" button

![redeem-6](images/6_RedeemConfirmMSacct.png)

7. Enter your Promo Code from your coupon and click on "Claim your Promo Code" button:

![redeem-7](images/7_RedeemEnterPromoCode.png)

8. Once your coupon number is accepted, click on the "Activate" button:

![redeem-8](images/8_RedeemThankYouAndActivate.png)

9. Follow these sub-steps to create an all-in-one OpenShift Origin cluster:
#### Create a Single VM Origin deployment using the Azure Portal
Please ensure that an account has already been configured before clicking the button below.


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fcealsair%2FMicroProfileOnAzure%2Fmaster%2Fallinone.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

------

This template deploys OpenShift Origin on Azure.

![Console](images/parameters.png)


#### Subscription
Accept the default subscription ID value.

#### Resource Group
Select "create new" resource group if one does not currently exist.

#### Location
The geographic location in which to deploy OpenShift Origin.

#### Admin User
Supply a username which will be used for both SSH access and for the OpenShift Origin web console.

#### Admin Password
Supply a password which will be used for the Origin web console.

#### Ssh Key Data
You will need a SSH RSA public key for access if one currently does not exist on your system. Please supply your Public SSH key only. 
For example, in Linux the key can be located at ~/.ssh/id_rsa.pub

##### SSH Key Generation (Optiona)

1. [Windows](ssh_windows.md)
2. [Linux](ssh_linux.md)
3. [Mac](ssh_mac.md)

#### Vm Size
Specify a VM size. A default value is provided. If another size or type of vm is required ensure that the Location contains that instance type.

Once all of these values are set, then check the box to "Agree to the terms and conditions" and then click the Purchase button.

#### Deployment
A notification will pop up in the top right notifying you of the deployment. Click the notifications icon and then click "Deployment in progress...". The deployment will take 15-20 minutes. Once completed select "Outputs" to receive the URL of the OpenShift Origin console and SSH information.

![OutputsToReceive](images/outputs.png)

#### Thanks to the following individuals for the base template:
Daniel Falkner
Glenn West
Harold Wong
Ivan McKinley
