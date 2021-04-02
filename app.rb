#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sqlite3'
require 'sinatra/contrib'
require 'sinatra/activerecord'
require 'rake'

set :database, {adapter: "sqlite3", database: "lepra.db"}

get '/' do
	erb :index
end

class Post < ActiveRecord::Base
end

get '/new' do
	erb :new
end

post '/new' do
	c = Post.new params[:post]
	c.seve
	erb :index
end

