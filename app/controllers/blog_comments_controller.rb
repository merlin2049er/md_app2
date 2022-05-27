class BlogCommentsController < ApplicationController

  def create
    #create a new comment from the blog from the current user_signed_in

    @blog_comment = current_user.blog_comments.new(blog_comment_params)

    if !@blog_comment.save
      flash[:notice] = @blog_comment.errors.full_messages.to_sentence
    end

    redirect_to blogs_path

  end

  private

  def blog_comment_params
    params
      .require(:blog_comment)
      .permit(:comment)
      .merge(blog_id: params[:blog_id] )
  end

end
