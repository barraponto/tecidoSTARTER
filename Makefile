root := $(shell pwd)

all: update modules themes libraries profiles

update:
	git pull && git submodule sync && git submodule update --init --recursive

modules:
	if [ -d modules ];\
	  then find modules/ -maxdepth 1 -mindepth 1 -type d -execdir ln -s $(root)/modules/{} $(root)/drupal/sites/all/modules/ \; ;\
	fi

themes:
	if [ -d themes ];\
	  then find themes/ -maxdepth 1 -mindepth 1 -type d -execdir ln -s $(root)/themes/{} $(root)/drupal/sites/all/themes/ \; ;\
	fi

libraries:
	if [ -d libraries ];\
	  then find libraries/ -maxdepth 1 -mindepth 1 -type d -execdir ln -s $(root)/libraries/{} $(root)/drupal/sites/all/libraries/ \; ;\
	fi

profiles:
	if [ -d profiles ];\
	  then find profiles/ -maxdepth 1 -mindepth 1 -type d -execdir ln -s $(root)/profiles/{} $(root)/drupal/profiles/ \; ;\
	fi
