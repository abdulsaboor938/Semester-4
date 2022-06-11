import sys
for line in sys.stdin:
    line = line.strip()
    line = line.split()
    sys.stdout.write(line[0]+'\t'+line[-1]+'\n')
