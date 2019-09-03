[![Code Climate](https://codeclimate.com/github/theforeman/foreman_cockpit/badges/gpa.svg)](https://codeclimate.com/github/theforeman/foreman_cockpit)
[![Gem Version](https://badge.fury.io/rb/foreman_cockpit.svg)](https://badge.fury.io/rb/foreman_cockpit)
[![GPL License](https://img.shields.io/github/license/theforeman/foreman_cockpit.svg)](https://github.com/theforeman/foreman_cockpit/blob/master/LICENSE)

# Foreman Cockpit :rocket:

Display [Cockpit](http://cockpit-project.org/) components in [Foreman](http://theforeman.org) hosts. This plugin is **archived** because of the functionality being integrated into the [Remote Execution](https://theforeman.org/plugins/foreman_remote_execution/) plugin now.

* Website: [theforeman.org](http://theforeman.org)
* ServerFault tag: [Foreman](http://serverfault.com/questions/tagged/foreman)
* Issues: [foreman Redmine](http://projects.theforeman.org/projects/foreman/issues)
* Wiki: [Foreman wiki](http://projects.theforeman.org/projects/foreman/wiki/About)
* Community and support: [#theforeman](https://kiwiirc.com/client/irc.freenode.net/?#theforeman) for general support, [#theforeman-dev](https://kiwiirc.com/client/irc.freenode.net/?#theforeman-dev) for development chat in [Freenode](irc.freenode.net)
* Mailing lists:
    * [foreman-users](https://groups.google.com/forum/?fromgroups#!forum/foreman-users)
    * [foreman-dev](https://groups.google.com/forum/?fromgroups#!forum/foreman-dev)

## Features

* Display Cockpit components (system, terminal, journal, etc...) for a host if Cockpit is enabled on the host.
* Especially useful if the Foreman user does not have access to the host directly, but Foreman does.

![gif demoing cockpit components](http://i.imgur.com/RzdsR9b.gif)

## Installation

If you don't have the Foreman plugins repository set up, please follow the instructions in the manual:

* [Foreman: Plugin repo installation](http://theforeman.org/plugins/#2.2Packageinstallation)

### Red Hat, CentOS, Scientific Linux (rpm)

Set up the repo as explained in the link above, then on 1.10+ Foreman, run:

    # yum install tfm-rubygem-foreman_cockpit

or on 1.9 or lower:
   
    # yum install ruby193-rubygem-foreman_cockpit 
    
### Fedora (rpm)

Set up the repo as explained in the link above, then run:

    # yum install ruby-foreman-cockpit

### Debian, Ubuntu (deb)

Set up the repo as explained in the link above, then run

    # apt-get install ruby-foreman-cockpit

### Bundle (gem)

Add the following to bundler.d/Gemfile.local.rb in your Foreman installation directory (/usr/share/foreman by default)

    $ gem 'foreman_cockpit'

Then run `bundle install` from the same directory

## Usage

No configuration needed! Install the plugin and it will detect which of your hosts run Cockpit.

As of now, [Cockpit](http://cockpit-project.org/running.html) only runs on Fedora, Arch, CentOS, RHEL and Ubuntu, so your host must be running - and associated in Foreman - with one of these operating systems.

## Copyright

Copyright (c) Daniel Lobato Garcia

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

