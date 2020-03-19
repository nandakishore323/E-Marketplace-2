class UserController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def show
    @products = @user.products
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :avatar)
  end
end
