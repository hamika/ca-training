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
  belongs_to :bbs
  validates_presence_of :bbs_id
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
  @bbs_thread = BBS.new(params.slice(:name, :title, :body))
  # @bbs_thread = BBS.new({name:  params[:name], title: params[:title], body:  params[:body]})
  if @bbs_thread.save
    redirect '/'
  else
    erb :thread
  end
end

get '/threads/:id' do
  p params
  @bbs_thread = BBS.find(params[:id])
  @comments = Comment.where(bbs_id: @bbs_thread)
  # @comments = Comment.where(params[bbs_id: @bbs_threads])
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

post '/threads/:id/comments' do
  p params
  @bbs_thread = BBS.find(params[:id])
  @comments = Comment.new(bbs_id: params[:id],
                          name:   params[:name],
                          title:  params[:title],
                          body:   params[:body])
  if @comments.save
    redirect '/'
  else
    erb :comment
  end
end

post '/clones/:id' do
  bbs = BBS.find(params[:id])
  ary = Array.new
  ary << bbs.name
      << bbs.title
      << bbs.body
  ary.shuffle!
  copy_obj = BBS.new(name:  ary[0],
                     title: ary[1],
                     body:  ary[2])
  # copy_obj = BBS.new(name:   bbs.name,
  #                    title:  bbs.title,
  #                    body:   bbs.body)
  if copy_obj.save
    redirect '/'
  else
    erb :index
  end
end
