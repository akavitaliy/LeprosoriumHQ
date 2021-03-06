#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sqlite3'
require 'sinatra/contrib'
require 'sinatra/activerecord'
require 'rake'

set :database, {adapter: "sqlite3", database: "lepra.db"}

class Post < ActiveRecord::Base
	validates :post_name, presence: true
	validates :content, presence: true
end

class Comment < ActiveRecord::Base
	validates :comment_name, presence: true
	validates :message, presence: true
end

get '/' do
	@all_posts = Post.order "created_at DESC"
	erb :index
end

get '/new' do
	erb :new
end

post '/new' do
	@c = Post.new params[:post]

	if @c.save
		erb "Спасибо!"
	else
		@error = @c.errors.full_messages.first
		erb :new
	end
end

get '/details/:id' do	
	post_id = params[:id]

	@comments = Comment.where(post_id: "#{post_id}")

	@post = Post.find(params[:id])
	
	erb :details
end

post "/details/:post_id" do
	post_id = params[:post_id]
	@post = Post.find(params[:post_id])
	
	@p = Comment.new params[:comments]
	@p.post_id = params[:post_id]
	
	if @p.save
		redirect to ('/details/' + post_id)
	else
		@error = @p.errors.full_messages.first
		erb :details	
	end
end

