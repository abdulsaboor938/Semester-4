# Abdul Saboor
# 20L-1113
# BDS-4A
# Task 4 mapper

# Do cascading of files generated from task 2 and task 3 and give resultant output such that

# Person – day – total working he has done on this day day – total working he has done on all days

# Expected sample output
# Ali <Thursday 1 3>
# Ali <Wednesday 2 3>

# store first half in an dictionery
# do operation for second half

# now iterate for remaining and get total from dictionery

import sys
data1 = []
data = {}
for line in sys.stdin:
    line = line.strip().split('\t')
    try:
        k, v = line
        data.update({k, v})
    except:
        y, x, z = line
        data1.append(f"{x} {y} {z}")
for line in data1:
    print(f"{line} {data[line.split()[0]]}")
