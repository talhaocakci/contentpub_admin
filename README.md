
#  contentpub_admin

  

Initialize ContentPub Admin instance on AWS account that you own.
Prepares your AWS environment and gives you the preferences to use in your ContentPub client.

  

##  Getting Started

### Configure your AWS account
Create an AWS account or use an existing one.
Create an API key in your account and add this configuration into your aws configuration via
https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html

    aws configure --profile yourprofilenametouselateron

### Pull the admin repo 
    git clone https://github.com/talhaocakci/contentpub_admin.git


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

Use Cognito as default authorizer, use the previously generated user pool.
Also configure IAM authorizer
  
get the name before running the shell, use it here instead of {your_project_name}

  

cp schema.graphql amplify/backend/api/{your_project_name}

  

amplify push

  prints graphql instances, this should be written back into a file

  run model generation here again
get pull command first
amplify codegen models
amplify import auth
amplify push

amplify pull