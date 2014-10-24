require 'compass'
require 'sinatra'
require 'data_mapper'
require_relative 'models/peeps.rb'

env = ENV["RACK_ENV"] || "development"
DataMapper.setup(:default, "postgres://localhost/finch_#{env}")

DataMapper.finalize
DataMapper.auto_upgrade!

class Finch < Sinatra::Base

  get '/' do
    slim :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
