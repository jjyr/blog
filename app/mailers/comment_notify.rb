#coding:utf-8
class CommentNotify < ActionMailer::Base
  default from: "caniceric@gmail.com"
  add_template_helper ApplicationHelper
  add_template_helper CommentsHelper

  AdminMail = User.first.email

  def new_comment comment
    @comment = comment
    mail to: AdminMail,subject: "ruby-tips新评论 #{comment.name}说:#{comment.body[0,10]}.."
  end  
end
