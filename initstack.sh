#!/bin/bash

echo Please enter aws profile name. Then AWS client will ask for your API key and secret and will be passed directly to AWS. Contentpub does not read your api key and secret keys

read awsprofilename

aws configure --profile $awsprofilename

cd terraform

terraform init

pwd

terraform apply -var-file="staging.tfvars"

# go back to root folder and init amplify there
cd ..

amplify init

amplify add api

# get the name before running the shell, use it here instead of javathlon

cp schema.graphql amplify/backend/api/javathlon

amplify push



##prints graphql instances, this should be written back into a file

# run model generation here again
# get pull command first

amplify codegen models


amplify import auth

amplify push


amplify pull