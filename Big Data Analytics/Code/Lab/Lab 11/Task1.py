# Abdul Saboor
# 20L-1113
# BDS-4A

# Remove punctuation marks from all text and also convert text into lower case using map reducer
# Expected sample output
# ali works on sunday

import sys  # importing library for reading from stdin
for line in sys.stdin:  # looping for every line from stdin
    for char in line:  # looping for every character in line
        if (char not in ['.', '!', '-']):  # checking if not punctuation
            sys.stdout.write(char.lower())  # printing if not char
        # no printing if punctuation
