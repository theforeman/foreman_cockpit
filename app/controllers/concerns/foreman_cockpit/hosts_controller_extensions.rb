module ForemanCockpit
  # Controller methods to load Cockpit components
  module HostsControllerExtensions
    extend ActiveSupport::Concern

    included do
      before_action :allow_cockpit_iframe, :only => :show
    end

    ForemanCockpit::COCKPIT_ACTIONS.each do |action|
      define_method(action) do
        # We can't add a before_filter :find_resource for Cockpit actions as
        # it'll override the default find_resource filter.
        find_resource
        suburl = ForemanCockpit::COCKPIT_SUBURL[action.to_sym]
        render :partial => 'foreman_cockpit/hosts/cockpit',
               :locals => { :fqdn => @host.fqdn, :suburl => suburl,
                            :protocol => request.protocol }
      end
    end

    private

    def allow_cockpit_iframe
      append_content_security_policy_directives(child_src: ["#{request.protocol}#{@host.fqdn}:9090"])
    end

    def action_permission
      case params[:action]
      when *ForemanCockpit::COCKPIT_ACTIONS
        :console
      else
        super
      end
    end
  end
end
