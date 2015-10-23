# We need to insert the JS to load partials and substitute the Puppet graphs in
# the Host show page
Deface::Override.new(
  :virtual_path => 'hosts/show',
  :name => 'add_load_partials_js',
  :insert_after => 'erb[silent]:contains("javascript")',
  :text => "<% javascript 'foreman_cockpit/load_partial' %>")
