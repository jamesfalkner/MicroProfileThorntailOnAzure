# Eclipse MicroProfile (Thorntail/WildFly Swarm) on Azure

**NOTE 1: Use Chrome or Firefox for the instructions below. They will not work with Safari**

**NOTE 2: This template creates an ephemeral instance of OpenShift Origin. You are responsible for backing up any data that you want to save while using this instance**

Congratulations! You have just received your free Azure trial pass to try Eclipse MicroProfile on Azure.

These instructions are grouped in four sections:

[**A. Redeeming your Azure Pass**](https://github.com/jamesfalkner/MicroProfileThorntailOnAzure/blob/master/README.md#a-redeeming-your-azure-pass)

[**B. Instantiating an all-in-one OpenShift Origin cluster on Azure**](https://github.com/jamesfalkner/MicroProfileThorntailOnAzure/blob/master/README.md#b-instantiating-an-all-in-one-openshift-origin-cluster-on-azure)

[**C. Using the Red Hat OpenShift Application Runtimes Launcher to generate the WildFly Swarm sample project**](https://github.com/jamesfalkner/MicroProfileThorntailOnAzure/blob/master/README.md#c-using-the-red-hat-openshift-application-runtimes-launcher-to-generate-the-wildfly-swarm-sample-project)

[**D. Deploying sample project to all-in-one OpenShift Origin cluster on Azure**](https://github.com/jamesfalkner/MicroProfileThorntailOnAzure/blob/master/README.md#d-deploying-sample-project-to-all-in-one-openshift-origin-cluster-on-azure)

# A. Redeeming your Azure Pass

1. Open a browser and navigate to: www.microsoftazurepass.com and click on the "Start" button

<img src="https://github.com/jamesfalkner/MicroProfileThorntailOnAzure/blob/master/images/1_RedeemFreeAzureCreditsStart.png" width="500">

2. On the following screen, enter your Microsoft account credential, e.g. hotmail email or Skype email or LinkedIn email:

<img src="https://github.com/jamesfalkner/MicroProfileThorntailOnAzure/blob/master/images/2_RedeemMSLogin.png" width="300">

3. Then enter your corresponding password. If this is your personal computer, I strongly recommend you click on "Keep me signed in":

<img src="https://github.com/jamesfalkner/MicroProfileThorntailOnAzure/blob/master/images/3_RedeemEnterPass.png" width="300">

4. If the next "Updating Terms" screen is displayed, just click on the "Next" button:

<img src="https://github.com/jamesfalkner/MicroProfileThorntailOnAzure/blob/master/images/4_RedeemUpdatingTerms.png" width="300">

5. Then click on the "Yes" button in the "Stay signed in?" dialog:

<img src="https://github.com/jamesfalkner/MicroProfileThorntailOnAzure/blob/master/images/5_RedeemStaySignedIn.png" width="300">

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

<img src="https://github.com/jamesfalkner/MicroProfileThorntailOnAzure/blob/master/images/12_OriginDeployInProgress.png" width="500">

The deployment will take 15-20 minutes. Once completed, the notification will display:

<img src="https://github.com/jamesfalkner/MicroProfileThorntailOnAzure/blob/master/images/13_DeploySucceeded.png" width="500">

Click on "Go to resource group" button in the notification above to open up the window for the origin resource group (or you can also click on the "Resource groups" under "Favorites" on the leftmost vertical Azure portal menu, and then [click](images/36_AzureResourceGroups.png) on "origin" to open the origin resource group). You will see the following:

<img src="https://github.com/jamesfalkner/MicroProfileThorntailOnAzure/blob/master/images/14_OriginResourceGroup.png" width="800">

On the top right of the origin resource group window, you will see a heading "Deployments".  Click on "1 Succeeded" under this heading to see the deployments:

<img src="https://github.com/jamesfalkner/MicroProfileThorntailOnAzure/blob/master/images/15_OriginDeployments.png" width="800">

Now, click on the "Microsoft.Template" link to display the contents of the template.  Then click on the "Outputs" to see the URL of the OpenShift Origin console:

<img src="https://github.com/jamesfalkner/MicroProfileThorntailOnAzure/blob/master/images/16_OriginOutputs.png" width="800">

At this point, copy the string from the "ORIGINCONSOLE" field, open a browser window and paste the string in the Address field. If your browser warns you about the site being insecure, go ahead and continue to the insecure site.  At this point, you should see the login prompt to log in to the all-in-one OpenShift Origin cluster:

<img src="https://github.com/jamesfalkner/MicroProfileThorntailOnAzure/blob/master/images/17_OpenShiftConsoleLogin.png" width="800">

For Username and Password, the "Admin User" and "Admin Password" you supplied in the template above. Click on "Log In" and you should see:

<img src="https://github.com/jamesfalkner/MicroProfileThorntailOnAzure/blob/master/images/18_OpenShiftConsole.png" width="800">

# C. Using the Red Hat OpenShift Application Runtimes Launcher to generate the WildFly Swarm sample project 

1. Go to https://developers.redhat.com/launch

<img src="https://github.com/jamesfalkner/MicroProfileThorntailOnAzure/blob/master/images/19_LauncherLanding.png" width="800">

2. Click on "LAUNCH YOUR PROJECT" button to launch a mission 

<img src="https://github.com/jamesfalkner/MicroProfileThorntailOnAzure/blob/master/images/20_MissionScreen.png" width="800">

3. At this point, if not already logged in, you need to click on the "Log In or Register" button. Enter your valid credentials as indicated on window and click on "LOG IN" button (if you don't have an account, click on "Create one now". Once you create your account, return to this window and log in with your newly created credentials)

<img src="https://github.com/jamesfalkner/MicroProfileThorntailOnAzure/blob/master/images/21_MissionLogin.png" width="500">

4. On this next screen, click on "I will build and run locally"

<img src="https://github.com/jamesfalkner/MicroProfileThorntailOnAzure/blob/master/images/22_MissionBuildAndRunLocally.png" width="800">

5. In the missions screen, scroll down until you see the mission "REST API Level 0". Check on the "REST API Level 0" mission and click on the "Next" button

<img src="https://github.com/jamesfalkner/MicroProfileThorntailOnAzure/blob/master/images/23_MissionRESTAPI.png" width="500">

6. Select the "WildFly Swarm" runtime tile and then click the "Next" button

<img src="https://github.com/jamesfalkner/MicroProfileThorntailOnAzure/blob/master/images/24_MissionSelectBooster.png" width="800">

7. In the "Project Info" window, accept all the defaults and click on the "Next" button

<img src="https://github.com/jamesfalkner/MicroProfileThorntailOnAzure/blob/master/images/25_MissionProjInfo.png" width="800">
8. In the Review window, click on the "Download as ZIP File" button.  This will download a ZIP file named "booster-rest-http-wildfly-swarm.zip" to your Downloads directory on your laptop/desktop

<img src="https://github.com/jamesfalkner/MicroProfileThorntailOnAzure/blob/master/images/26_MissionDownloadZIP.png" width="800">

9. As the final step in this section, you will see the "Next Steps" screen

<img src="https://github.com/jamesfalkner/MicroProfileThorntailOnAzure/blob/master/images/27_MissionNextSteps.png" width="800">

You have completed your first "REST API Level 0" mission and created and downloaded its associated Wildfly Swarm project to your laptop/desktop.

# D. Deploying sample project to all-in-one OpenShift Origin cluster on Azure

**Pre-requisite 1: You need to have "oc" installed on your laptop/desktop for the following instructions to work. Please refer to [Installing the OpenShift Origin CLI](https://docs.openshift.org/latest/cli_reference/get_started_cli.html) if you need to do so.**

**Pre-requisite 2: You also need to have Maven installed on your laptop/desktop by using dnf/yum or by using the instructions provided at [Installing Apache Maven](https://maven.apache.org/install.html).**

**Note: during this section, if you see a notification saying ["Server connection interrupted"](https://github.com/jamesfalkner/MicroProfileThorntailOnAzure/blob/master/images/35_ServerConnInterrupted.png) pop up on the OpenShift Origin console, just dismiss it by clicking on the X**

1. Unzip the downloaded ZIP file from the previous section into a directory of your choosing. For the runing example below, the ZIP file was unzipped into a directory named "Downloads". Change directory to "booster-rest-http-wildfly-swarm" and "oc login" to the all-in-one OpenShift Origin cluster running on Azure (the URL for the cluster is the string from the "ORIGINCONSOLE" field from step 2 in section B above):
<img src="https://github.com/jamesfalkner/MicroProfileThorntailOnAzure/blob/master/images/28_CdAndOClogin.png" width="800">

2. Create a new project in the OpenShift Origin cluster called "my-wfs-proj". Creating the project will also set your working project to it. Then issue the command to build, create the container images, deploy and run the project to the cluster: "mvn clean fabric8:deploy -Popenshift", as follows:

<img src="https://github.com/jamesfalkner/MicroProfileThorntailOnAzure/blob/master/images/29_CreateProjAndFabric8.png" width="800">

3. After about 15 minutes, you will see the following lines indicating its successful build and deployment:

<img src="https://github.com/jamesfalkner/MicroProfileThorntailOnAzure/blob/master/images/30_BuildDeployFinished.png" width="800">

4. Go back to your browser tab with the OpenShift Origin console and refresh it.  You will now see the "my-wfs-proj" project listed under the "My Projects" panel.

<img src="https://github.com/jamesfalkner/MicroProfileThorntailOnAzure/blob/master/images/31_ProjOnOpenShiftConsole.png" width="800">

5. Click on the name of "my-wfs-proj" to open the following window that displays its route to the right of the application name.  A route is the external address to access the project user interface:

<img src="https://github.com/jamesfalkner/MicroProfileThorntailOnAzure/blob/master/images/32_ProjRoute.png" width="800">

6. Click on the route (long string that starts with "http:" and ends with ".nip.io". This will open a browser tab with the project "Greeting Service" landing page:

<img src="https://github.com/jamesfalkner/MicroProfileThorntailOnAzure/blob/master/images/33_GreetingSvcLandingPage.png" width="800">

7. Enter your name in the field "Name" and click the "Invoke" button.  Under the "Result:" heading, you will see a message that says: "Hello, <name>!", as follows:

<img src="https://github.com/jamesfalkner/MicroProfileThorntailOnAzure/blob/master/images/34_GreetingSvcInvoked.png" width="800">

# Conclusion

Congratulations! You have successfully used the Red Hat OpenShift Application Runtimes Launcher to create a sample WildFly Swarm project, which you then deployed to an all-in-one OpenShift Origin cluster running on Azure.

If you would like to inspect the project source code, please use an IDE of your choosing, e.g. Eclipse, IntelliJ, and open the project, which, in the example above, is located at directory ${HOME}/Downloads/booster-rest-http-wildfly-swarm.

Lastly, to learn more, go to:

[Red Hat OpenShift Application Runtimes](https://developers.redhat.com/products/rhoar/overview/)

[WildFly Swarm/Thortail](http://wildfly-swarm.io/)

[Azure](https://azure.microsoft.com/en-us/)
