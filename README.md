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

Add more to provision.sh to install more software or do more task 
