all:
	git submodule update --init --recursive
	if [ -d modules ]; then find modules/ -maxdepth 1 -mindepth 1 -type d -execdir ln -s ../../../{} ../drupal/sites/all/modules/ \; ; fi
	if [ -d themes ]; then find themes/ -maxdepth 1 -mindepth 1 -type d -execdir ln -s ../../../{} ../drupal/sites/all/themes/ \; ; fi
	if [ -d libraries ]; then find libraries/ -maxdepth 1 -mindepth 1 -type d -execdir ln -s ../../../{} ../drupal/sites/all/libraries/ \; ; fi
	if [ -d profiles ]; then find profiles/ -maxdepth 1 -mindepth 1 -type d -execdir ln -s ../../../{} ../drupal/profiles/ \; ; fi
