module ForemanCockpit
  # Controller methods to display Cockpit components
  module HostsControllerExtensions
    extend ActiveSupport::Concern

    included do
      before_filter :find_resource
      before_filter :cockpit_enabled?,
                    :only => [:cockpit_console, :journal, :storage]
      before_filter :allow_cockpit_iframe,
                    :only => [:show, :cockpit_console, :journal, :storage]
    end

    def cockpit_console
      @console = { :name => @host.name, :fqdn => @host.fqdn }
      render 'foreman_cockpit/hosts/cockpit_console'
    end

    def journal
      @console = { :name => @host.name, :fqdn => @host.fqdn }
      render 'foreman_cockpit/hosts/journal'
    end

    def storage
      @console = { :name => @host.name, :fqdn => @host.fqdn }
      render 'foreman_cockpit/hosts/storage'
    end

    private

    def allow_cockpit_iframe
      response.headers['Content-Security-Policy'].
        sub!("frame-src 'self'",
             "frame-src 'self' http://#{@host.fqdn}:9090")
    end

    def cockpit_enabled?
      return true if @host.cockpit_enabled?
      process_error(:redirect => :back,
                    :error_msg => _('Cockpit is not enabled in this host'))
    end

    def action_permission
      case params[:action]
      when 'cockpit_console', 'journal', 'storage'
        :console
      else
        super
      end
    end
  end
end
