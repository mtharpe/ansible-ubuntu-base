# InSpec test for recipe terraform_enterprise::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

describe apt('https://apt.releases.hashicorp.com') do
  it { should exist }
  it { should be_enabled }
end

%w(vim git htop curl wget sudo strace zip unzip
  time apt-utils man-db dnsutils telnet tcpdump
  lsof ca-certificates logrotate rsyslog net-tools
  terraform vault consul nomad waypoint).each do |pkg|
    describe package pkg do
      it { should be_installed }
    end
  end