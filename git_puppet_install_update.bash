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
apt-get install libncurses5-dev libncursesw5-dev -y
apt-get autoremove -y
apt-get clean
rm -rf /var/backups
# Remember to put the github private key id_ecdsa of your account in root user's ~/.ssh in vagrant box. This is because vagrant box 
# uses sudo command to perform git operations and the root should be able to authenticate to git as your account
# cp ~/.ssh/id_ecdsa ~/vgboxes/host_synced_folders/
# vagrant ssh
# sudo su # Login as root
# cp /data_synced_with_host/id_ecdsa ~/.ssh/
# exit # login as vagrant user
# sudo ssh -vT git@github.com # this should return a successful message of your authentication
# sugo git clone <git_clone_url>
# 
rm /home/neo/puppet-release-focal.deb
touch /var/vagrant_provision

