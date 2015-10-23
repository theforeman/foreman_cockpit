[![Code Climate](https://codeclimate.com/github/theforeman/foreman_cockpit/badges/gpa.svg)](https://codeclimate.com/github/theforeman/foreman_cockpit)
[![GPL License](https://img.shields.io/github/license/theforeman/foreman_cockpit.svg)](https://github.com/theforeman/foreman_cockpit/blob/master/LICENSE)

# Foreman Cockpit

Display [Cockpit](http://cockpit-project.org/) components in [Foreman](http://theforeman.org) hosts.

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

#### Packages on the making - please :star: it, watch it, and install from source for the moment.

** TODO - Add to manual, package and release **

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

