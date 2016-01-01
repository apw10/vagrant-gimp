#!/bin/bash
set -e
source /build/buildconfig
#do everything as vagrant user
if [ ! "${USER}" = "vagrant" ]; then
    su - vagrant -c "$0 $@"
    exit
fi
echo "Cloning libmypaint sources (as vagrant user)." 1>&2
set -x

mkdir -p ~/git
cd ~/git

#clone sources
#check to see if we can clone over git protocol (it may be blocked by firewall)
#if blocked then fall back to using port 443 to clone projects
if [ ! -e "libmypaint" ]; then
  git clone "https://github.com/mypaint/libmypaint.git"
fi
