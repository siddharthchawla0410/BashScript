KEY=/root/.ssh/id_github


agent_output=$(ssh-agent -s)
echo "$agent_output"
eval "$agent_output"

ssh-add $KEY
