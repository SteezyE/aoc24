#!/bin/bash

Y=$(date '+%Y')
D=$(date '+%d')
mkdir -p $D && cd $D
curl --cookie ../cookies.txt https://adventofcode.com/$Y/day/$(date '+%-d')/input -o "in"
echo -e '#!/usr/bin/ruby\n\n' | tee a.rb b.rb > /dev/null
chmod +x a.rb b.rb
