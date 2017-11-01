module ForemanCockpit
  # Helper to override the host action bar and add a Cockpit button.
  # Deface does not allow you to do this as the action bar is loaded through
  # hosts_helper, not included in the show.html.erb
  module HostsHelperExtensions
    extend ActiveSupport::Concern

    module Overrides
      def host_title_actions(*args)
        create_cockpit_bar if @host.cockpit_enabled?
        super
      end
    end

    included do
      prepend Overrides
    end

    private

    def create_cockpit_bar
      title_actions(
        button_group(
          select_action_button(
            _('Cockpit'), {},
            cockpit_buttons
          )
        )
      )
    end

    def cockpit_buttons
      ForemanCockpit::COCKPIT_ACTIONS.map { |action| cockpit_button(action) }
    end

    def cockpit_button(action)
      link_to(_(action.capitalize),
              '#',
              :'data-url' => url_for(:controller => '/hosts',
                                     :action => action,
                                     :id => @host.id),
              :class => :cockpit_button)
    end
  end
end
