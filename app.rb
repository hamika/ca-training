require 'rubygems'
require 'bundler'

Bundler.require

set :database, {adapter: "sqlite3", database: "bbs.sqlite3"}

class BBS < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :title
  validates_presence_of :body
end

get '/' do
  @bbs_threads = BBS.all
  erb :index
end

get '/thread_new' do
  erb :thread
end

post '/threads' do
  p params
  @bbs_thread = BBS.new({name:  params[:name],
                         title: params[:title],
                         body:  params[:body]})
  if @bbs_thread.save
    redirect '/'
  else
    erb :thread
  end
end

get '/threads/:id' do
  @bbs_thread = BBS.find(params[:id])
  erb :show
end
