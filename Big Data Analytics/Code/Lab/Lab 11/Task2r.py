import sys
current_word = None
current_count = 0
word = None
for line in sys.stdin:
    line = line.strip()
    word, count = line.split('\t', 1)
    try:
        count = int(count)
    except ValueError:
        continue
    if current_word == word:
        current_count += count
    else:
        if current_word:
            sys.stdout.write(current_word+'\t'+str(current_count)+'\n')
        current_count = count
        current_word = word
sys.stdout.write(current_word+'\t'+str(current_count) +
                 '\n')
