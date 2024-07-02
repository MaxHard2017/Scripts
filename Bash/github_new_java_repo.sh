#!/bin/bash
# more parameters on https://docs.github.com/en/rest/repos/repos?apiVersion=2022-11-28#create-a-repository-for-the-authenticated-user
# Check proper token after Authorization: Bearer
# The fine-grained token must have the following permission set: "Administration" repository permissions (write)
# Set "name":"<new_repo_name>"


# check for insufficient number of arguments
if [ $# -lt 2 ]
	then
	echo "Repository name and token file path must be specifyed"
	exit 1
fi

repo_name=$1
token_file=$2

# Load token from file
if [ -e $token_file ]
then
	while IFS= read -r token
	do
  		echo
	done < $token_file
else 
	echo "file $token_file not found!"
	exit 0
fi

# making repo
echo Let\'s make GitHub repository whith name $repo_name
curl -L \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $token" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/user/repos \
  -d '{"name":"'$repo_name'","description":"CLI made repository","homepage":"https://","private":false,"has_issues":true,"has_projects":true,"has_wiki":true,"has_discussions":false,"auto_init":true,"gitignore_template":"Java","license_template":"CC-BY-4.0","has_downloads":true,"is_template":false}' \
  -k