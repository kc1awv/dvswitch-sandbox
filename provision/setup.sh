cd $HOME
cp /vagrant_files/.bash_profile /home/vagrant/
chown vagrant:vagrant /home/vagrant/.bash_profile
echo 'export PS1="\[\e[33m\][\[\e[m\]\[\e[31m\]dvswitch_sandbox\[\e[m\]\[\e[33m\]]\[\e[m\]\\$ "' >> /home/vagrant/.bash_profile
export DEBIAN_FRONTEND=noninteractive

echo "Setting up the DVSwitch System Builder"

apt-get install unzip

# Run the DVSwitch-System-Builder scritps
cd /tmp
wget https://github.com/DVSwitch/DVSwitch-System-Builder/archive/master.zip
cd /srv
unzip /tmp/master.zip
mv DVSwitch-System-Builder-master DVSwitch-System-Builder
cd DVSwitch-System-Builder
./DVSwitch-System-Builder.sh

# copy DMRGateway service file
cp /vagrant_files/DMRGateway.service /lib/systemd/system

echo -e "================="
echo "DVSwitch sandbox is now up and running!"
echo -e "================="
