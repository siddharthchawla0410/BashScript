KEY=$GIT_KEY


agent_output=$(ssh-agent -s)
echo "$agent_output"
eval "$agent_output"

ssh-add $KEY
