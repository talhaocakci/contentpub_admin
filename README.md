
#  contentpub_admin

  

Initialize ContentPub Admin instance on AWS account that you own.
Prepares your AWS environment and gives you the preferences to use in your ContentPub client.

  

##  Getting Started

### Configure your AWS account
Create an AWS account or use an existing one.
Create an API key in your account and add this configuration into your aws configuration via

    aws configure --profile yourprofilenametouselateron

### Creating local repo
Create an empty directory
Move to this directory
mkdir myprojectname
cd myprojectname

### Creating AWS infrastructure
Run following sh command to create 

    sh initstack.sh

This command will ask you the profile name you created before. Provide the information when requested. ContentPub does not ask for your AWS secrets, they are securely managed in your local machine.

### Creating AWS Amplify configuration
This section will prepare your AWS Amplify and ContentPub configuration. Resulting files will be provided to your ContentPub Client instance.

Initialize amplify folder in your local repo and connect it to Amplify instance in your AWS account.

    amplify init --app https://github.com/talhaocakci/contentpub_admin

  Add Graphql APIs via following command. All sources have already been created while initializing the infrastructure. This step only configures your Amplify instance and integrates to your codebase.

    amplify add api

  
get the name before running the shell, use it here instead of javathlon

  

cp schema.graphql amplify/backend/api/javathlon

  

amplify push

  prints graphql instances, this should be written back into a file

  run model generation here again
get pull command first
amplify codegen models
amplify import auth
amplify push

  
  

amplify pull