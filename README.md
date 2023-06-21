
#  contentpub_admin

  

Initialize ContentPub Admin instance on AWS account that you own.
Prepares your AWS environment and gives you the preferences to use in your ContentPub client.

  

##  Getting Started

### Tooling

1. Install terraform
    brew install terraform

2. Install AWS CLI
    brew install awscli


### Configure your AWS account
Create an AWS account or use an existing one.
Create an API key in your account and add this configuration into your aws configuration via
https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html

    aws configure --profile yourprofilenametouselateron

### Create AWS congnito
    Go to terraform prep folder
    cd terraform/prep
    terraform init
    
    git clone https://github.com/talhaocakci/contentpub_admin.git
    terraform apply -var="project_name=javawebdevelopment.com" -var="aws_profile=javathlon" -var="aws_region=eu-central-1"

### Creating AWS Amplify configuration
This section will prepare your AWS Amplify and ContentPub configuration. Resulting files will be provided to your ContentPub Client instance.

Initialize amplify folder in your local repo and connect it to Amplify instance in your AWS account.

    amplify init --app https://github.com/talhaocakci/contentpub_admin

  Add Graphql APIs via following command. All sources have already been created while initializing the infrastructure. This step only configures your Amplify instance and integrates to your codebase.

    amplify add api

Select GraphQL as API type
Change default authorizer to Cognito. If you have only one user pool (the one you created in the first step), it will be picked. Otherwise pick that one.
Also configure IAM authorizer by selecting "yes" when "Do you wan to configure other authorizers" is prompted and select IAM.
  
get the name before running the shell, use it here instead of {your_project_name}

    Copy schema.graphql in the project root into amplify/backend/api/{your_project_name}

amplify push

  prints graphql instances, this should be written back into a file

  run model generation here again
get pull command first
amplify codegen models
amplify import auth
amplify push

amplify pull


### Creating Rest of the AWS infrastructure
Run following sh command to create 

    sh initstack.sh

This command will ask you the profile name you created before. Provide the information when requested. ContentPub does not ask for your AWS secrets, they are securely managed in your local machine.