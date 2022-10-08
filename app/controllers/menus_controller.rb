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
      render json: { message: 'menu created'}, status: :ok
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

  def vegetarian
    @vegetarian = Menu.where(category: "Vegetarian")
    render json: @vegetarian, status: :ok
  end

  def non_vegetarian
    @non_vegetarian = Menu.where(category: "Non-Vegetarian")
    render json: @non_vegetarian, status: :ok
  end

  def dessert
    @desserts = Menu.where(category: "Dessert")
    render json: @desserts, status: :ok
  end

  def drink
    @drinks = Menu.where(category: "Drinks")
    render json: @drinks, status: :ok
  end

  def wine
    @wines = Menu.where(category: "Wines")
    render json: @wines, status: :ok
  end

  private

  def menu_params
    params.permit(:name, :category, :price, :description, :image)
  end
end
