import json
import re

#search_str = 'o=[i("manifest","manifest.json"+t),i("catalog","catalog.json"+t)]'
search_str = 'n=[o("manifest","manifest.json"+t),o("catalog","catalog.json"+t)]'

import re

with open('target/index.html', 'r', encoding='utf-8') as f:
    content_index = f.read()

# Your provided pattern to match the div with class "switches"
pattern = r'<div class="switches">([\s\S]*?)<\/li>'

# The new "QC" tab with correct indentation
qc_tab = '''\n                <div class="switch">\n                    <span\n                       class="switch-label btn btn-sm"\n                       ng-class="{active: (nav_selected == 'qc')}"\n                       ng-click="nav_selected = 'qc'">\n                        <svg class="icn menu-icon-on"><use xlink:href="#icn-filter"></use></svg>\n                        QC\n                    </span>\n                </div>\n'''

# Search for the pattern and append the QC tab before the closing </div> of the last switch
if re.search(pattern, content_index):
    matches = re.findall(pattern, content_index)
    for match in matches:
        print(match)
else:
    print('Pattern not found, nothing replaced.')

    
with open('target/manifest.json', 'r') as f:
    json_manifest = json.loads(f.read())

with open('target/catalog.json', 'r') as f:
    json_catalog = json.loads(f.read())
    
with open('target/index2.html', 'w') as f:
    #new_str = "o=[{label: 'manifest', data: "+json.dumps(json_manifest)+"},{label: 'catalog', data: "+json.dumps(json_catalog)+"}]"
    new_str = "n=[{label: 'manifest', data: "+json.dumps(json_manifest)+"},{label: 'catalog', data: "+json.dumps(json_catalog)+"}]"
    new_content = content_index.replace(search_str, new_str)
    f.write(new_content)

    
