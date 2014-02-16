class Api::UsersController < ApplicationController
  skip_before_filter :restrict_access, only: :create

  def show
    render json: Oj.dump(UserSerializer.new(current_user))
  end

  def create
    attributes = params.require(:user).permit(:username, :password, :password_confirmation)

    user = User.create(attributes)
    if user.persisted?
      session[:user_id] = user.id
      render json: Oj.dump(UserSerializer.new(user))
    else
      render json: Oj.dump(UserSerializer.new(user)), status: :unprocessable_entity
    end
  end

end
