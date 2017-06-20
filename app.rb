require 'rubygems'
require 'bundler'

Bundler.require

set :database, {adapter: "sqlite3", database: "bbs.sqlite3"}

get '/' do
  @threads = Thread.all
  erb :index
end

get '/thread_new' do
  erb :thread
end

post '/threads' do
  erb :thread
end
