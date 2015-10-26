# In case deface < 1.0 is installed, for instance on Foreman 1.9 and older
# we need to use a different matcher to match code
Deface::Override.new(
  :virtual_path => 'hosts/show',
  :name => 'add_load_partials_js_legacy',
  :insert_after => 'code:contains("javascript")',
  :text => "<% javascript 'foreman_cockpit/load_partial' %>")
