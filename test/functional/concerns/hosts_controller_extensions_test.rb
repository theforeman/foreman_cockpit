require 'test_plugin_helper'

# Test actions added to the HostController through this plugin
class HostsControllerTest < ActionController::TestCase
  test 'security headers allow Cockpit content on show' do
    host = FactoryGirl.create(:host)
    get :show, { :id => host }, set_session_user
    assert_includes response.headers['Content-Security-Policy'], host.fqdn
  end
end
