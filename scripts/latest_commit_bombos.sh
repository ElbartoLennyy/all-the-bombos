#!/bin/bash

# Get the list of new Bombos
latest_Bombos=$(git diff-tree --no-commit-id --name-only -r HEAD HEAD~)

# Convert latest_files to an array
IFS=$'\n' read -rd '' -a latest_Bombos_array <<<"$latest_Bombos"

# Delete all Bombos in the all-the-Bombo directory that are not in the latest commit
for file in $(find ./all-the-Bombo -type f -name '*.png'); do
    relative_Bombos=${file#./}
    if [[ ! "${latest_Bombos_array[*]}" =~ "${relative_Bombo}" ]]; then
        rm "$file"
    fi
done

echo "Only Bombos from the latest commit remain."

