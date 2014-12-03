#!/bin/env bash
# Written by Nate Dobbs 12/03/2014
# script is used to bootstrap a machine for an ansible configuration
# currently only supports RHEL-based machines ( Redhat, Fedora, CentOS )

set -e

# Download and install Ansible
if [[ ! -x /usr/local/bin/ansible ]]; then
    echo "Info   | Install   | Ansible"
    yum install ansible -y
fi

# Ensure git is installed
if [[ ! -x /usr/local/bin/git ]]; then
    echo "Info  | Install  | git"
    yum install git -y
fi

# Modify the PATH
# This should be subsequently updated in shell settings
export PATH=/usr/local/bin:$PATH

# Clone the remote ansible-role-zoneminder repo
git clone https://github.com/ndobbs/ansible-role-zoneminder.git ./roles/zoneminder
# Remove remote origin
git remote rm origin
