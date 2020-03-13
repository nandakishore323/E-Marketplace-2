class ChargesController < ApplicationController
    before_action :authenticate_user

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

      flash[:notice] = "Thankyou for purchasing #{@product.title}, Your payment has been recieved"
      redirect_to products_path

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end

end
