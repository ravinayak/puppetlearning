if [[ -f "/var/vagrant_provision" ]];then exit 0; fi;
apt-get update -y
apt-get dist-upgrade -y
add-apt-repository ppa:git-core/ppa
apt-get update -y
apt-get install git -y
source /etc/lsb-release
wget https://apt.puppetlabs.com/puppet-release-${DISTRIB_CODENAME}.deb
dpkg -i puppet-release-${DISTRIB_CODENAME}.deb
apt-get update -y
apt-get install git puppet-agent -y
echo 'Defaults        secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin:/opt/puppetlabs/bin:/opt/puppetlabs/puppet/bin"' >/etc/sudoers.d/puppet
apt-get install build-essential -y
/opt/puppetlabs/puppet/bin/gem install gpgme --no-document
/opt/puppetlabs/puppet/bin/gem install hiera-eyaml-gpg --no-document
/opt/puppetlabs/puppet/bin/gem install r10k --no-document
/opt/puppetlabs/puppet/bin/gem install yard
/opt/puppetlabs/puppet/bin/gem install puppet-strings
apt-get install libncurses5-dev libncursesw5-dev -y
apt-get autoremove -y
apt-get clean
rm -rf /var/backups
apt-get install vim-gtk -y
apt-get install net-tools -y
apt-get install openssh-server -y
ufw allow ssh
cp /data_synced_with_host/* /root/.ssh/
touch /root/.gitconfig
cp /data_synced_with_host/gitconfig_root /root/.gitconfig
cp /data_synced_with_host/.bashrc ~/.bashrc
source ~/.bashrc
# ssh -vT git@github.com: This throws an erro because git does not support shell access. Test it 1st thing when machine boots up
cd /etc/puppetlabs/code/environments/production/
cd puppetlearning
sudo puppet apply manifests/run_puppet.pp
mkdir -p /codetestfiles # This will be a standard directory in which we shall place all our puppet test files
# Below is a description of why we used the above commands and how you would have done it manually
# Remember to put the github private key id_ecdsa of your account in root user's ~/.ssh in vagrant box. This is because vagrant box 
# uses sudo command to perform git operations and the root should be able to authenticate to git as your account
# 
# vagrant ssh
# sudo su # Login as root
# cp /data_synced_with_host/id_ecdsa ~/.ssh/
# vim ~/.gitconfig # Create a gitconfig with the following details
# [user]
#	name = Ravi Kumar Nayak
#	email = ravinayak19@gmail.com
#	username = ravinayak
#
# exit # login as vagrant user
# sudo cp /data_synced_with_host/* /root/.ssh/
# sudo ssh -vT git@github.com # this should return a successful message of your authentication
# sudo git clone <git_clone_url=git@github.com:ravinayak/puppetlearning.git>
# 
rm /home/vagrant/puppet-release-focal.deb
touch /var/vagrant_provision

