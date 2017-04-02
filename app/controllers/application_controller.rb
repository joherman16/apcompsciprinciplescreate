require './config/environment'
require_relative '../models/model.rb'
require 'pry'

class ApplicationController < Sinatra::Base
    
    configure do
        set :views, 'app/views'
    end
    
    get '/' do
        erb :index
    end
    
    post '/weather' do
        hash = format_request_and_send_api_call(params[:location])
        @location = params[:location]
        
        @weather = {temperature: hash["main"]}
        
        erb :weather
    end
    

end