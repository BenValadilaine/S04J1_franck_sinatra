require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    erb :new_gossip
    Gossip.new(params["gossip_author"],params["gossip_content"]).save
    # La ligne en dessous est aussi valide :
    # Gossip.new(params[:gossip_author],params[:gossip_content]).save
    puts "Ce programme ne fait rien pour le moment, on va donc afficher un message dans le terminal."
    redirect '/'
  end

  get '/gossips/:id/' do
    erb :show, locals: {gossip: Gossip.find(params['id'])}
  end

  get '/gossips/:id/edit/' do
    erb :edit, locals: {gossip: Gossip.find(params['id'])}
  end

  post '/gossips/:id/edit/' do
    Gossip.update(params['id'])
    redirect '/'
  end
end
