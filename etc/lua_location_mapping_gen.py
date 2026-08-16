import json

char_list = [ 'Hibiki', 'Ragna', 'Noel', 'Λ -No.11-', 'Es', 'Rachel', 'Taokaka', 'Jin', 'Kokonoe', 'Hakumen', 'Mai', 'Hazama', 'ICEY', 'Bullet', 'The Prisoner', 'Naoto' ]
elite_list = [ 'Watcher', 'Sweeper', 'Serpent of Destruction', 'Tree of Origin', 'Arakune', 'Defiling Eye', 'Oread', 'NAN-FIRE BITE', 'Floating Mind', 'NAN-01' ]

lti_data = "LOCATION_TO_ID_MAP = {\n"
itl_data = "ID_TO_LOCATION_MAP = {\n"
count = 0
for i, char in enumerate(char_list):
    for j in range(1, 6):
        count += 1
        location = f"{char}/{char} Stage {j}/Stage Clear"
        lti_data += f"\t [\"{location}\"] = {count},\n"
        itl_data += f"\t[{count}] = {{\"@{location}\"}},\n"
    for j, elite in enumerate(elite_list):
        count += 1
        location = f"{char}/{char} Stage {((j//2)+1)}/Elite Enemy: {elite} Defeated"
        lti_data += f"\t [\"{location}\"] = {count},\n"
        itl_data += f"\t[{count}] = {{\"@{location}\"}},\n"
    count += 1
    location = f"{char}/{char} Advanced Dive Clears/Final Elite Enemy: Susanoo Defeated"
    lti_data += f"\t [\"{location}\"] = {count},\n"
    itl_data += f"\t[{count}] = {{\"@{location}\"}},\n"
    for j in range(0, 101, 20):
        count += 1
        location = f"{char}/{char} Advanced Dive Clears/Entropy {j} Clear"
        lti_data += f"\t [\"{location}\"] = {count},\n"
        itl_data += f"\t[{count}] = {{\"@{location}\"}},\n"
    for j in range(0, 101, 20):
        count += 1
        location = f"{char}/{char} Extreme Dive Clears/Entropy {j} Clear"
        lti_data += f"\t [\"{location}\"] = {count},\n"
        itl_data += f"\t[{count}] = {{\"@{location}\"}},\n"
    count += 1
    location = f"{char}/{char} Extreme Dive Clears/Final Elite Enemy: Reki Defeated"
    lti_data += f"\t [\"{location}\"] = {count},\n"
    itl_data += f"\t[{count}] = {{\"@{location}\"}},\n"
count += 1
location = f"Goal/Goal/Required Dives Complete (Goal Completed)"
lti_data += f"\t [\"{location}\"] = {count}\n"
itl_data += f"\t[{count}] = {{\"@{location}\"}}\n"
    
lti_data += "}\n"
itl_data += "}\n"
final_data = lti_data + itl_data

with open("output/location_mapping.lua", 'w') as f:
    f.write(final_data)