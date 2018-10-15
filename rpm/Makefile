#===============================================================================
#
#         FILE:  Makefile
#
#        USAGE:  Makefile
#
#  DESCRIPTION:  Manage project
#
#      OPTIONS:  ---
# REQUIREMENTS:  ---
#         BUGS:  ---
#        NOTES:  ---
#       AUTHOR:  John van Zantvoort (jvzantvoort), John@vanZantvoort.org
#      COMPANY:  none
#      CREATED:  15-Oct-2018
#===============================================================================

stop:
	vagrant halt

destroy:
	vagrant destroy -f

build:
	vagrant up --provider=libvirt
	vagrant halt

start:
	vagrant up --provider=libvirt

rebuild: destroy build

