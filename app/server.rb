require 'compass'
require 'sinatra'
require 'data_mapper'
require_relative 'models/peeps.rb'

env = ENV["RACK_ENV"] || "development"
DataMapper.setup(:default, "postgres://localhost/finch_#{env}")

DataMapper.finalize
DataMapper.auto_upgrade!

class Finch < Sinatra::Base

  enable :sessions

  get '/' do
    @peeps = Peep.all
    haml :index
  end

  post '/peeps' do
    content = params["content"]
    Peep.create(:content => content)
    redirect.to('/')
  end

  # post '/' do
  #   content = params["content"]
  #   Peep.create(:content => content)
  #   @peeps = Peep.all
  #   haml :index
  # end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
