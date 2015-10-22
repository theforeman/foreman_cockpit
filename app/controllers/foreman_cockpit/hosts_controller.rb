module ForemanCockpit
  class HostsController < ::HostsController
    before_filter :find_resource
    before_filter :cockpit_enabled?
    before_filter :allow_cockpit_iframe

    def cockpit_console
      @console = { :name => @host.name, :fqdn => @host.fqdn }
    # renders view/foreman_cockpit/hosts/cockpit_console
    end

    def journal
      @console = { :name => @host.name, :fqdn => @host.primary_interface.fqdn }
      render 'hosts/journal'
      # renders view/foreman_cockpit/hosts/journal
    end

    private

    def allow_cockpit_iframe
      response.headers['Content-Security-Policy'].
        sub!("frame-src 'self'",
             "frame-src 'self' http://#{@host.primary_interface.fqdn}:9090")
    end

    def cockpit_enabled?
      return true if @host.cockpit_enabled?
      process_error :redirect => :back,
        :error_msg => _('Cockpit is not enabled in this host') and return
    end

    def action_permission
      case params[:action]
      when :cockpit_console, :journal
        :console
      else
        super
      end
    end
  end
end
