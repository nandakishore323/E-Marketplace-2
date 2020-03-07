class CommentsController < ApplicationController

  def create
    @product = Product.find(params[:id])
    @comment = @product.comments.create(params[:comment].permit(:body))
    redirect_to products_path(@product)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @product = @comment.product
    @comment.destroy
    redirect_to products_path(@product)
  end
end
