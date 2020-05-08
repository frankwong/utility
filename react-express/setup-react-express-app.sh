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

# Manual steps after everything runs
# In package.json > scripts, add
# "lint": "eslint '*/**/*.{js,ts,tsx}' --quiet --fix"

PROJECT=$1

npx create-react-app $PROJECT --typescript

# Setup server.js for Express
SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"
cp $SCRIPT_DIR"/server-template.js" $PROJECT"/server.js"

# Install Express
cd $PROJECT
yarn add express

# Install enzyme for shallow rendering in tests
yarn add enzyme enzyme-adapter-react-16 react-test-renderer --dev
cat $SCRIPT_DIR"/setupTests-template.js" >> "src/setupTests.ts"

# Install Eslint
yarn add @typescript-eslint/eslint-plugin @typescript-eslint/parser eslint-plugin-react --dev
cp $SCRIPT_DIR"/.eslintrc-template.js" ".eslintrc.js"
