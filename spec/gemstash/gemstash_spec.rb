require "spec_helper"

describe "gemstash" do
  describe file("/entrypoint.sh") do
    it { should be_executable }
  end

  describe file("/etc/gemstash/config.yml") do
    it { should be_file }
  end

  describe file("/var/cache/gemstash") do
    it { should be_directory }
  end

  describe package("gemstash") do
    it { should be_installed.by("gem").with_version("1.0.4") }
  end

  describe command("gemstash version") do
    its(:stdout) { should eq "Gemstash version 1.0.4\n" }
    its(:exit_status) { should eq 0 }
  end
end
