# dvswitch-sandbox
## A vagrant virtualbox playground for DVSwitch test/dev environment

Running *vagrant up* will install a bento debian 9.6 box, and provision the DVSwitch programs
using the DVSwitch-System-Builder script by N4IRS.


Also added is a DMRGateway unit file to allow startup of DMRGateway using systemd.

### Basic Setup Instructions:
Install *vagrant*

Install *virtualbox*

git clone https://github.com/kc1awv/dvswitch-sandbox.git

cd dvswitch-sandbox

vagrant up

vagrant ssh
