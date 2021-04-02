#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sqlite3'
require 'sinatra/contrib'
require 'sinatra/activerecord'
require 'rake'

set :database, {adapter: "sqlite3", database: "lepra.db"}

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School!!!</a>"			
end

class Post < ActiveRecord::Base
end

get '/new' do
	erb :new
end

