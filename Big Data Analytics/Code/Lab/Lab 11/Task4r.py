# Abdul Saboor
# 20L-1113
# BDS-4A
# Task 4 Reducer

# Do cascading of files generated from task 2 and task 3 and give resultant output such that

# Person – day – total working he has done on this day day – total working he has done on all days

# Expected sample output
# Ali <Thursday 1 3>
# Ali <Wednesday 2 3>

# printing the output of mapper

import sys
temp = []
dict = {}
for line in sys.stdin:
    sys.stdout.write(line)
