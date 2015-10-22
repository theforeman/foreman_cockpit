require 'test_plugin_helper'

# Dummy class in which we include the Cockpit module, to test it in isolation
class DummyCockpit
  include Cockpit
end

# Test Cockpit concern in isolation
class CockpitTest < ActiveSupport::TestCase
  test 'cockpit is enabled if cockpit ping is successful' do
    dummy_cockpit = DummyCockpit.new
    dummy_cockpit.stubs(:operatingsystem).
      returns(OpenStruct.new(:type => 'Fedora'))
    dummy_cockpit.stubs(:primary_interface).
      returns(OpenStruct.new(:fqdn => 'http://foo.bar'))
    cockpit_ping_url = "#{dummy_cockpit.primary_interface.fqdn}:9090/ping"
    RestClient.expects(:get).with(cockpit_ping_url).
      returns('{"service": "cockpit"}')
    assert dummy_cockpit.cockpit_enabled?
  end
end
