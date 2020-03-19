class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :find_product

  def index
    @comments = @product.comments.order(created_at: :desc)
  end

  def create
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user
    @comment.user.avatar = current_user.avatar
    @comment.save
    session[:comment_id] = params[:id]
    redirect_to product_url(@product)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @product = @comment.product
    @comment.destroy
    redirect_to product_path(@product)
  end

  private
    def find_product!
      @product = Product.find(params[:product_id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end

end
