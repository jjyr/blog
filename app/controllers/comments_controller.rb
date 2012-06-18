class CommentsController < ApplicationController
  def create
    @post = Post.find_by_id params[:post_id]
    unless @post
      redirect_to posts_path
      return
    end
    @comment = @post.comments.build params[:comment]
    if @comment.save
      redirect_to @post
    else
      @comments = @post.comments.all
      render 'posts/show'
    end
  end

  def destroy
  end
end
