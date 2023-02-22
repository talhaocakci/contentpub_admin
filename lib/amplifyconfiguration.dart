const amplifyconfig = ''' {
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "api": {
        "plugins": {
            "awsAPIPlugin": {
                "javathlon": {
                    "endpointType": "GraphQL",
                    "endpoint": "https://igjkkti7svewhfgi7jg4eruda4.appsync-api.us-east-1.amazonaws.com/graphql",
                    "region": "us-east-1",
                    "authorizationType": "API_KEY",
                    "apiKey": "da2-b3myb3llnbdofdyb4fif5g5r2a"
                }
            }
        }
    },
    "auth": {
        "plugins": {
            "awsCognitoAuthPlugin": {
                "UserAgent": "aws-amplify-cli/0.1.0",
                "Version": "0.1.0",
                "IdentityManager": {
                    "Default": {}
                },
                "AppSync": {
                    "Default": {
                        "ApiUrl": "https://igjkkti7svewhfgi7jg4eruda4.appsync-api.us-east-1.amazonaws.com/graphql",
                        "Region": "us-east-1",
                        "AuthMode": "API_KEY",
                        "ApiKey": "da2-b3myb3llnbdofdyb4fif5g5r2a",
                        "ClientDatabasePrefix": "javathlon_API_KEY"
                    }
                },
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "us-east-1_tYANAb3uF",
                        "AppClientId": "1oed9jdgudbosn5ghgnnkl1r4a",
                        "AppClientSecret": "1ge2avfhe4uc43a75ta146o1l4mrk7k5vi94069rsaj1ckpeub38",
                        "Region": "us-east-1"
                    }
                },
                "Auth": {
                    "Default": {
                        "authenticationFlowType": "USER_SRP_AUTH",
                        "socialProviders": [],
                        "usernameAttributes": [
                            "EMAIL"
                        ],
                        "signupAttributes": [
                            "EMAIL"
                        ],
                        "passwordProtectionSettings": {
                            "passwordPolicyMinLength": 6,
                            "passwordPolicyCharacters": []
                        },
                        "mfaConfiguration": "OFF",
                        "mfaTypes": [],
                        "verificationMechanisms": [
                            "EMAIL"
                        ]
                    }
                }
            }
        }
    }
}''';