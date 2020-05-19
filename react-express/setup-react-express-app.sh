#!/bin/bash

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

# Install husky and lint-staged to prevent lint from being committed
yarn add husky lint-staged --dev

# If you are using vscode and has prettier installed
cp $SCRIPT_DIR"/.prettierrc-template" ".prettierrc"

# Install redux, thunk, react-act
yarn add redux react-redux redux-thunk react-act