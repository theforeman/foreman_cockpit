require 'foreman_cockpit/engine'

# Module required to start the Rails engine
# We store all cockpit actions in a constant here to use them later
module ForemanCockpit
  COCKPIT_ACTIONS = %w(system terminal journal
                       services networking containers
                       storage accounts)

  COCKPIT_SUBURL = { :system => 'system/index.html',
                     :terminal => 'system/terminal.html',
                     :journal => 'system/logs.html',
                     :services => 'system/services.html',
                     :networking => 'network/index.html',
                     :containers => 'docker/index.html',
                     :storage => 'storage/index.html',
                     :accounts => 'users/index.html' }
end
