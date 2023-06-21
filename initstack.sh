#!/bin/bash

echo Please enter aws profile name. Then AWS client will ask for your API key and secret and will be passed directly to AWS. Contentpub does not read your api key and secret keys

read awsprofilename

aws configure --profile $awsprofilename

echo Please enter a unique project name such as "projectname.com"

read projectname

cd terraform/infra

terraform init


terraform apply -var-file="staging.tfvars" -var="project_name=$projectname" -var="aws_profile=$awsprofilename"





## run in terraform/deployment folder
terraform apply -var="project_name=$projectname"
