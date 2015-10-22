module ForemanCockpit::HostsHelperExtensions
  extend ActiveSupport::Concern

  included do
    alias_method_chain :host_title_actions, :cockpit
  end

  def host_title_actions_with_cockpit(*args)
    if @host.cockpit_enabled?
      title_actions(
          button_group(
            select_action_button(_('Cockpit'), {},
              link_to_if_authorized(_('Console'), hash_for_cockpit_console_host_path(:id => @host), :id => :cockpit_console),
              link_to_if_authorized(_('Journal'), hash_for_journal_host_path(:id => @host), :id => :cockpit_journal),
              link_to_if_authorized(_('Storage'), hash_for_storage_host_path(:id => @host), :id => :cockpit_storage)
            )
          )
      )
    end
    host_title_actions_without_cockpit(*args)
  end
end
