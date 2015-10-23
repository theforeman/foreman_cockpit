require 'foreman_cockpit/engine'

# Module required to start the Rails engine
# We store all cockpit actions in a constant here to use them later
module ForemanCockpit
  COCKPIT_ACTIONS = %w(system terminal journal
                       services networking containers
                       storage accounts)

  COCKPIT_SUBURL = { :system => 'shell/shell.html#/server',
                     :terminal => 'system/terminal.html',
                     :journal => 'system/journal.html',
                     :services => 'system/init.html',
                     :networking => 'shell/shell.html#/networking',
                     :containers => 'docker/containers.html',
                     :storage => 'storage/devices.html',
                     :accounts => 'shell/shell.html#/accounts' }
end
