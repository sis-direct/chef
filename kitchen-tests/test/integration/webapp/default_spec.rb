#describe port(80) do
#  it { should be_listening }
#  its('processes') {should include 'http'}
#end
#
#describe command("curl http://localhost/index.html") do
#  its("stdout") { should match /Hello, World!/ }
#end

describe package("nscd") do
  it { should be_installed }
end

describe service("nscd") do
# broken?
#  it { should be_enabled }
  it { should be_installed }
  it { should be_running }
end

describe package("fail2ban") do
  it { should be_installed }
end

describe service("fail2ban") do
  it { should be_enabled }
  it { should be_installed }
  it { should be_running }
end

describe package("openssh-client") do
  it { should be_installed }
end

describe service("ssh") do
  it { should be_enabled }
  it { should be_installed }
  it { should be_running }
end

describe package("ntp") do
  it { should be_installed }
end

describe service("ntp") do
# broken?
#  it { should be_enabled }
  it { should be_installed }
  it { should be_running }
end

describe package("chef") do
  it { should be_installed }
end

describe service("chef-client") do
  it { should be_enabled }
  it { should be_installed }
  it { should be_running }
end

describe file("/etc/resolv.conf") do
  its("content") { should match /search\s+chef.io/ }
  its("content") { should match /nameserver\s+8.8.8.8/ }
  its("content") { should match /nameserver\s+8.8.4.4/ }
end

describe package("gcc") do
  it { should be_installed }
end

describe package("flex") do
  it { should be_installed }
end

describe package("bison") do
  it { should be_installed }
end

describe package("autoconf") do
  it { should be_installed }
end

%w{lsof tcpdump strace zsh dmidecode ltrace bc curl wget telnet subversion git traceroute htop iptraf tmux s3cmd sysbench }.each do |pkg|
  describe package pkg do
    it { should be_installed }
  end
end

describe apt("http://us-west-2.ec2.archive.ubuntu.com/ubuntu") do
  it { should be_enabled }
  it { should exist }
end

describe etc_group.where(group_name: "sysadmin") do
  its("users") { should include "adam" }
  its("gids") { should eq [2300] }
end

# broken?
#describe passwd.filters(users: "adam") do
#  its("uids") { should eq ["666"] }
#end

describe ntp_conf do
  its("server") { should_not eq nil }
end

describe port(22) do
  it { should be_listening }
  its("protocols") { should include "tcp" }
  its("processes") { should eq ["sshd"] }
end
