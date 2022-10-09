class UsersController < ApplicationController
  def create
    if User.find_by_email(user_params[:email])
      render json: { error: 'Email Exist , try a diffrent one' }, status: :not_acceptable
    else
      user = User.new(user_params)
      if user.save
        token = issue_token(user)
        render json: { user: UserSerializer.new(user), jwt: token }
      elsif user.errors.messages
        render json: { error: user.errors.messages }
      else
        render json: { error: 'User could not be created. Please try again' }
      end
    end
  end

  def index
    if admin?
      @users = User.where.not(id: current_user.id)
      render json: @users, status: :ok
    else
      render json: { error: 'Not Allowed' }, status: :unauthorized
    end
  end

  def update
    if admin?
      @user = User.find(params[:id])
      if @user.update(update_params)
        render json: { message: 'user updated', status: :updated }
      else
        render json: { message: 'Email already exists' }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Not Allowed' }, status: :unauthorized
    end
  end

  def destroy
    if admin?
      @user = User.find(params[:id])
      if @user == current_user
        render json: { message: 'Can not delete current user' }, status: :unprocessable_entity
      elsif @user.destroy
        render json: { message: 'user deleted', status: :destroyed }, status: :ok
      else
        render json: { message: 'user not deleted' }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Not Allowed' }, status: :unauthorized
    end
  end

  private

  def update_params
    params.permit(:first_name, :last_name, :role, :email, :password)
  end

  def user_params
    params.permit(:first_name, :last_name, :email, :password)
  end
end
