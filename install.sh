#!/usr/bin/env bash

# See https://www.jackcollins.me.uk/aws_workspaces.html

# Purpose - Installing Amazon Web Services (AWS) Workspaces on Fedora or Red-Hat based distros
# Authour - Jack Collins (jackcollins.me.uk)

# IMPORTANT : Before running this script, please place it in the same location as the .deb file
# which you can get from https://clients.amazonworkspaces.com/linux-install.html
# and run the script from the same location
# A copy of this file is included with this GitHub repo, but I cannot guarantee it is the latest version,
# best to check yourself and download the absolute latest.


# Check if root
if [[ $EUID -ne 0 ]]; then
    echo "[ ERROR ] Run me as root." 
    exit 1
fi

# Install Alien and RPM-Rebuild
    echo
    echo "[ Installing required packages ]"
    yum install -y alien rpmrebuild

# Use Alien to convert the .deb to a .rpm
    echo
    echo "[ Converting deb to rpm ]"
    alien --to-rpm workspacesclient_amd64.deb

# Use RPM-Rebuild to remove the root chown/chmod line from the rpm, then install
    echo
    echo "[ Amending RPM and installing ]"
    echo "y n" | rpmrebuild --change-spec-files='sed "/^%dir[[:space:]]%attr.*\"\/\"/d"' -I workspacesclient-*.x86_64.rpm

# Install Workspaces using the new rpm (no longer required, the -I option on rpmrebuild does this)
#    rpm --install /home/[USERNAME]/rpmbuild/RPMS/x86_64/workspacesclient-*.x86_64.rpm

# Done
    echo "[ Complete ]"