# Abdul Saboor
# 20L-1113
# BDS-4A
# Task 2 Reducer

# Count how many total times has each person written
# Expected sample output
# Ali 3
import sys
current_word = None  # tally for current word
current_count = 0  # Word count
word = None  # temporary checking variable
for line in sys.stdin:  # looping for every line
    line = line.strip()  # stripping extra spaces
    word, count = line.split('\t', 1)  # spliitting on mapped basis
    try:  # converting count to integer if possible
        count = int(count)
    except ValueError:
        continue
    if current_word == word:  # if same as previous word
        current_count += count  # adding to word count
    else:  # if not same as previous
        if current_word:  # if not empty
            # write result to STDOUT
            sys.stdout.write(current_word+'\t'+str(current_count)+'\n')
        current_count = count  # resetting count
        current_word = word  # resetting tally word to current word
sys.stdout.write(current_word+'\t'+str(current_count) +
                 '\n')  # outputting last word
