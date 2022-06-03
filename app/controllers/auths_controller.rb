class AuthsController < ApplicationController
  def create
    hmac_secret = "shi_é_segredo"
    payload = { name: params[:name], exp: Time.now.to_i + 6000 }
    token = JWT.encode payload, hmac_secret, 'HS256'
    render json: { token: token }
  end 
end
