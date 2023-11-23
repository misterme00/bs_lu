#!/bin/bash

# Define the aliases
aliases_to_append=(
    "alias pac='python3 -m venv venv && source venv/bin/activate'"
    "alias pa='source venv/bin/activate'"
    "alias dpa='docker ps -a'"
    "alias pir='pip install -r requirements.txt'"
    # Add more aliases as needed
)

# Specify the location of the bashrc file
bashrc_file=~/.bashrc

# Check if the bashrc file exists
if [ -e "$bashrc_file" ]; then
    # Backup the current bashrc file
    cp "$bashrc_file" "$bashrc_file.bak"
    
    # Append aliases to the bashrc file
    for alias_line in "${aliases_to_append[@]}"; do
        if ! grep -qF "$alias_line" "$bashrc_file"; then
            echo "$alias_line" >> "$bashrc_file"
            echo "Appended: $alias_line"
        else
            echo "Alias already exists: $alias_line"
        fi
    done
    
    # Source the bashrc file to apply changes
    source "$bashrc_file"
    
    echo "Aliases added to $bashrc_file and sourced."
else
    echo "Error: $bashrc_file does not exist."
fi
