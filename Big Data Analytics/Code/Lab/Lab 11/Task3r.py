# Abdul Saboor
# 20L-1113
# BDS-4A
# Task 2 Reducer

# count on how many days individually has each person written
# Expected sample output
# Thursday < Ali 1>
# Wednesday <Ali 2>

import sys
current_word = None  # tally for current word
current_day = None  # tally for current day
current_count = 0  # Word count
word = None  # temporary checking variable
for line in sys.stdin:  # looping for every line
    line = line.strip()  # stripping extra spaces
    word, day = line.split('\t', 1)  # spliitting on mapped basis
    count = 1
    if (current_word == word and current_day == day):  # if same as previous word
        current_count += count  # adding to word count
    else:  # if not same as previous
        if current_word:  # if not empty
            # write result to STDOUT
            sys.stdout.write(current_day+'\t'+current_word +
                             '\t' + str(current_count)+'\n')
        current_count = count  # resetting count
        current_day = day  # setting day
        current_word = word  # resetting tally word to current word
sys.stdout.write(current_day+'\t'+current_word +
                 '\t' + str(current_count)+'\n')  # outputting last word
