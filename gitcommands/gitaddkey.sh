KEY=$GIT_KEY

# Clear any old ssh-agent
ssh-agent -k 2>/dev/null
agent_output=$(ssh-agent -s)
echo "$agent_output"
eval "$agent_output"

# This will clear any old key which is loaded
ssh-add -D
ssh-add $KEY
