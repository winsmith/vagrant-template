.# Vagrant Template

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

The provisioning process will automatically create a virtualenv for your `vagrant` user and activate it on login. 
This way, you can install `pip` packages by `vagrant ssh`ing into the machine and running `pip install packagename` without
caring too much about the virtualenv (this is supposed to be a dev machine after all). Remember to add newly installed 
packages to `requirements.txt` as well, so they will be installed the next time you or someone else re-provisions the machine.

## Example: A lightweight Django development machine

Let's say you want to start a new Django project. Create an empty repository by forking this one or copying all the files
to a new repository. Then add your requirements to the various files:

### `vagrant/packages.txt`

    postgresql-9.3
    libpq-dev

### `requirements.txt`

    # base requirements (strongly typed, no surprises here)
    Django~=1.8.8
    psycopg2~=2.6.1
    
    # development requirements (we want the newest and greatest here)
    django-nose
    coverage

No other changes necessary. Run `vagrant up` and wait a few minutes for your machine to provision. The use `vagrant ssh` 
to ssh into the machine, `cd vagrant` to switch directories to your development directory and (assuming you've already 
put some Django code at this location) `python manage.py runserer 0.0.0.0:8000` to run your server.
