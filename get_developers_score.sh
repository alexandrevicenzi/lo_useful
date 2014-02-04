#!/bin/bash
# get_developers_score.sh

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.

# This script was made to list how many some people already changed in LO

for name in \
		"Alexandre Vicenzi" \
		"Anderson Roberto" \
		"José Guilherme Vanz" \
		"Marcos Paulo de Souza" \
		"Olivier Hallot" \
		"Ricardo Montania" \
		"Rodolfo Ribeiro Gomes"
do
	echo $name": $(git log --oneline --author="$name" | wc -l) commits"
	git log --numstat --oneline --pretty="%H" --author="$name" | awk 'NF==3 {plus+=$1; minus+=$2}; END \
								{printf("+%d, -%d\n", plus, minus)}'

done
