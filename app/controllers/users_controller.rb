require 'uri'
require 'net/http'

class UsersController < ApplicationController
  # only use authorized if autologin route
  before_action :authorized, only: [:auto_login]

  # REGISTER
  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end

  # LOGGING IN
  def login
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end

  # Generates a cardscan.ai token for logged-in user and returns it.
  def cardscan_session    
    uri = URI("https://sandbox.cardscan.ai/v1/access-token")
    params = {
      :user_id => decoded_token   #matches what logged_in user method is checking for in applicaton_controller
    }
    #https://ruby-doc.org/stdlib-3.1.1/libdoc/net/http/rdoc/Net/HTTP.html
    req = Net::HTTP::Get.new(uri)
    req.form_data = params
    req['Authorization'] = "Bearer #{ENV["CARDSCAN_AI_KEY"]}"
    res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https' ) { |http|
      http.request(req) 
    }
    
    if res.msg == "OK"
      render json: {
        res: res,
        token: JSON.parse(res.body)
      }
    else
      render json: {
        res: res,
        error: res.msg
      }
    end    
  end
  
  def auto_login
    render json: @user
  end
  
  private
  
  def user_params
    params.permit(:username, :password, :age)
  end
  
end