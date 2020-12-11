require 'sinatra/base'
require './config/environment.rb'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
        erb :super_hero
    end

    post '/teams' do
        @team = Team.new(params[:team])
        params[:team][:superheroes].each do |data|
            Superhero.new(data)
        end
        @superheroes = Superhero.all
        erb :team
    end
end
