require 'rubygems'
require 'bundler'

Bundler.require

set :database, {adapter: "sqlite3", database: "bbs.sqlite3"}

class BbsThread < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :body
end

get '/' do
  @bbs_threads = BbsThread.all
  erb :index
end

get '/thread_new' do
  erb :thread
end

post '/threads' do
  erb :thread
end
