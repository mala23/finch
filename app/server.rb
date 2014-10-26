require 'compass'
require 'sinatra'
require 'data_mapper'
require 'json'
# require 'flavour_saver'
require_relative 'models/peeps.rb'

env = ENV["RACK_ENV"] || "development"
DataMapper.setup(:default, "postgres://localhost/finch_#{env}")

DataMapper.finalize
DataMapper.auto_upgrade!

class Finch < Sinatra::Base

  enable :sessions

  get '/' do
    # @peeps = Peep.all
    erb :layout
  end

  get '/api/peeps' do
    content_type :json
    peeps = Peep.all
    return peeps.to_json
  end

  post '/api/peeps/compose' do
    @peeps = Peep.new(:content => params[:content])

    if @peeps.save
      @peeps.to_json
    else
      halt 500
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
