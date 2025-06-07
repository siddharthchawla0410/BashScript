

KEY=$GIT_KEY


agent_output=$(ssh-agent -s)
echo "$agent_output"
eval "$agent_output"

ssh-add $KEY

# When we do not wnat to set upstream
git push origin master

#When we want to set upstream
#git push -u origin master
#we can unset the upstream using following command
#git branch --unset-upstream

# Kill ssh-agent
echo "Kill ssh-agent"
ssh-agent -k
