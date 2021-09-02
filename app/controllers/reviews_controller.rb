class ReviewsController < ApplicationController
    def create
        @post = Post.find params[:post_id]
        review_params = params.require(:review).permit(:body)
        @review = Review.new review_params
        @review.post = @post
        @review.user = current_user 
        
        @review.save
        if @review.persisted?
            redirect_to post_path(@post), notice: 'Review created!' 
        else
            redirect_to post_path(@post)  
        end
    end

    def destroy
        @review = Review.find params[:id]

        if can?(:crud, @review)
            @review.destroy
            redirect_to post_path(@review.post), notice: 'Review Deleted'
        else
            redirect_to root_path, alert: "Not authorized!"
        end
    end
end
