#!/usr/bin/python
import subprocess
import re

# I use this for bemenu since sway won't pick up it up
MENU_OPTIONS = '-i -theme ~/.config/rofi/settings/settings.rasi'
# MENU_OPTIONS = '-H 32 -I 0 -i -m 0 --fn "Hack:14" --fb "#323232" --ff "#ffffff" --nb "#323232" --nf "#ffffff" --sf "#ffffff" --sb "#81a2be" --af "#ffffff" --ab "#323232" --tb "#81a2be" --tf "#ffffff" --hb "#81a2be" --hf "#ffffff"'

sp = subprocess.run(['wpctl', 'status'], stdout=subprocess.PIPE).stdout.decode('utf-8')\
        .split("Sinks")[1].split('├─')[0]
newsp = []

active_device = ''
devices = {}
for line in sp.split('\n'):
    if '.' in line:
        device_number = re.findall(r'\d*\.', line)[0][:-1]

        device_name = re.sub(r'.*\d*\. ', '', line)
        device_name = re.sub(r' *\[vol: \d.\d*]', '', device_name)

        if '*' in line:
            active_device = device_name

        devices[device_name] = device_number

devices_list = '\\n'.join(devices.keys())
active_index = devices_list.split('\\n').index(active_device)

device_choise = subprocess.Popen(f'echo -e \"{devices_list}\" | rofi -dmenu -p "Choose Device" -a ' + str(active_index) + ' ' + MENU_OPTIONS, shell=True,stdout=subprocess.PIPE)\
        .stdout.read().decode('utf-8')
device_choise = device_choise.replace('\n', '')
device_choise = devices[device_choise]

subprocess.Popen('wpctl set-default '+str(device_choise), shell=True,stdout=subprocess.PIPE)