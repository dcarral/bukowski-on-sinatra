require 'rubygems'
require 'bundler/setup'
require 'dotenv'
require 'dm-core'
require 'dm-timestamps'
require 'dm-validations'
require 'dm-aggregates'
require 'dm-migrations'
require 'ostruct'

require 'sinatra' unless defined?(Sinatra)

Dotenv.load

configure do
  # load models
  $LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")
  Dir.glob("#{File.dirname(__FILE__)}/lib/*.rb") { |lib| require File.basename(lib, '.*') }

  DataMapper.setup(:default, (ENV["DATABASE_URL"] || "postgres://dani:bukowski-on-sinatra-pass@localhost/bukowski-on-sinatra"))

  DataMapper.finalize
  DataMapper.auto_upgrade!
end
