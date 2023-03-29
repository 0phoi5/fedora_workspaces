# fedora_workspaces

Last updated: 16th March 2021

This script is for installing AWS Workspaces on Red Hat based distributions, namely RHEL, CentOS and Fedora.
This is not currently supported by AWS, only Debian-based distros (.deb install)

There is a .deb file included in this repo, however it is recommended that you go to https://clients.amazonworkspaces.com/linux-install.html and grab the latest version, as the one included may not be the absolute latest.

The script will convert the .deb file in to .rpm, amend it and install it.

You may get a few warning messages whilst running the script, you can ignore them, they stem from some configuration inside the converted rpm which is out of my control. The script should still run fine and install a working version of Amazon Workspaces.

Usage: sudo install.sh



If you find this useful, please consider supporting me via https://www.buymeacoffee.com/jackcollins
