module ForemanCockpit
  # Extensions to the Host::Managed model to check if a host runs Cockpit
  module HostExtensions
    extend ActiveSupport::Concern

    included do
      def cockpit_enabled?
        return false unless primary_interface.fqdn.present? ||
                            %w(Fedora Redhat Archlinux).include?(os.type)
        ping_cockpit_service
      end

      private

      def ping_cockpit_service
        cockpit_ping_url = "#{primary_interface.fqdn}:9090/ping"

        Timeout.timeout(5) do
          'cockpit' == JSON.parse(RestClient.get(cockpit_ping_url))['service']
        end
      rescue => e
        logger.warn "Tried to contact Cockpit for host #{name} but failed: #{e}"
        logger.debug e.backtrace.join("\n")
        false
      end
    end
  end
end
