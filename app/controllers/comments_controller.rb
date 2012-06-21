#coding:utf-8
class CommentsController < ApplicationController

  before_filter :check_role,only: [:destroy]

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
    @post = Post.find params[:post_id]
    @comment = @post.comments.find params[:id]
    @comment.destroy
    flash["success"] = "已删除 #{@comment.name} 的评论"
    redirect_to :back
  end
end
