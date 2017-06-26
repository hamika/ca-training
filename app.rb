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
  p params
  @bbs_threads = BBS.all
  erb :index
end

get '/thread_new' do
  p params
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
  p params
  @bbs_thread = BBS.find(params[:id])
  erb :show
end

get '/edit/:id' do
  p params
  @bbs_thread = BBS.find(params[:id])
  if @bbs_thread.update({name:  params[:name],
                         title: params[:title],
                         body:  params[:body]})
    redirect '/'
  else
    erb :edit
  end
end

post '/edit/:id' do
  p params
  @bbs_thread = BBS.find(params[:id])
  erb :edit
end

get '/delete/:id' do
  p params
  @bbs_thread = BBS.find(params[:id])
  erb :delete
end
