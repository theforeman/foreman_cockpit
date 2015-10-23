require 'test_plugin_helper'

# Dummy class in which we include the Cockpit module, to test it in isolation
class DummyHost
  include ForemanCockpit::HostExtensions
end

# Test Cockpit concern in isolation
class CockpitTest < ActiveSupport::TestCase
  setup do
    @dummy_host = DummyHost.new
  end

  context 'when host uses a cockpit-enabled OS' do
    setup do
      @dummy_host.stubs(:os).returns(OpenStruct.new(:type => 'Fedora'))
    end

    test 'cockpit is enabled if cockpit ping is successful' do
      @dummy_host.stubs(:fqdn).returns('http://foo.bar')
      cockpit_ping_url = "#{@dummy_host.fqdn}:9090/ping"
      RestClient.expects(:get).with(cockpit_ping_url).
        returns('{"service": "cockpit"}')
      assert @dummy_host.cockpit_enabled?
    end

    test 'cockpit is not displayed if fqdn is not present' do
      @dummy_host.stubs(:fqdn).returns(nil)
      refute @dummy_host.cockpit_enabled?
    end
  end

  test 'cockpit is not displayed when host does not have an OS' do
    @dummy_host.stubs(:os).returns(nil)
    @dummy_host.stubs(:fqdn).returns('http://foo.bar')
    refute @dummy_host.cockpit_enabled?
  end

  test 'cockpit is not displayed for incompatible OSs' do
    @dummy_host.stubs(:os).returns(OpenStruct.new(:type => 'Debian'))
    @dummy_host.stubs(:fqdn).returns('http://foo.bar')
    refute @dummy_host.cockpit_enabled?
  end
end
