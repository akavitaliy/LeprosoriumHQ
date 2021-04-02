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

