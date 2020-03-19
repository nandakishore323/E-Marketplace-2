class RepliesController < ApplicationController
    before_action :authenticate_user!
    # before_action :find_product!
    before_action :find_comment!

    def new
      @reply = Reply.new
    end

    def create
        @reply = @comment.build_reply(reply_params)
        @reply.save
        redirect_to product_path(@product)
    end

    private
    # def find_product!
    #     @product = Product.find(params[:product_id])
    # end


    def find_comment!
        @comment = Comment.find(params[:comment_id])
    end

    def reply_params
        params.require(:reply).permit(:reply_body)
    end
end
