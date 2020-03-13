class ChargesController < ApplicationController
    before_action :find_product

    def new
    end

    def create
      # Amount in cents
      @amount = @product.price

      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )

      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @product.price,
        :description => @product.title,
        :currency    => 'inr'
      )

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end

    private

    def find_product
      @product = Product.find(params[:product_id])
    end
end
