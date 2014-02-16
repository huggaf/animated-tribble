class Api::SessionController < ApplicationController
  skip_before_filter :restrict_access, only: :create

  def create
    attributes = params.require(:login).permit(:username, :password)

    user = User.find_by_username(attributes['username'])

    if user.present? && user.authenticate(attributes['password'])
      session[:user_id] = user.id
      render json: Oj.dump(UserSerializer.new(user))
    else
      render json: {errors: ["Usuário e/ou senha inválidos"]}, status: :unauthorized
    end
  end

  def destroy
    session[:user_id] = nil
    head :ok
  end
end
