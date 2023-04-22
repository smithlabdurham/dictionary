import json

with open('gist.json', 'r') as f:
    data = json.load(f)

with open('WORDLIST.DIC', 'r') as f:
    lines = [line.strip() for line in f]

data['*']['spell-check']['knownWords'] = lines

with open('gist.json', 'w') as f:
    json.dump(data, f)
