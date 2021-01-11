class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def pending_orders
    @orders = Order.pending
  end

  def accepted
    @order = Order.find(params[:id])
    @order.update(status: :approved)
    flash[:notice] = 'Order accepted '
    redirect_to pending_orders_admin_orders_path
  end

  def rejected
    @order = Order.find(params[:id])
    @order.update(status: :rejected)
    flash[:notice] = 'Order rejected '
    redirect_to pending_orders_admin_orders_path
  end
end
