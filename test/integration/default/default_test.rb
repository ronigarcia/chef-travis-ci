# InSpec test for recipe install-nginx::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

if os.family == 'debian'
  describe user('www-data') do
    it { should exist }
  end

  describe package('apache2') do
    it { should be_installed }
  end

  describe service('apache2') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end
elsif
  describe user('apache') do
    it { should exist }
  end

  describe package('httpd') do
    it { should be_installed }
  end

  describe service('httpd') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end
end

describe command('curl localhost') do
  its('stdout') { should match /hello/ }
end

describe port(80) do
  it { should be_listening }
end
