module ForemanCockpit
  # Controller methods to load Cockpit components
  module HostsControllerExtensions
    extend ActiveSupport::Concern

    included do
      before_filter :allow_cockpit_iframe, :only => :show
    end

    ForemanCockpit::COCKPIT_ACTIONS.each do |action|
      define_method(action) do
        # We can't add a before_filter :find_resource for Cockpit actions as
        # it'll override the default find_resource filter.
        find_resource
        suburl = ForemanCockpit::COCKPIT_SUBURL[action.to_sym]
        render :partial => 'foreman_cockpit/hosts/cockpit',
               :locals => { :fqdn => @host.fqdn, :suburl => suburl,
                            :protocol => cockpit_protocol }
      end
    end

    private

    def allow_cockpit_iframe
      response.headers['Content-Security-Policy'].
        sub!("frame-src 'self'",
             "frame-src 'self' #{cockpit_protocol}://#{@host.fqdn}:9090")
    end

    def action_permission
      case params[:action]
      when *ForemanCockpit::COCKPIT_ACTIONS
        :console
      else
        super
      end
    end

    def cockpit_protocol
      require_ssl? ? 'https' : 'http'
    end
  end
end
