class CartsController < ApplicationController

  def show
    # redirect_to store_path if params[:id].to_i != current_user.current_cart_id
    @cart = Cart.find(params[:id])
  
  end

  def checkout
    cart = Cart.find(params[:id])
    cart.checkout
    cart.save
    redirect_to cart_path(cart),  { notice: 'Checkout successful!'}
  end
end
