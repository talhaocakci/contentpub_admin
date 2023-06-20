#!/bin/bash

echo Please enter aws profile name. Then AWS client will ask for your API key and secret and will be passed directly to AWS. Contentpub does not read your api key and secret keys

read awsprofilename

aws configure --profile $awsprofilename

echo Please enter a unique project name such as "projectname.com"

read projectname

cd terraform/infra

terraform init


terraform apply -var-file="staging.tfvars" -var="project_name=$projectname" -var="aws_profile=$awsprofilename"

# go back to root folder and init amplify there
cd ..
cd ..

echo "{\"project\":\"$projectname\"}" >> assets/projectconfiguration.json

amplify init

amplify add api

# get the name before running the shell, use it here instead of javathlon

rm amplify/backend/api/$projectname/schema.graphql
cp schema.graphql amplify/backend/api/$projectname/schema.graphql

amplify push



##prints graphql instances, this should be written back into a file

# run model generation here again
# get pull command first

amplify codegen models


amplify import auth

amplify push


amplify pull

export AWS_PROFILE=put_your_profile_name_here

flutter build web --release

cp -a build/web/. terraform/deployment/artifacts/

## run in terraform/deployment folder
terraform apply -var="project_name=$projectname"
