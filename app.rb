require 'rubygems'
require 'bundler'

Bundler.require

set :database, {adapter: "sqlite3", database: "bbs.sqlite3"}

get '/' do
  @now = DateTime.now
  erb :index
end
