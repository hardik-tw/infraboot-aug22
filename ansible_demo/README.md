## on mac
```s
$ brew install ansible
$ ansible --version
$ ansible localhost -m ping
```
## on ec2 (centos) -- for privilaged access, we require root user access
1. Create a password for 'root' user
```s
$ sudo su -
$ passwd
```
2. update sshd_config file for allowing Password Authentication (with root user)
```s
vi /etc/ssh/sshd_config
```
look for line 'PasswordAuthentication'; uncomment 'PasswordAuthentication yes' and comment 'PasswordAuthentication no'
```s
PasswordAuthentication yes
#PasswordAuthentication no
```
