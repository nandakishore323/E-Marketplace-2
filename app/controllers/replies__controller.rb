class RepliesController < ApplicationController
    before_action :authenticate_user!, except: [:index]
    before_action :find_listing!

    def index
        @replies = @listing.comments.order(created_at: :desc)
    end

    def create
        @reply = @listing.comments.new(comment_params)
        @reply.user = current_user
        @reply.user.avatar = current_user.avatar
        @reply.save
        redirect_to listing_path(@listing)
    end

    private
    def find_listing!
        @listing = Listing.find(params[:listing_id])
    end

    def comment_params
        params.require(:reply).permit(:reply_body)
    end
end

