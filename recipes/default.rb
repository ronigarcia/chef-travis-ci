#
# Cookbook:: install-nginx
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

apt_update 'update' do
  action :update
end

# Install the httpd package.
package node['install_apache']['package']

# Start and enable the service.
service node['install_apache']['package'] do
  action [:enable, :start]
end

# Serve a custom home page.
file '/var/www/html/index.html' do
  content '<html>
  <body>
    <h1>hello world</h1>
  </body>
</html>'
end
