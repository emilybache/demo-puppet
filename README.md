Puppet configs for demo machines
================================

These puppet scripts allow me to quickly provision new virtual machines for use in texttest trainings.

On a fresh machine:

1) Install git and puppet and other prerequisites:

	wget -qO- 'https://raw.githubusercontent.com/emilybache/demo-puppet/master/init.sh' | sudo sh

2) use the 'apply_puppet' script to install everything else:

	cd $HOME
	wget -qO- 'https://raw.githubusercontent.com/emilybache/demo-puppet/master/apply_puppet.sh' | sudo sh
