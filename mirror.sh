#!/bin/sh

set -ex

version="el7"
src=http://mirrors.coreix.net/elrepo
dest=/downloads

# Getting gpgkey
wget -v https://www.elrepo.org/RPM-GPG-KEY-elrepo.org -P "$dest"

# Downloading mirror
for folder in "elrepo" "kernel"
do
	arch_src="$src/$folder/${version}"
	arch_dest="$dest"
	mkdir -p "$arch_dest"
	wget \
		--mirror -nH --cut-dirs=1 --convert-links --adjust-extension --page-requisites --no-parent \
		"$arch_src" -P "$arch_dest"
done

