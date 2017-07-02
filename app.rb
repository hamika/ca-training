require 'rubygems'
require 'bundler'

Bundler.require

set :database, {adapter: "sqlite3", database: "bbs.sqlite3"}

class BBS < ActiveRecord::Base
  has_many :comments
  validates_presence_of :name
  validates_presence_of :title
  validates_presence_of :body
end

class Comment < ActiveRecord::Base
end

get '/' do
  p params
  @bbs_thread = BBS.all
  erb :index
end

get '/new' do
  p params
  erb :thread
end

post '/thread' do
  p params
  @bbs_thread = BBS.new(params.slice(:name, :title, :body))
  # @bbs_thread = BBS.new({name:  params[:name], title: params[:title], body:  params[:body]})
  if @bbs_thread.save
    redirect '/'
  else
    erb :thread
  end
end

get '/thread/:id' do
  p params
  @bbs_thread = BBS.find(params[:id])
  erb :show
end

get '/edit/:id' do
  p params
  @bbs_thread = BBS.find(params[:id])
  erb :edit
end

post '/edit/:id' do
  p params
  @bbs_thread = BBS.find(params[:id])
  if @bbs_thread.update(params.slice(:name, :title, :body))
    redirect '/'
  else
    erb :edit
  end
  # @bbs_thread = BBS.find(params[:id])
  # @bbs_thread.name  = params[:name]
  # @bbs_thread.title = params[:title]
  # @bbs_thread.body  = params[:body]
  # if @bbs_thread.save
  #   redirect '/'
  # else
  #   erb :edit
  # end
end

get '/delete/:id' do
  p params
  @bbs_thread = BBS.find(params[:id])
  erb :delete
end

post '/delete/:id' do
  p params
  @bbs_thread = BBS.find(params[:id])
  if @bbs_thread.delete
    redirect '/'
  else
    erb :delete
  end
end

get '/comment/:id' do
  p params
  @bbs_thread = BBS.find(params[:id])
  erb :comment
end

post '/comment/:id' do
  p params
  @comment = Comment.new(params.slice(:name, :title, :body))
  if @comment.save
    redirect '/'
  else
    erb :comment
  end
end
