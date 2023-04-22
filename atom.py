import json

with open('settings.json', 'r') as f:
    data = json.load(f)

with open('WORDLIST.dic', 'r') as f:
    lines = [line.strip() for line in f]

data['*']['spell-check']['knownWords'] = lines

json_string = json.dumps(data, ensure_ascii = False, indent = '\t').encode('utf-8')

with open('settings.json', 'wb') as f:
    f.write(json_string)
