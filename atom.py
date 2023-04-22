import json

with open('settings.json', 'r') as f:
    data = json.load(f)

with open('WORDLIST.dic', 'r') as f:
    lines = [line.strip() for line in f]

data['*']['spell-check']['knownWords'] = lines

with open('settings.json', 'w') as f:
    json.dump(data, f, indent = '\t')
