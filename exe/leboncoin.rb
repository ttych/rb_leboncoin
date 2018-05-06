#!/usr/bin/env ruby

require 'leboncoin'

configuration = Leboncoin::Configuration.new(ARGV.shift)

Leboncoin::AdsSeller.new(configuration)
                    .proceed
