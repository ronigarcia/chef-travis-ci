if platform?('centos')
  default['install_apache']['package'] = 'httpd'
elsif platform?('ubuntu')
  default['install_apache']['package'] = 'apache2'
end
