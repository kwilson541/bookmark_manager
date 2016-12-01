ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'


class BookmarkManager < Sinatra::Base

    enable :sessions
    set :session_secret, 'super secret'
    register Sinatra::Flash

    get '/' do
        'Hello BookmarkManager!'
    end

    get '/links' do
        @links = Link.entries
        erb :links
    end

    get '/links/new' do
        erb :new
    end

    post '/links/add' do
        link = Link.create(url: params[:url], title: params[:title])

        params[:tags].split(', ').each do |tag|
            link.tags << Tag.first_or_create(name: tag)
        end

        link.save
        redirect '/links'
    end

    get '/tags/:name' do
        tag = Tag.first(name: params[:name])
        @links = tag ? tag.links : []
        erb :links
    end

    get '/users/new' do
        @user = User.new
        erb :new_user
    end

    post '/users' do
        @user = User.create(email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
        if @user.save
            session[:user_id] = @user.id
            redirect '/links'
        else
            flash.now[:notice] = "Password and confirmation password do not match"
            erb :new_user
        end
    end

    helpers do

        def current_user
            @current_user ||= User.get(session[:user_id])
        end

    end

    # start the server if ruby file executed directly
    run! if app_file == $0

end
