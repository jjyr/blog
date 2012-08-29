#coding:utf-8
class CommentsController < ApplicationController

  before_filter :check_role,only: [:destroy]

  cache_sweeper :comment_sweeper

  def create
    @post = Post.find_by_id params[:post_id]
    @comment = @post.comments.build params[:comment]

    @comment.toggle :by_admin if admin?
    @comment.ip = request.remote_ip

    if @comment.save
      CommentNotify.new_comment(@comment) unless @comment.by_admin?
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
