import json
import os

char_list = [ 'Hibiki', 'Ragna', 'Noel', 'Λ -No.11-', 'Es', 'Rachel', 'Taokaka', 'Jin', 'Kokonoe', 'Hakumen', 'Mai', 'Hazama', 'ICEY', 'Bullet', 'The Prisoner', 'Naoto' ]

# start_x = 75
# start_y = 0
for i, char in enumerate(char_list):
    # if (i % 2 == 0):
    #     start_x = 75
    #     start_y += 40
    # else:
    #     start_x = 300
        
    char_lower = char.lower().replace(' ', '_')
    if (i == 3):
        char_lower = 'lambda_-no.11-'
    with open('template.json', 'r') as f:
        raw_json = f.read()
    
    raw_json = raw_json.replace('<p_upper>', char)
    raw_json = raw_json.replace('<p_lower>', char_lower)
    raw_json = raw_json.replace('test_map', char_lower+'_map')
    # for j in range(0, 7):
    #     raw_json = raw_json.replace(f'<x{j}>', str(start_x))
    #     start_x += 25
    # raw_json = raw_json.replace('<y>', str(start_y))

    file_name = "output/locations/" + char_lower.replace(' ', '_') + '.json'
    if not os.path.exists("output/locations"):
        os.makedirs("output/locations")
    with open(file_name, 'w') as f:
        f.write(raw_json)