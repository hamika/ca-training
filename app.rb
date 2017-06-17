require 'rubygems'
require 'bundler'

Bundler.require

get '/' do
  @now = DateTime.now
  erb :index
end
