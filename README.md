
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

Import existing user pools into Amplify and select the one ending with "mobile"

    amplify import auth

  Add Graphql APIs via following command. All sources have already been created while initializing the infrastructure. This step only configures your Amplify instance and integrates to your codebase.

    amplify add api

Select GraphQL as API type
Change default authorizer to Cognito. If you have only one user pool (the one you created in the first step), it will be picked. Otherwise pick that one.
Also configure IAM authorizer by selecting "yes" when "Do you wan to configure other authorizers" is prompted and select IAM.
  
get the name before running the shell, use it here instead of {your_project_name}

    Copy schema.graphql in the project root into amplify/backend/api/{your_project_name}

Push the amplify settings, this will generate necessary AWS components namely, Appsync API, DynamoDB tables etc...
   
    amplify push

run model generation on project root, you will see models under lib folder.

    amplify pull
    amplify codegen models


### Creating Rest of the AWS infrastructure
Run following sh command to create 

    terraform apply -var="project_name=javawebdevelopmentcom" -var="aws_profile=javathlon" -var="app_url=http://www.javawebdevelopment.com" -var="custom_domain=www.javawebdevelopment.com" 
     -var="graphql_endpoint_id=4gri4izgmvbuxffnfvxbj35cd4" -var="appsync_api_id=cwhapzkma5aq7ijjhtuncbaioa"  -var="aws_region=eu-central-1"

This command will ask you the profile name you created before. Provide the information when requested. ContentPub does not ask for your AWS secrets, they are securely managed in your local machine.

Create project configuration file:

    echo "{\"project\":\"$yourprojectname\"}" >> assets/projectconfiguration.json 

Replace assets/projectconfiguration.json file with real values

    {
    "project":"yourprojectname.com",
    "environment" : "production or staging",
    "appsyncId" : "Appsync Id in AWS console",
    "apigatewayId" : "API Gateway Id in AWS console",
    "region" : "eu-central-1"
    }


### Build Flutter project:

    flutter build web --release


### Stripe enablement

    cd /terraform/stripe

    terraform apply -var="aws_profile=javathlon" -var="aws_region=eu-central-1" -var-file="stripe.tfvars" -var="project_name=javawebdevelopmentcom"  -var="api_gateway_id=52tguxv5x3" -var="graphql_endpoint_id=4gri4izgmvbuxffnfvxbj35cd4" -var="appsync_api_id=cwhapzkma5aq7ijjhtuncbaioa"    -var="app_url=http://www.javawebdevelopment.com"

### Deployment

Copy build folder into artifacts    
    
    cp -a build/web/. terraform/deployment/artifacts/

Run terraform under /terraform/deployment

    terraform apply -var="aws_profile=javathlon" -var="aws_region=eu-central-1"  -var="app_local_folder=/Users/tocakci/projects/contentpub_client" -var="project_name=javawebdevelopment.com"

### Create initial user

    cd initialuser
    terraform apply -var="aws_profile=javathlon" -var="aws_region=eu-central-1" -var="user_email=yourusername@mailprovider.com"


 ### HTTPS and CloudFront distribution
 Create a SSL certificate with AWS certificate manager
 Create a Cloudfront distribution for www and admin
 Point to the Cloudfron distribution from Route53 CNAME record   
 Create an invalidation with "/*" path after every deployment