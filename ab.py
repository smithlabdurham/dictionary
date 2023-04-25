with open('WORDLIST.dic', 'r') as f:
    lines = [line.strip() for line in f]
    lines.sort(key=lambda x: x.lower())

with open('WORDLIST.dic', 'w') as f:
    f.write("\n".join(set(lines)))
