#!/bin/bash

echo Please enter aws profile name. Then AWS client will ask for your API key and secret and will be passed directly to AWS. Contentpub does not read your api key and secret keys

read awsprofilename

aws configure --profile $awsprofilename

echo Please enter a unique project name such as "projectname.com"

read projectname

cd terraform/core-infra

terraform init


terraform apply -var="project_name=$projectname" -var="aws_profile=$awsprofilename"

terraform apply -var="project_name=javawebdevelopment.com" -var="aws_profile=javathlon" -var="app_url=www.javawebdevelopment.com" -var="custom_domain=www.javawebdevelopment.com" -var="appsync_api_id=jj556jjncbfanh2fj6dknj7uyi"  -var="aws_region=eu-central-1"  

##
## run in terraform/deployment folder
##terraform apply -var="project_name=$projectname"
