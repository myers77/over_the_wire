#!/usr/bin/env ruby
require 'rubygems'
require 'net/ssh'
require 'yaml'

password = 'bandit0'

YAML.load(File.read("bandit.yml")).each do |num, command|
  Net::SSH.start('bandit.labs.overthewire.org',
                 "bandit#{num}",
                 :port => 2220,
                 :password => password) do |ssh|

    password = ssh.exec!(command).chomp()
    puts "bandit#{num}: #{password}"
  end
end
