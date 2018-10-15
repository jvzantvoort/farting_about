#!/bin/bash
# ---------------------------------------------------------------------------- #
#
#         FILE:  setup.sh
#
#        USAGE:  sourced by the Vagrantfile
#
#  DESCRIPTION:  setup script sourced by vagrant
#
#      OPTIONS:  ---
# REQUIREMENTS:  ---
#         BUGS:  ---
#        NOTES:  ---
#       AUTHOR:  John van Zantvoort (jvzantvoort), <john@vanzantvoort.org>
#      CREATED: Mon, 15 Oct 2018
# ---------------------------------------------------------------------------- #

# setup SELinux
/usr/bin/sed -i.orig 's,SELINUX=enforcing,SELINUX=permissive,g' /etc/sysconfig/selinux
/sbin/setenforce Permissive

# otherwise working with putty gets anoying
/usr/bin/cat > /etc/sysconfig/bash-prompt-default << 'END1'
#!/bin/bash
printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"
END1
/usr/bin/cp /etc/sysconfig/bash-prompt-default /etc/sysconfig/bash-prompt-screen
/usr/bin/chmod 755 /etc/sysconfig/bash-prompt-*

/usr/bin/yum -y install epel-release
/usr/bin/yum -y groupinstall "Development Tools" "Fedora Packager"
/usr/bin/yum -y install tig tree vim-enhanced

/usr/bin/cat > /home/vagrant/setup_user.sh << 'END_SETUP'
#!/bin/bash

rpmdev-setuptree

END_SETUP
/usr/bin/chmod 755 /home/vagrant/setup_user.sh
