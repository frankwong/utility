#!/bin/bash

# How to use
# Go to the directory you want to create the new project
# Run the script with the project name
# Example: set-react-express-app.sh my-project
# Once installation succeeds, run the following in separate terminals
# Start express api server
# node server.js
# Start React client app
# yarn start

PROJECT=$1

npx create-react-app $PROJECT --typescript
yarn add express

# mkdir $PROJECT
SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"
cp $SCRIPT_DIR"/server-template.js" $PROJECT"/server.js"
