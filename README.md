# Vagrant Template

Provides a very lightweight template for adding [Vagrant](http://vagrantup.com) to a project. Simply copy the `Vagrantfile`,
`provision.sh` and `requirements.txt` to your project and modify them to your desires. When you're done, run `vagrant up`.

## Default Features

Should you not modify the files, `vagrant up` will create a machine that has

- Ubunty 14, 64 bit installed
- Ports 8080 and 8000 mapped to the outside world
- [fish](http://fishshell.com) installed as the default shell
- Python, `pip` and `virtualenv` available
- installs all apt-get packages in `packages.txt`
- installs all python packages in `requirements.txt`

## Provisioning

- To install a Debian package during provisioning, add it to the `vagrant/packages.txt` file
- To install a Python package during provisioning, add it to the `requirements.txt` file
- To do other tasks during provisioning, edit the `vagrant/provision.sh` 

Have fun :)
