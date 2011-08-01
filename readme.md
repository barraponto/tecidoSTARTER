Dependencies
============

Tecido Starter is based on tecidoSTARTER: https://github.com/barraponto/tecidoSTARTER

In order to build Tecido Starter Kit, Drush and Drush Make must be 
installed on your computer. The easiest way is to download drush from
http://drupal.org/project/drush (pick the latest version). Extract it
to ~/drush and add the following line to your .bashrc file:

    PATH=$HOME/drush:$PATH

Restart your terminal and type:

    drush dl drush_make

How to build
============

The following command will build Tecido Starter to a folder named tecidoSTARTER:

    drush make https://raw.github.com/barraponto/tecidoSTARTER/master/tecidoSTARTER-stub.make tecidoSTARTER
