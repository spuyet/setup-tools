# Setup-tools

## WTF ?

A script to automatize software installation. Supported software:
- docker
- ufw
- nginx
- certbot

## Options

- `SUDO=1`: Allow to prefix with `sudo` all the executed commands.
- `SSH=user@hostname`: Allow you to install a software on a remote machine.

## Examples

Install docker on your machine:
```
SUDO=1 ./setup.sh docker
```

Install nginx on a remote machine:
```
SSH=user@hostname SUDO=1 ./setup.sh nginx
```

Enable SSL on your remote nginx vhost:
```
SSH=user@hostname DOMAIN=example.com EMAIL=user@example.com SUDO=1 ./setup.sh certbot
```
