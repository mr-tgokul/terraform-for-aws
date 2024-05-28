#!/bin/bash

# Variables
REPO_DIR="C:/Users/GT082376/Important/Studies/DevOps/DK/terraform-for-aws" # Change this to your local repository path
COMMIT_MESSAGE="Create Subnet in Existing VPC" # Customize your commit message
BRANCH_NAME="main" # Change to the branch you want to push to

# Navigate to the repository directory
cd "$REPO_DIR" || { echo "Repository directory not found"; exit 1; }

# Add all changes to the staging area
git add .

# Commit changes
git commit -m "$COMMIT_MESSAGE"

# Push changes to the remote repository
git push origin "$BRANCH_NAME"

# Check if the push was successful
if [ $? -eq 0 ]; then
    echo "Changes pushed to GitHub successfully."
else
    echo "Failed to push changes to GitHub."
    exit 1
fi
