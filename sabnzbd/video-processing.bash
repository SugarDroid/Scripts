#!/bin/bash

# Download Scripts
if [ ! -f /config/scripts/MKV-Cleaner.bash ]; then
    echo "downloading MKV-Cleaner.bash from: https://github.com/RandomNinjaAtk/Scripts/tree/master/sabnzbd/MKV-Cleaner.bash"
    curl -o /config/scripts/MKV-Cleaner.bash https://raw.githubusercontent.com/RandomNinjaAtk/Scripts/master/sabnzbd/MKV-Cleaner.bash
    echo "done"

    # Set Permissions
    echo "setting permissions..."
    chmod +x /config/scripts/MKV-Cleaner.bash
    echo "done"
fi

if [ ! -f /config/scripts/Deobfuscate.py ]; then
    echo "downloading Deobfuscate.py from: https://github.com/sabnzbd/sabnzbd/blob/develop/scripts/Deobfuscate.py"
    curl -o /config/scripts/Deobfuscate.py https://raw.githubusercontent.com/sabnzbd/sabnzbd/develop/scripts/Deobfuscate.py
    echo "done"

    # Set Permissions
    echo "setting permissions..."
    chmod +x /config/scripts/Deobfuscate.py
    echo "done"
fi

# Execute on new downloads
cd /config/scripts
timeout --foreground 1m python Deobfuscate.py
./MKV-Cleaner.bash "$1"