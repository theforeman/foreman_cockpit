module ForemanCockpit
  # Extensions to the Host::Managed model to check if a host runs Cockpit
  module HostExtensions
    extend ActiveSupport::Concern

    included do
      def cockpit_enabled?
        return false unless fqdn.present? && os.present? &&
                            %w(Fedora Redhat Archlinux Ubuntu).include?(os.type)
        ping_cockpit_service
      end

      private

      def ping_cockpit_service
        cockpit_ping_url = "#{fqdn}:9090/ping"

        # In most cases, the GET call will fail if Cockpit isn't there
        # immediately without a timeout, it's just a backup plan in case DNS is
        # not working or other similar issues.
        Timeout.timeout(5) do
          'cockpit' == JSON.parse(RestClient.get(cockpit_ping_url))['service']
        end
      rescue Timeout::Error, SocketError, Errno::ECONNREFUSED,
             Errno::EHOSTUNREACH => e
        logger.warn "Tried to contact Cockpit for host #{name} but failed: #{e}"
        logger.debug e.backtrace.join("\n")
        false
      end
    end
  end
end
