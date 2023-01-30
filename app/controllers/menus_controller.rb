class MenusController < ApplicationController
  def index
    if admin?
      @menus = Menu.all
      render json: @menus, status: :ok
    else
      render json: { error: 'You are not authorized to view this page' }, status: :unauthorized
    end
  end

  def create
    if admin?
      @menu = current_user.menus.new(menu_params)
      if @menu.save
        render json: { message: 'menu created' }, status: :ok
      else
        render json: { message: 'menu not created' }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Not an Admin' }, status: :unauthorized
    end
  end

  def destroy
    if admin?
      @menu = current_user.menus.find(params[:id])
      if @menu.destroy
        render json: { message: 'menu deleted' }, status: :ok
      else
        render json: { error: 'menu not deleted' }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Not an Admin' }, status: :unauthorized
    end
  end

  def categorized
    @menus = Menu.where(category: params[:category])
    render json: @menus, status: :ok
  end

  def home_menu
    @menus = Menu.all.limit(6)
    render json: @menus, status: :ok
  end

  private
  

  def menu_params
    params.permit(:name, :category, :price, :description, :image)
  end
end
