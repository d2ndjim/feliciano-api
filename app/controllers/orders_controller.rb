class OrdersController < ApplicationController
  def create
    if logged_in?
      @already_ordered = Order.where(menu_id: order_params[:menu_id], user_id: current_user.id)
      if @already_ordered.blank?
        create_order
      else
        render json: { message: 'You already made this order.' }, status: :unprocessable_entity
      end
    else
      render json: { message: 'Please log in' }, status: :unauthorized
    end
  end

  def index
    return render json: { error: 'Please log in to access this page' }, status: :unauthorized unless logged_in?

    @orders = current_user.orders.all
    raise ActiveRecord::RecordNotFound unless @orders

    render json: @orders, status: :ok
  end

  def destroy
    if logged_in?
      @order = Order.find(params[:id])
      if @order.destroy
        render json: { message: 'order deleted' }, status: :ok
      else
        render json: { message: 'order not deleted' }, status: :unprocessable_entity
      end
    else
      render json: { message: 'Please log in' }, status: :unauthorized
    end
  end

  def all_orders
    if admin?
      @orders = Order.all.order(created_at: :desc)
      render json: @orders, status: :ok
    else
      render json: { message: 'Not an Admin' }, status: :unauthorized
    end
  end

  private

  def create_order
    @order = current_user.orders.new(order_params)
    if @order.save
      render json: { message: 'order created' }, status: :ok
    else
      render json: { message: 'order not created' }, status: :unprocessable_entity
    end
  end

  def order_params
    params.permit(:menu_id)
  end
end
