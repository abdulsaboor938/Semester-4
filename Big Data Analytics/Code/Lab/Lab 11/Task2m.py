# Abdul Saboor
# 20L-1113
# BDS-4A
# Task 2 Mapper

# Count how many total times has each person written
# Expected sample output
# Ali 3

import sys  # importing library for reading from stdin
for line in sys.stdin:  # looping for every line from stdin
    line = line.strip()  # removing extra spaces
    line = line.split()  # splitting into individual words
    for i in line:  # looping for each word
        sys.stdout.write(i+'\t1\n')  # outputting to std out
        # no printing if punctuation
