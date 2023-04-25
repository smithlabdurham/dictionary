with open('WORDLIST.dic', 'r') as f:
    lines = [line.strip() for line in f]
    lines.sort()

with open('WORDLIST.dic', 'w') as f:
    f.writelines(lines)
